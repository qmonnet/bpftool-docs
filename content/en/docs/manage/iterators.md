---
title: 'Iterators'
description: 'Use bpftool to manage BPF iterators'
weight: 40
---

[eBPF “iterators
<https://lore.kernel.org/bpf/20200509175859.2474608-1-yhs@fb.com/T/#u>] use
`seq_ops` to help iterate on kernel data (think `/proc`-like information
created with eBPF. To work with such iterators, bpftool has a specific `iter`
subcommand.

```console
# bpftool iter pin <objfile.o> <bpffs_path>
# cat <bpffs_path>
```

Iterators are referenced in the kernel by eBPF links. While bpftool does not
support listing iterators directly, they can be found in the lists of loaded
programs or of existing links. The latter provides additional context
information, such as the target's name and map id.
