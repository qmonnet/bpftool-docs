#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR="$(readlink -f "$(dirname "${BASH_SOURCE[0]}")")"
INCLUDES_DIR="${SCRIPT_DIR}/includes"
INCLUDES_PATH='content\/en\/docs\/man-pages\/includes\/'
GH_TREES='https://api.github.com/repos/libbpf/bpftool/git/trees/main?recursive=1'
GH_RAW_DIR='https://raw.githubusercontent.com/libbpf/bpftool/main'

declare -a LIST_DOCS
mapfile -t LIST_DOCS <<< "$(curl -s "${GH_TREES}" | \
    jq -r '.tree[].path|select(startswith("docs/bpftool"))')"

process() {
    local doc="$1" dst_dir="$2" dst name
    name="$(basename "${doc}" ".rst")"
    dst="${dst_dir}/${name}.rst"

    # Prepend front matter
    printf -- "---\ntitle: %s\n---\n\n" "${name}" > "${dst}"
    # Remove RST toplevel title
    # Remove manual section number
    # Fix include path
    curl -s "${GH_RAW_DIR}/${doc}" | sed \
        -e '3,5d' \
        -e '/^:Manual section:/d' \
        -e "s/\(\.\. include:: \)\(.*\)\(\.rst\)/\1${INCLUDES_PATH}\2/" \
        >> "${dst}"
}

for doc in "${LIST_DOCS[@]}"; do
    process "${doc}" "${SCRIPT_DIR}"
done

mkdir -p "${INCLUDES_DIR}"
for include in "common_options" "substitutions"; do
    # Trim .rst extension to avoid getting files directly included by Hugo
    curl -s -o "${include}" --output-dir "${INCLUDES_DIR}" \
        "${GH_RAW_DIR}/docs/${include}.rst"
done
