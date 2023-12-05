---
title: 'Libbpf'
description: 'A C/C++ library to manipulate and manage BPF objects'
weight: 40
---

Note that bpftool does not implement low-level eBPF handling itself. Most of
the magic comes from libbpf. This library is [shipped with the
kernel](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/bpf)
and [mirrored on GitHub](https://github.com/libbpf/libbpf). Check it out if you
need to manage eBPF objects in C or C++.
