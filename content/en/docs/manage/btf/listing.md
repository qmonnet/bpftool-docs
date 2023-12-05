---
title: 'List BTF'
description: 'Use bpftool to list BTF objects'
weight: 10
---

Besides using the BTF information associated with programs or maps when dumping
them, bpftool can list BTF objects directly. BTF objects can contain
information on a program, on a map, on the kernel or on a module (the
associated program or map does not have to be loaded into the kernel for the
BTF object to exist). They serve for several use cases.

```console
# bpftool btf show
```

Listing BTF objects on the system with bpftool even accounts for BTF
information for the kernel and its modules, if available.

On the illustration below, note the names for the kernel (`vmlinux`) and the
modules, and the `<anon>` (anonymous) names for BTF objects related to programs
and maps.
