---
title: 'Programs'
description: 'Manage BPF programs with bpftool'
weight: 10
---

# Debug output

The `--debug` (or `-d` for short) option tells bpftool to print debug-level
information from libbpf and (when attempting to load programs) from the kernel
verifier, even when all steps succeed.

# Listing programs

List all eBPF programs currently loaded on the system with:

```console
# bpftool prog show
```

or

```console
# bpftool prog list
```

The two commands are strictly equivalent.

You can show information for a specific program, for example by passing its id
(on the screenshot below, program ids are the integers displayed on the left
column on the list):

```console
# bpftool prog show id 27
```

Keep in mind that a program which is loaded in the kernel is not necessarily
attached (hence not necessarily running). Loading and attaching the program are
two separate steps.

# Dumping programs

## Translated instructions

Dump the bytecode for a program loaded on the system, as "translated"
instructions:

```console
# bpftool prog dump xlated id 40
```

"Translated" means that the bytecode is taken after kernel rewrites (as opposed
to the output from `llvm-objdump -d my_program_objfile.o`). This is available
for all programs, even if the JIT-compiler is enabled.

## JIT-compiled instructions

The JIT-compiled instructions for an eBPF program (below from its pinned
handle) are available with:

```console
# bpftool prog dump jited pinned /sys/fs/bpf/foo
```

Obviously, this works only for programs loaded when JIT-compiling is enabled.

The second illustration is a dump from a sample used for hardware offload with
Netronome's SmartNICs.

# Pinning programs

Let's pin a program to the eBPF virtual file system, so we can keep it loaded
once detached:

```console
# bpftool prog pin id 27 /sys/fs/bpf/foo_prog
```

The pinned path can be removed with a simple `rm`:

```console
# rm /sys/fs/bpf/foo_prog
```

This also works for maps. Details on pinning and on the lifetime of eBPF
objects are available on [this
post](https://facebookmicrosites.github.io/bpf/blog/2018/08/31/object-lifetime.html).

# Listing pinned paths

The pinned paths for a program, if any, can be displayed when listing the
programs by passing the `--bpffs` (or `-f` for the short version) option. This
also applies to eBPF maps.

```console
# bpftool prog show --bpffs
# bpftool -f map
```

# Attaching programs

Attaching programs with bpftool is somewhat tricky. There are several
subcommands providing an `attach` feature. They all attach programs, the
difference is that they work with different program types. Not all program
types are supported: as of this writing, attaching tracing program is not
possible with bpftool.

Once loaded, programs of the relevant types can be attached to sockets with:

```console
# bpftool prog attach <program> <attach type> <target map>
```

For attaching programs to cgroup, the command differs:

```console
# bpftool cgroup attach <cgroup> <attach type> <program> [flags
```

And like `ip link`, bpftool can attach programs to the XDP hook (and later
detach them):

```console
# bpftool net attach xdp id 42 dev eth0
# bpftool net detach xdp dev eth0
```

The `xdpgeneric`/`xdpdrv`/`xdpoffload` variants for generic XDP (_a.k.a_ SKB
XDP), driver XDP (_a.k.a_ native XDP), or XDP hardware offload, are also
supported.

# Advanced program loading

## Reusing maps

Load a program, but reuse for example two existing maps (instead of
automatically creating new ones):

```console
# bpftool prog load foo.o /sys/fs/bpf/foo_prog \
        map idx 0 id 27 \
        map name stats pinned /sys/fs/bpf/stats_map
```

where `idx 0` is the index of the map in the ELF program file.

## Loading several programs

For object files with more than one program, bpftool can load all of them
at once:

```console
# bpftool prog loadall bpf_flow.o /sys/fs/bpf/flow type flow_dissector
```

This is especially useful when working with tail calls. Maps can be pinned by
adding `pinmaps <directory path in bpffs>`.

# BTF for programs

BTF (_BPF Type Format_) is a format to store debugging information about eBPF
or kernel objects. One of the use cases is to embed the C instructions that
were used to compile a program into eBPF bytecode. The C source code, loaded
into the kernel as a BTF object along with the program, is available to bpftool
in addition to the regular translated or JIT-ed instructions:

This requires:

- Passing the `-g` flag to clang when compiling the program.
- clang/LLVM version 8 or newer (some older versions may work with some
  tinkering with pahole).

When BTF information is available for a program, adding the `linum` keyword
also prints the name of the C source file and the line numbers related to the
converted instructions. This may be helpful to remember where a program was
compiled from.

```console
# bpftool prog dump xlated id <id> linum
```

# Programs statistics

Linux 5.1 introduced statistics for attached eBPF programs: it can collect the
total run time and the run count for each program. When available, this
information is displayed by bpftool when listing the programs:

```console
# bpftool prog show
```

But gathering statistics slightly impacts performance of the program execution
(~10 to 30 nanoseconds per run), so it is disabled by default. Activate it
with:

```console
# sysctl -w kernel.bpf_stats_enabled=1
```

# Advanced program listing

## Reference by name

Program names can be used on the command line to tell bpftool what eBPF program
to work with (as an alternative to program ids, tags, or related pinned path in
the eBPF virtual file system):

```console
# bpftool prog show name loadbalancer
```

## Processes PIDs

In addition to the usual information displayed on program listings, recent
versions of bpftool became capable of collecting the PIDs of the processes
holding file descriptors to the eBPF programs. This also applies to other eBPF
objects (maps, links, BTF objects).

```console
# bpftool prog show
# bpftool map
# bpftool link
# bpftool btf
```

This requires that the kernel running on the system has been compiled with BTF
information, and bpftool with the use of a "skeleton".

## Program metadata

Linux 5.10 introduced the possibility to [attach custom metadata to eBPF
programs](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ffa915f46193b6be780483c8d31cc53f093f6d9a).
Of course, bpftool will dump this data when listing programs.

The [Capture-The-Flag challenge of the eBPF Summit
2021](https://ebpf.io/summit-2021/ctf/) featured a nice use case for this: it
embedded some top-secret information as metadata to display with bpftool.
