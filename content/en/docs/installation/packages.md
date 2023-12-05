---
title: 'Packages'
description: 'Install bpftool from distribution packages'
weight: 10
---

Many Linux distributions package bpftool, albeit some of them like Ubuntu integrate it to broader packages.

{{% alert title="Warning" color="warning" %}}
Distributions may not enable all bpftool features when they compile the binary. Support for the disassembler for JIT-compiled programs, or support for profiling BPF programs, may not be available from the version contained in your distribution's package.

See [bpftool's build features]({{% relref "features" %}}) for details.
{{% /alert %}}

## Alpine

Alpine Linux has a `bpftool` package:

```console
# apk add bpftool
```

## Debian

Debian has a `bpftool` package:

```console
# apt install bpftool
```

Debian is one of these distributions shipping a binary that does not contain
the disassembler for JIT-compiled eBPF code.

## Fedora

Fedora has a `bpftool` package:

```console
# dnf install bpftool
```

## Ubuntu

Ubuntu ships bpftool _via_ the Linux tools:

```console
# apt install linux-tools-common linux-tools-generic
```

Ubuntu is one of these distributions shipping a binary that does not contain
the disassembler for JIT-compiled eBPF code.

## Others

[![Packaging status](https://repology.org/badge/vertical-allrepos/bpftool.svg)](https://repology.org/project/bpftool/versions)

## New packages

If you're looking into packaging bpftool, please take a look at [the FAQ][faq].

[faq]: {{% ref "/docs/faq" %}}#packaging-bpftool-what-are-the-recommended-sources
