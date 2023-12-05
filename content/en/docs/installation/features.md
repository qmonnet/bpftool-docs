---
title: 'Build features'
description: "Understand bpftool's optional dependencies and features"
weight: 80
---

## Build-time dependencies for bpftool

Some of bpftool's build dependencies are optional. At build time, the build
system probes the host for availability of all optional dependencies, and uses
the one it finds. If some optional dependencies are not available at build
time, then some functionalities may be left out.

When running `make`, the build system prints the main dependencies or features
it detects:

```console
$ make -C src
make: Entering directory '/tmp/bpftool/src'
...                        libbfd: [ on  ]
...               clang-bpf-co-re: [ on  ]
...                          llvm: [ on  ]
...                        libcap: [ on  ]
```

The following table summarizes the main dependencies and features for bpftool:

| Name (build system) | Name (`bpftool version`) | Requirement               | Runtime feature |
| ------------------- | ------------------------ | ------------------------- | --------------- |
| clang-bpf-co-re     | skeletons                | clang with CO-RE support  | PID of processes with references to BPF programs and maps (`bpftool prog list`, `bpftool map list`) |
| libbfd              | libbfd                   | libbfd (and dependencies) | disassembler for JIT-compiled programs |
| llvm                | llvm                     | LLVM library              | disassembler for JIT-compiled programs |
| libcap              |                          | libcap                    | fine-grained capability check |

## Main optional dependencies and features

### Clang and BPF CO-RE

This feature appears as `clang-bpf-co-re` in the build system's output. It appears as `skeletons` in the output of `bpftool version`.

This feature is enabled if the build system finds a version of `clang` with support for CO-RE.

If not available, the following features will be unavailable at runtime:

- Printing the PID of processes holding file descriptiors to BPF programs and
  maps, when listing programs and maps with `bpftool prog list` or `bpftool map
  list`.
- Profiling BPF programs with `bpftool prog profile`.

Read along for more details.

To execute some tasks, bpftool loads BPF programs at runtime. These BPF
programs need to be embedded into the bpftool binary, thanks to BPF
"skeletons". This means that, when the feature is available, bpftool is built
in two steps. First, a "bootstrap" version generates the required skeletons,
and then, these skeletons are used with the other object files to build the
final binary. Using BPF programs and skeletons also means that the build system
must be able to compile BPF programs in the first place, and to use CO-RE to
adjust them to the host. In order to achieve this, the build system requires a
version of clang with support for CO-RE.

How are these BPF programs used? To list the PID of processes associated to BPF
programs and maps, bpftool loads a BPF iterator to loop over the existing
processes and find those with references to BPF objects. To profile BPF
programs, bpftool attaches specific BPF programs at the entry and the exit of
the monitored BPF programs.

### Disassembler for JIT-compiled programs

These dependencies show as either `llvm` or `libbfd` in both the output from the build system and the output from `bpftool version`.

If none of these are present, dumping instructions for JIT-compiled BPF programs with `bpftool prog dump jited` will not be available with bpftool.

To satisfy the dependency, install one of:

- The LLVM library (often packaged as `llvm-dev`)
- libbfd (often packaged as `binutils-dev`)

Read along for more details.

Bpftool does not implement a disassembler for every architecture. To
disassemble JIT-compiled BPF programs, it relies on existing libraries. It
supports both LLVM and libbfd, and defaults to LLVM if both are present on the
system.

{{% alert title="Note" color="note" %}}
The build system may print both `libbfd` and `llvm` as enabled if both dependencies are available, but will use only one of them when compiling the binary. The output of `bpftool version` shows what disassembler, if any, is included in bpftool.
{{% /alert %}}

Note that depending on the system, libbfd may in turn require additional
dependencies, such as liberty. These dependencies are usually shipped together
with libbfd.

## Internal behavior adjustments

Some additional probes are run at build time, but they do not, or nearly not,
affect the way the binary runs. These probes include:

- Probing for availability of libcap, to allow more accuracy when determining
  whether bpftool has the right privileges for some operations. If the library
  is not present, bpftool falls back on checking whether the user is `root`.
  Support for libcap in bpftool is displayed by the build system as `libcap`,
  but it is not printed in the output of `bpftool version`. It can still be
  observed with `ldd bpftool`.
- Probing to determine the libraries and function invocations to use with
  libbfd. Different libbfd setups (typically from different Linux
  distributions) require linking against different libraries, such as liberty
  and zlib. Different versions of libbfd also introduced different,
  non-backward compatible prototypes for the functions required by bpftool, and
  the build system works around these changes by determining the right
  interface to use.
