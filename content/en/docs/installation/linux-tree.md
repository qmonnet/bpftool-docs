---
title: 'Build from Linux tree'
description: 'Build bpftool from the Linux kernel repository'
weight: 40
---

The source code for bpftool can be found [in the Linux kernel repository, under
`tools/bpf/bpftool`][bpftool-dir]. You can download the sources from the latest
Linux version from [kernel.org][kernel], or you can clone the Git repository:

```console
$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
$ cd linux
```

[kernel]: https://www.kernel.org/
[bpftool-dir]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/bpf/bpftool

Once you have downloaded the sources or cloned the repository, compile bpftool
by running `make` from bpftool's directory:

```console
$ cd tools/bpf/bpftool
$ make
```

[The same options as for building from the GitHub mirror repository][build-options] apply. For example, you can run `make install` to install bpftool on the system, or pass `V=1` to the `make` invocation for a more verbose output.

[build-options]: {{% relref "build-from-github" %}}/#build-options
