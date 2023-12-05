---
title: 'Batch mode'
description: "Use bpftool's batch mode to group multiple operations"
weight: 100
---

There is a batch mode in bpftool for running several commands at once:

```console
# bpftool batch file <file>
```

It can read commands from standard input if `<file>` is `-`:

```console
# echo 'prog show \n map show \n net show' | bpftool batch file -
```

Use `#` at the beginning of lines in the batch file to denote comments.
