---
title: 'Control flow graph'
description: 'Generate the control flow graph (CFG) of a BPF program with bpftool'
weight: 80
---

Believe it or not, bpftool can dump the control flow graph of a program in a
format compatible with [DOT](https://graphviz.org/doc/info/lang.html). Use
`dot` on the output to generate a graph representing all the possible paths of
execution of a program.

```console
# bpftool prog dump xlated id <id> visual
```
