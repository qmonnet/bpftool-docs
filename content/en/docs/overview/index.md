---
title: 'Overview'
description: 'Get started with bpftool'
weight: 1
---

Welcome to bpftool's documentation! Bpftool is a command-line utility to
inspect, manage, and work with BPF objects on Linux systems.

## Install bpftool

Refer to the [Installation][install] section of this documentation to get a
working version of bpftool on your system. Once bpftool is available, remember
that you can get help on the existing subcommands by running:

```console
$ bpftool help
```

You can also get help on specific subcommands, for example for the `prog` subcommand:

```console
$ bpftool prog help
```

## Inspect and manage BPF objects

One of the most common use cases for bpftool is to list or dump BPF programs or
maps that are present on the system. For example, you can get a list of
programs with:

```console
# bpftool prog list
```

Or you can get a list of the existing BPF maps with:

```console
# bpftool map list
```

Here is an example of a program dump:

```console
# bpftool prog dump xlated name return_0
```

See the section on how to [Manage BPF objects][manage] for a description of the
related subcommands.

## Build BPF resources with bpftool

Some other use cases fall into a second category: BPF developers may integrate
bpftool into their workflow, in order to generate "BPF skeletons" for
bootstrapping applications, to link separate BPF object files, or to produce
specific BTF objects. More details are available in section [Build with
bpftool][workflow].

## Other bpftool features

The third section, [Extra features][extra], introduces additional
functionalities of bpftool that address more specific use cases, such as
profiling BPF programs or probing the host for supported BPF features.

[install]: {{< ref "docs/installation" >}}
[manage]: {{< ref "docs/manage" >}}
[workflow]: {{< ref "docs/workflow" >}}
[extra]: {{< ref "docs/extra" >}}

## Conventions

- Througout this documentation, "BPF" designates "eBPF", and not the older,
  "classic BPF" (cBPF) traditionally used with tcpdump or seccomp.

- Several command descriptions in this documentation are illustrated with code
  blocks. Commands in these blocks start with a prompt symbol, `$` or `#`. A
  dollar prompt (`$`) means that regular, unprivileged users can run the
  command. A hash prompt (`#`) signifies that the command requires elevated
  privileges, and usually needs to be run as `root`.
