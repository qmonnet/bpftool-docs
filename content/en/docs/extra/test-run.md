---
title: 'Test run'
description: 'Manually test BPF programs'
weight: 10
---

`BPF_PROG_TEST_RUN` is a command for the `bpf()` system call. It is used to
manually trigger a “test” run for a program loaded in the kernel, with specific
input data (for example: packet data) and context (for example: `struct
__sk_buff`). It returns the output data and context, the return value of the
program, and the duration of the execution. Although this feature is not
available to all program types, bpftool can use it to test-run programs:

```console
# bpftool prog run PROG data_in <file> data_out <file>
```

More options on the format for the input data and context, and for the
additional argument, are available from
[the man page](https://www.mankier.com/8/bpftool-prog).
