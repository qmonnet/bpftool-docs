---
title: 'Cross-compilation'
description: 'Cross-compile bpftool for a different architecture'
weight: 60
---

You can cross-compile bpftool by making the `CC`, `LD` and `AR` variables for
the `Makefile` point to the compiler, linker, and archiver utility to use for
the guest architecture.

For example, compiling on x86\_64 for aarch64:

```console
$ arch='aarch64-linux-gnu'
$ CC=${arch}-gcc LD=${arch}-ld AR=${arch}-ar make
```

When [support for skeletons][features-skeleton] is selected, the `Makefile`
also uses the toolchain for the host, where bpftool is being compiled, in order
to build the intermediary "bootstrap" version of bpftool required to generate
skeletons and build the final version. The compiler, linker, and archiver
should be picked up automatically. If needed, you can pass them to `make` with
`HOSTCC`, `HOSTLD`, and `HOSTAR`, respectively.

[features-skeleton]: {{% relref "features" %}}
