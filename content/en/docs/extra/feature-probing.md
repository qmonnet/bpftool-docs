---
title: 'Feature probing'
description: 'Use bpftool to probe for BPF-related features on the system'
weight: 50
---

Feature probing is useful to see what eBPF-related features are supported on
the system.

```console
# bpftool feature probe kernel
```

The command dumps a list of eBPF-related kernel configuration options and
sysctl values, as well as the availability of the `bpf()` system call,
supported eBPF program and map types, and supported helper functions for the
system.

In addition to the plain output and JSON, the list of features can be dumped as
a set of macros, ready to be included into a C header file and to be reused in
a project.

```console
# bpftool feature probe kernel macros [prefix <namespace_prefix>]
```

Hardware offload compatibility
==============================

eBPF hardware offload works well with bpftool, and it can list, load, dump,
etc. the programs and maps offloaded to a SmartNIC. It can also probe
eBPF-related features supported by the hardware:

```console
# bpftool feature probe dev <ifname>
```
