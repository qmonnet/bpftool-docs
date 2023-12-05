<a href="https://github.com/libbpf/bpftool">
  <div>
  <img src="static/bpftool_horizontal_color.svg"
       alt="bpftool logo: Hannah the Honeyguide"
       width=300px; />
  </div>
</a>

# Documentation for bpftool

This repository contains extended documentation for [bpftool].

Status: Work in progress, not deployed yet.

[bpftool]: https://github.com/libbpf/bpftool

## Build locally

### Requirements

The website relies on [Hugo] and [Docsy]. If necessary, install Go. [Install
Hugo's extended version][hugo-install], for example:

```console
$ CGO_ENABLED=1 go install -v -tags extended github.com/gohugoio/hugo@latest
```

[hugo]: https://gohugo.io/
[hugo-install]: https://gohugo.io/installation/
[docsy]: https://www.docsy.dev/

### Development

Simply use Hugo to serve the website locally:

```console
$ hugo server
```

## License

The logos for bpftool are released under the [Creative Commons Attribution 4.0
International][ccby] license (`CC-BY-4.0`).

Manual pages for bpftool originate from the Linux kernel repository and are
dual-licensed under the [GNU GPL v2.0 (only)][gpl] license and the [BSD
2-clause][bsd] license (`GPL-2.0-only OR BSD-2-Clause`). To avoid adding
additional licenses to the mix, the rest of the documentation, unless otherwise
specified, is released under the same dual-licensing terms.

[gpl]: https://spdx.org/licenses/GPL-2.0-only.html
[bsd]: https://spdx.org/licenses/BSD-2-Clause.html
[ccby]: https://spdx.org/licenses/CC-BY-4.0.html
