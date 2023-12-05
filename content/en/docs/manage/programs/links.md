---
title: 'Links'
description: 'Manipulate BPF links with bpftool'
weight: 30
---

Linux's [eBPF link](https://lore.kernel.org/bpf/20200228223948.360936-1-andriin@fb.com/)
abstraction is used to represent and manage links between programs and hooks.
And bpftool can show or pin such links:

```console
# bpftool link show
# bpftool link pin id 27 /sys/fs/bpf/my_link
```
