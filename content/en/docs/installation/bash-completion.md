---
title: 'Bash completion'
description: 'Install bash completion for bpftool'
weight: 100
---

## Completion

Bpftool has exhaustive bash completion. Hit the `tab` key to obtain suggestions
on contextual commands, options, paths, or even items such as available program
or map IDs when relevant. Give it a try.

When installing bpftool as a package from a distribution, the completion file
is usually installed alongside the binary, at a location where bash can find
it.

If you build bpftool yourself, you can find the completion file under the
`bash-completion` directory. Installing bpftool will copy the file to
`/usr/share/bash-completion/completions`, where bash should find it:

```console
# make -C src install # GitHub mirror repository
# make -C tools/bpf/bpftool install # Linux kernel tree
```

There is not dedicated `make` target to install the completion only.

## Command abbreviations

Another way of typing bpftool commands faster is to use abbreviations for the
keywords. Most keywords can be abbreviated, with a few exceptions. For example,
the following command:

```console
# bpftool p d x i <id>
```

is the same as:

```console
# bpftool prog dump xlated id <id>
```
