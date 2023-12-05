---
title: 'Struct ops'
description: 'Use bpftool to manage "struct ops" BPF programs'
weight: 30
---

[“Struct ops” programs](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=27ae7997a661)
are eBPF programs replacing specific sets of operations in the kernel. One
example use case is the implementation of custom algorithms for congestion
control for TCP, by substituting an eBPF program to the kernel's `struct
tcp_congestion_ops`. From the command-line, bpftool can list, dump, register
and unregister such “struct ops” programs:

```console
# bpftool struct_ops …
```

Refer to the relevant man page https://www.mankier.com/8/bpftool-struct_ops
for the details on the different commands.
