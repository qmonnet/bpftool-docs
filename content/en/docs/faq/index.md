---
title: 'FAQ'
description: 'Frequently Asked Questions'
weight: 80
---

## How do I report bugs?

Please post them to the BPF mailing list. Unless they are specific to the way
the mirror repository is set up, and not to bpftool itself. See [the
contributing guidelines]({{< ref "docs/contributing/report-issues" >}}) for
details.

## Packaging bpftool: What are the recommended sources?

We recommend using the sources from the GitHub mirror for packaging bpftool.

Note that the [release page][releases] lists assets that contain the sources of
both bpftool and its associated libbpf dependency, at the right version, so
that packagers don't need to rely on Git submodules in their workflow.

## Why ship libbpf as a submodule rather than using system's libbpf?

There is currently no support for compiling bpftool against a libbpf version
that would be installed on the system, as opposed to the libbpf version shipped
as a submodule (in the GitHub mirror) or in the same tree (in the kernel
repository).

The current model has the preference of bpftool's maintainers, because it helps
them keep bpftool and libbpf in synchronized states, which is a requirement
given that bpftool directly calls into a few of libbpf's internal functions
that are not part of the public API. This also helps with the release process, and helps having consistent bpftool releases between distributions.

This model does have some drawbacks that have been discussed in the past on the
BPF mailing list. Refer to [the related thread in the mailing list
archives][packaging] for more context.

[releases]: {{< param github_project_repo >}}/releases
[packaging]: https://lore.kernel.org/all/ZEuOK8Rvlm52d2DK@syu-laptop/

## Who are the authors of bpftool?

Anyone is free and welcome to submit contributions to the project.

Historically, Jakub Kicinski created bpftool in 2017. [At the
beginning][first-commit], bpftool was a simpler utility called `bpf`, and
hosted on Netronome's [bpf-tool] GitHub repository. It already relied on libbpf
to inspect BPF programs and maps. A few months later, [the project was moved to
the Linux kernel tree][bpftool-kernel], so that new BPF features could get
support in bpftool as soon as developers added them to the kernel.

There, it grew more features, getting tighter connections with some other
kernel files. In 2022, Quentin Monnet reworked some portions of the program to
make it easier to build it outside of the tree. This led to [the creation of
the GitHub mirror repository][mirror-mail], and to Quentin becoming bpftool's
official maintainer. With [more than 120 contributors][contributors] to its
source code (not counting libbpf), bpftool results from the works of the whole
BPF community!

[first-commit]: https://github.com/Netronome/bpf-tool/commit/64be4aa83e7438b2a70cb5c64eae5086101c5b0d
[bpf-tool]: https://github.com/Netronome/bpf-tool
[bpftool-kernel]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=71bb428fe2c19512ac671d5ee16ef3e73e1b49a8
[mirror-mail]: https://lore.kernel.org/bpf/267a35a6-a045-c025-c2d9-78afbf6fc325@isovalent.com/
[contributors]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/tools/bpf/bpftool

## What does the logo represent?

![bpftool logo](/bpftool_stacked_color.svg)

