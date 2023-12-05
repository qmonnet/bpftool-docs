---
title: 'Trace dump'
description: 'Dump trace logs from BPF programs with bpftool'
weight: 60
---

Dumping the trace pipe
======================

When using the `bpf_trace_printk()` helper, a program will print its output to
the trace pipe at `/sys/kernel/debug/tracing/trace_pipe`, and the user can
retrieve the logs by reading the file. But the name of the file is not so easy
to remember. As an alternative, bpftool offers a way to dump the trace pipe:

```console
# bpftool prog tracelog
```

It's also shorter to type than

```console
# cat /sys/kernel/debug/tracing/trace_pipe
```

For the record, this is based after a similar feature in iproute2, `tc exec bpf
dbg`.

Dumping a perf event pipe
=========================

More complex to use than `bpf_trace_printk()`, but more flexible and much
faster, perf events can be used to stream data to user space. And bpftool can
dump this data:

```console
# bpftool map event_pipe <MAP> [cpu <N> index <M>]
```

See also [the description for the bpf_perf_event_output() helper](https://man7.org/linux/man-pages/man7/bpf-helpers.7.html).

More efficient than the event pipe is now the eBPF ring buffer, but bpftool
does not support it as of this writing.
