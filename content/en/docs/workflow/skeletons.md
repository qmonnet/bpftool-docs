---
title: 'Generating BPF skeletons'
description: 'Generate skeletons for user space programs to manage BPF programs'
weight: 10
---

# User application skeleton

A "skeleton" header file helps create user space applications that can manage a
given eBPF program. By passing the eBPF object file to bpftool, we can ask it
to generate the relevant skeleton:

```console
$ bpftool gen skeleton bpf_prog.o > user_prog.h
```

The application can then `#include "user_prog.h"`.

More details in `the relevant man page <https://www.mankier.com/8/bpftool-gen>`__.

# Lightweight skeleton

With the `-L` option, bpftool works with "lightweight skeletons" using specific
eBPF programs to call the `bpf()` system call from the kernel side and to load
other eBPF objects!

```console
$ bpftool gen skeleton -L prog.o
```

Debug with:

```console
# bpftool prog load -d -L prog.o
```

More details in [the relevant commit
log](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d510296d331a)
or [on LWN.net](https://lwn.net/Articles/853489/).

