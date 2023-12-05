---
title: 'Profiling'
description: 'Use bpftool to profile BPF programs for performance'
weight: 20
---

It is possible to profile eBPF… with eBPF! Recent bpftool versions can attach
programs (of types “fentry” or “fexit”) to the entry or exit of other eBPF
programs and use perf events to collect statistics on them.

```console
# bpftool prog profile <prog> <metrics>
```

This screenshot is from [the man page](https://www.mankier.com/8/bpftool-prog).

This requires that the kernel running on the system has been compiled with BTF
information, and bpftool with the use of a “skeleton”.

Here is another example, featuring two metrics that were more recently added:
ITLB and DTLB misses for a running eBPF program ([Instruction/Data Translation
Lookaside Buffer](https://en.wikipedia.org/wiki/Translation_lookaside_buffer).

```console
# bpftool prog profile <prog> itlb_misses dtlb_misses
```
