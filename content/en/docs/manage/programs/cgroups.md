---
title: 'Cgroups'
description: 'Use bpftool to control BPF with cgroups'
weight: 40
---

Coming back to the cgroups: bpftool can show the programs attached to a given
cgroup.

```console
# bpftool cgroup show <cgroup>
```

It can also iterate over cgroups and show all programs (with no argument it
defaults to the cgroup v2 mountpoint):

```console
    # bpftool cgroup tree [cgroup-root]
```
