---
title: 'Alternative methods'
description: 'Some other ways to run bpftool in your environment'
weight: 70
---

## Dockerfile

The [GitHub mirror repository][mirror] for bpftool contains a [Dockerfile] for
building bpftool inside of a Docker container.

From the root of the repository, build the image with the following command:

```console
$ docker build -t bpftool:latest .
```

Once the image is available, you can run it just like any other Docker
container. Note that many bpftool commands require the container to run with
extended privileges. The default entrypoint is a call to the bpftool binary.
Here is an example invocation:

```console
$ docker run --privileged bpftool:latest prog list
```

[mirror]: {{< param github_project_repo >}}
[Dockerfile]: {{< param github_project_repo >}}/blob/main/Dockerfile

## GitHub Action

Mahé maintains [a GitHub Action][ga-bpftool] to set up (and cache) a bpftool
binary and use as part of a GitHub Workflow. See the project's description for
usage information.

[ga-bpftool]: https://github.com/mtardy/setup-bpftool
