---
title: 'Static linking'
description: 'Use bpftool to statically link BPF programs from multiple object files'
weight: 20
---

This is a recent addition as I write this post, but surely this is an extremely
important one. Libbpf can do static linking of multiple ELF object files
containing eBPF objects, and bpftool provides a front-end for it.

```console
$ bpftool gen object output.o input1.o input2.o ...
```

The multiple input ELF object files are linked and merged into a single
`output.o` ELF object file. This makes it possible to link functions,
subprograms, ..., defined in independent object files. Should we expect eBPF
libraries coming soon?
