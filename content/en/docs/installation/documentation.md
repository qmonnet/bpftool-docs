---
title: 'Documentation'
description: "Build and access bpftool's documentation and interactive help"
weight: 90
---

## Manual pages

### HTML version

A rendered version of the manual pages is available on this
website, in the [Reference][reference] section.

[reference]: {{< relref "man-pages" >}}

### With `man`

When installing bpftool from a distribution package, they should be installed
alongside the binary, making them available with `man`. For example, you should
be able to display the documentation related to the `bpftool prog` subcommand
with the following invocation:

```console
$ man bpftool-prog
```

### Building the manual pages

The manual pages are shipped as plain-text files (formatted with
reStructuredText mark-up) along bpftool's source code. You can generate and
install these pages manually, and then read them with `man`. From the root of
the GitHub mirror repository, run the following command:

```console
# make -C docs install
```

From the Linux kernel repository, you need to adjust the path to the
documentation:

```console
# make -C tools/bpf/bpftool/Documentation install
```

## Interactive help

The tool provides interactive help for all commands. 

- `bpftool help` for the top-level help message
- `bpftool <subcommand> help` for help on a given subcommand

Passing options `--help` or `-h` anywhere on the command line also produces the
top-level help message, but cannot be used to display subcommand-specific
assistance.

Here are some examples:

```console
$ bpftool help
Usage: bpftool [OPTIONS] OBJECT { COMMAND | help }
       bpftool batch file FILE
       bpftool version

       OBJECT := { prog | map | link | cgroup | perf | net | feature | btf | gen | struct_ops | iter }
       OPTIONS := { {-j|--json} [{-p|--pretty}] | {-d|--debug} |
                    {-V|--version} }
```

```console
$ bpftool iter help
Usage: bpftool iter pin OBJ PATH [map MAP]
       bpftool iter help

       MAP := { id MAP_ID | pinned FILE | name MAP_NAME }
       OPTIONS := { {-j|--json} [{-p|--pretty}] | {-d|--debug} }
```

## This website

The source code for the current website is available [on GitHub][docs].

[docs]: {{< param github_repo >}}
