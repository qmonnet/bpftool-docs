---
title: 'JSON output'
description: "Use bpftool's JSON output"
weight: 90
---

The output of bpftool can be formatted as JSON. The ``--jon`` (``-j`` for
short) switch enables JSON. The ``--pretty`` (or ``-p``) option enables JSON as
well, but also makes it human-readable by inserting line breaks and
indentation. Here is an example for retrieving information on a program.

Avoid grepping patterns from bpftool's plain output, especially in scripts.
Always prefer the JSON output, which is more stable and consistent. Use
[jq](https://stedolan.github.io/jq/): for example, we can get the IDs of all
XDP programs attached to `eth0` with:

```console
# bpftool -j net show | \
    jq '.[].xdp[]|select(.devname == "eth0")|.id // .multi_attachments[].id'
```
