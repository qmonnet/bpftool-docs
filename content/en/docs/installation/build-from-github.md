---
title: 'Build from GitHub'
description: 'Build bpftool from the GitHub mirror'
weight: 30
---

[The GitHub mirror repository for bpftool][mirror] makes it easy to clone and
build bpftool from the sources.

[mirror]: {{< param github_project_repo >}}

## Dependencies

The following librairies are required for building bpftool:

- libelf
- zlib

Other optional dependencies are covered in [the list of build
features][features] for bpftool. If these dependencies are not available at
build time, bpftool's build system will leave out the corresponding features.

[features]: {{< relref "features" >}}

## Default build

To build bpftool, clone the repository and go to the `src` directory:

```console
$ git clone {{< param github_project_repo >}}.git
$ cd src
```

Then, leave it to the `Makefile`:

```console
$ make
```

## Build options

Enable parallel builds with `-j`:

```console
$ make -j $(nproc)
```

You can build and install bpftool on the system, assuming you have sufficient
permissions:

```console
# make install
```

Build bpftool in a separate directory by setting the `OUTPUT` variable:

```console
$ mkdir /tmp/bpftool
$ OUTPUT=/tmp/bpftool make
```

When building bpftool, most of the output from the `Makefile` is suppressed by
default. To display the detailed logs, pass `V=1` to the `make` invocation:

```console
$ make V=1
```

Do not change the `CFLAGS` variable. If you need to pass specific flags for the
build, use `EXTRA_CFLAGS` instead.

More build options are covered in the sections on [static
builds][static-builds] and [cross-compilation][cross-compiling].

[static-builds]: {{< relref "static-builds" >}}
[cross-compiling]: {{< relref "cross-compiling" >}}
