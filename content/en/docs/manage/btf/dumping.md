---
title: 'Dump BTF'
description: 'Use bpftool to dump BTF objects'
weight: 20
---

The BTF objects loaded on the system can be dumped with bpftool. In addition,
bpftool can extract and dump the BTF information contained in an ELF object
file.

```console
# bpftool btf dump <btf_source>
```

More details are available from [the relevant man
page](https://www.mankier.com/8/bpftool-btf).
