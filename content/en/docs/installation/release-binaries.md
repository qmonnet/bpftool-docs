---
title: 'Release binaries'
description: 'Get bpftool binaries from the official releases'
weight: 20
---

[Official releases for bpftool][releases] are published on the GitHub mirror
repository, and contain various assets including bpftool binaries for amd64 and
arm64 architectures.

These binaries result from static builds, so they require no dependencies to
run. They contain the full set of available [build features][features] for
bpftool.

Check out [the page for the latest release][latest] to download a binary, or
use your command line to retrieve the latest tag and download the desired
asset:

```console
$ arch=amd64 # or arm64
$ tag="$(curl -sL -H 'Accept: application/vnd.github+json' https://api.github.com/repos/libbpf/bpftool/releases/latest | jq -r '.tag_name')
$ curl -sLO "{{< param github_project_repo >}}/releases/download/${tag}/bpftool-${tag}-${arch}.tar.gz"
```

[releases]: {{< param github_project_repo >}}/releases
[latest]: {{< param github_project_repo >}}/releases/latest
[features]: {{< relref "features" >}}
