---
title: 'Maps'
description: 'Manage BPF maps with bpftool'
weight: 10
---

# Listing maps

Just like bpftool can list programs, it does the same for maps.

```console
# bpftool map show
```

or its alias:

```console
# bpftool map list
```

Show a single map with, for example:

```console
# bpftool map show id 7
```

# Map lookup

Let's retrieve one entry from a map, here the second entry of an array map
(note the use of host endianness for passing the key):

```console
# bpftool map lookup id 182 key 0x01 0x00 0x00 0x00
```

# Map dump

Alternatively, we can dump all entries of the map at once:

```console
# bpftool map dump id 182
```

# Creating a map

It is possible to create a map with bpftool. Once created, the map is pinned
under the eBPF virtual file system (or it would be lost when bpftool exits, as
no eBPF program uses it yet).

```console
# bpftool map create /sys/fs/bpf/stats_map \
        type array key 4 value 32 entries 8 name stats_map
```

This works for most (but not all) map types, although some may come with
constraints on the key or value size or the number or entries they expect.

# Map update

## Update

Let's update an entry of a map:

```console
# bpftool map update id 7 key 3 0 0 0 value 1 1 168 192
```

For compatible map types, `bpftool map update` is also used to create new
entries, and `bpftool map delete` to remove them. Hash maps support this, but
arrays are fixed in length and all their entries exist from the creation of the
map and can only be updated.

## Hexadecimal values

There is a `hex` keyword to conjure the use of hexadecimal numbers in command
keys and values. All the syntaxes below are equivalent:

```console
# bpftool map lookup id 7 …
    … key 3 15 32 64
    … key 0x3 0xf 0x20 0x40
    … key 0x03 0x0f 0x20 0x40
    … key hex 03 0f 20 40
```

## Program array updates

We can even update "prog\_array" maps (which hold references to eBPF programs,
for tail calls).

```console
# bpftool map update pinned /sys/fs/bpf/my_prog_array_map \
        key 0 0 0 0 value pinned /sys/fs/bpf/my_prog
```

The map **must** be pinned for this to work, as the kernel flushes the program
array maps when they have no more references from user space (and the update
would be lost as soon as bpftool exits).

# Iterating over map entries

Iterating over the entries of a map is especially useful with hash maps, which
have no predictable array indices. With bpftool, this is as simple as:

```console
# bpftool map getnext id 27 key 1 0 0 10
```

It returns the key of the "next" entry. If no key is provided, it returns the
"first" key from the map.

# BTF for maps

BTF can also provide information on the structure of map entries. When
available, bpftool uses this information to format the entries on map dumps
(`bpftool map dump`).

This requires:

- Passing the `-g` flag to clang when compiling the program.
- clang/LLVM version 8 or newer.
- In the C source code, the declaration of maps must use specific type macros.

# Stack and queue maps

Linux 4.20 brought stack and queue maps to eBPF, and bpftool can manipulate
them. Because such maps do not rely on keys (only on values), handling them
differs somewhat from `bpftool map lookup/update`:

```console
# bpftool map pop/dequeue/peek <map>
# bpftool map push/enqueue <map> value <val>
```

# Freezing maps

For some specific use cases, it is possible to "freeze" maps for user space.
This makes them read-only from user space, but the permissions are unchanged
for the eBPF programs which can still update the map.

```console
# bpftool map freeze id 1337
```
