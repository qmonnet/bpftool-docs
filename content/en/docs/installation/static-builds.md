---
title: 'Static builds'
description: 'Compile bpftool statically to avoid runtime dependencies'
weight: 50
---

First, retrieve bpftool's source code. You can clone the GitHub repository:

```console
$ git clone {{< param github_project_repo >}}.git
$ cd bpftool/src
```

Alternatively, you can work from the `bpftool` directory in the Linux kernel
tree, see [the instructions for building from the Linux tree][linux-build].

[linux-build]: {{% relref "linux-tree" %}}

The following instructions apply to compiling from either the GitHub mirror
repository, or from the Linux kernel tree.

## Without LLVM disassembler support

To do a static build, simply pass the `--static` flag through the
`EXTRA_CFLAGS` variable:

```console
$ EXTRA_CFLAGS=--static make
```

## With LLVM disassembler support

Bpftool supports LLVM's disassembler for JIT-compiled BPF programs as [an
optional feature][features]. It is possible to do static builds when this
feature is selected, but the process becomes more involved. as you need a
_static_ version of the LLVM library installed on you system.

There are at least two options to get this library: to download a precompiled
LLVM release, or to build it locally.

[features]: {{% relref "features" %}}

### Download a precompiled LLVM library

The GitHub repository for the LLVM project contains some suitable versions.
Find one that is compatible with your platform. For example, on x86_64 with
LLVM 15.0.0:

```console
$ curl -LO https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.0/clang+llvm-15.0.0-x86_64-linux-gnu-rhel-8.4.tar.xz
$ tar xvf clang+llvm-15.0.0-x86_64-linux-gnu-rhel-8.4.tar.xz
$ mv clang+llvm-15.0.0-x86_64-linux-gnu-rhel-8.4 llvm_build
```

### Build LLVM locally

Another option is to clone and build the LLVM library locally:

```console
$ git clone https://github.com/llvm/llvm-project.git
$ mkdir llvm_build
$ cmake -S llvm-project/llvm -B llvm_build -DCMAKE_BUILD_TYPE=Release
$ make -j -C llvm_build llvm-config llvm-libraries
```

### Build bpftool

Once the LLVM library is ready, build bpftool with `EXTRA_CFLAGS` set to
`--static`. You also need to pass the path to the relevant `llvm-config`
utility.

```console
$ cd bpftool/src
$ LLVM_CONFIG=../../llvm_build/bin/llvm-config EXTRA_CFLAGS=--static make
```