Meet **Hannah the Honeyguide**, bpftool's mascot. She is a [greater
honeyguide](https://en.wikipedia.org/wiki/Greater_honeyguide), but a juvenile
one, as can be seen from her yellow throat. We accentuated her shades, because
Hannah really wanted to share colors with eBee and Tux (the mascots for eBPF
and Linux, respectively).

Living in sub-Saharan Africa, greater honeyguides are known for guiding humans
to the nests of wild bees. They use a specific call to attract human attention,
then they fly towards the hive. Once the honey hunters have found and harvested
the nest, greater honeyguides feed on the remnants of the hive, eating bee eggs
and larvae, and even beeswax.

Like a honeyguide, bpftool guides humans towards bees, or to be more accurate,
towards BPF objects loaded on a system: after all, one of the primary use cases
for bpftool is to load and inspect BPF programs and maps. Don't worry, bpftool
will not eat your programs. Although, it could well detach programs and have
them removed from the kernel, if you asked it to. Of course, bpftool is a piece
of software and cannot "expect" to receive something in return for its
services. But think of it this way: for guiding humans to BPF, it feeds on
software maintenance and new features. Isn't that some form of mutualism, after
all?

Greater honeyguides are also brood parasites: the females lay their eggs in the
nests of birds of different species, and the chicks attempt to get rid of any
competitors as soon as they hatch. Thankfully, Hannah chose not to fight at
birth. As for bpftool? Shhhh, we may well have placed it in a particular
penguin's nest, so it could thrive. But we're happy to report that bpftool
never pushed any other project out of the Linux repository!

Other versions of the logotype are available (click to access the images):

{{< cardpane >}}
  {{< card header="Stacked" >}}
    <a href="/bpftool_stacked_color.svg">
      <img src="/bpftool_stacked_color.svg" alt="bpftool logo, stacked, colored" />
    </a>
  {{< /card >}}
  {{< card header="Stacked (monochrome)" >}}
    <a href="/bpftool_stacked_monochrome.svg">
      <img src="/bpftool_stacked_monochrome.svg" alt="bpftool logo, stacked, monochrome" />
    </a>
  {{< /card >}}
  {{< card header="Stacked (monochrome, reversed)" >}}
    <a href="/bpftool_stacked_monochrome_reversed.svg">
      <img src="/bpftool_stacked_monochrome_reversed.svg" alt="bpftool logo, stacked, monochrome, reversed"  style="background-color: #403f4c;" />
    </a>
  {{< /card >}}
{{< /cardpane >}}

{{< cardpane >}}
  {{< card header="Horizontal" >}}
    <a href="/bpftool_horizontal_color.svg">
      <img src="/bpftool_horizontal_color.svg" alt="bpftool logo, horizontal, colored" />
    </a>
  {{< /card >}}
  {{< card header="Horizontal (monochrome)" >}}
    <a href="/bpftool_horizontal_monochrome.svg">
      <img src="/bpftool_horizontal_monochrome.svg" alt="bpftool logo, horizontal, monochrome" />
    </a>
  {{< /card >}}
  {{< card header="Horizontal (monochrome, reversed)" >}}
    <a href="/bpftool_horizontal_monochrome_reversed.svg">
      <img src="/bpftool_horizontal_monochrome_reversed.svg" alt="bpftool logo, horizontal, monochrome, reversed" style="background-color: #403f4c;" />
    </a>
  {{< /card >}}
{{< /cardpane >}}

{{< cardpane >}}
  {{< card header="Icon" >}}
    <a href="/bpftool_icon_color.svg">
      <img src="/bpftool_icon_color.svg" alt="bpftool logo icon, colored" />
    </a>
  {{< /card >}}
  {{< card header="Icon (monochrome)" >}}
    <a href="/bpftool_icon_monochrome.svg">
      <img src="/bpftool_icon_monochrome.svg" alt="bpftool logo icon, mononchrome" />
    </a>
  {{< /card >}}
  {{< card header="Icon (monochrome, reversed)" >}}
    <a href="/bpftool_icon_monochrome_reversed.svg">
      <img src="/bpftool_icon_monochrome_reversed.svg" alt="bpftool logo icon, mononchrome, reversed" style="background-color: #403f4c;" />
    </a>
  {{< /card >}}
{{< /cardpane >}}

**License:** All logo versions are licensed under the [Creative Commons
Attribution 4.0 International (CC-BY-4.0)][cc-by-4.0]. Reuse them as you want,
but please credit the bpftool authors. The logo were designed by Quentin
Monnet. The font used to typeset "bpftool" is
[Raleway](https://www.theleagueofmoveabletype.com/raleway).

[cc-by-4.0]: https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg
