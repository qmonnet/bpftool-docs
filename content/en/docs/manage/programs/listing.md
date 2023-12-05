---
title: 'List programs'
description: 'Use bpftool to list BPF programs'
weight: 20
---

Listing tracing programs
========================

Like with cgroups, bpftool can list all tracing eBPF programs currently
attached on the system (to tracepoints, rawstracepoints, k\[ret\]probes,
u\[ret\]probes). As simple as:

```console
# bpftool perf show
```

Listing networking programs
===========================

There is also a mode for listing programs related to network packets
processing.

```console
# bpftool net show
```

This lists programs attached to TC or XDP hooks. It is possible to filter on a
given interface:

```console
# bpftool net show dev <iface>
```
