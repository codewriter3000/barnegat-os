#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 4 ]]; then
    echo "usage: $0 <src-root> <machine-src-root> <entry-file> <output-file>" >&2
    exit 64
fi

src_root=$1
machine_src_root=$2
entry_file=$3
output_file=$4

tmp_seen=$(mktemp)
tmp_package=$(mktemp)

cleanup() {
    rm -f "$tmp_seen" "$tmp_package"
}

trap cleanup EXIT

resolve_import_path() {
    local module_path=$1
    local rel_path
    rel_path="${module_path//./\/}.cal"
    # Machine-specific overlay takes precedence over the common src root
    if [[ -f "${machine_src_root}/${rel_path}" ]]; then
        printf '%s/%s' "$machine_src_root" "$rel_path"
    else
        printf '%s/%s' "$src_root" "$rel_path"
    fi
}

emit_file() {
    local file_path=$1
    local line=""

    if grep -Fxq "$file_path" "$tmp_seen"; then
        return 0
    fi

    printf '%s\n' "$file_path" >> "$tmp_seen"
    printf '// merged from %s\n' "$file_path" >> "$output_file"

    while IFS= read -r line || [[ -n "$line" ]]; do
        if [[ $line =~ ^[[:space:]]*import[[:space:]]+([A-Za-z0-9_.]+)[[:space:]]*\;[[:space:]]*$ ]]; then
            local import_target
            import_target=$(resolve_import_path "${BASH_REMATCH[1]}")
            if [[ ! -f $import_target ]]; then
                echo "merge error: import ${BASH_REMATCH[1]} resolved to missing file $import_target" >&2
                exit 1
            fi
            emit_file "$import_target"
        elif [[ $line =~ ^[[:space:]]*package[[:space:]]+([A-Za-z0-9_.]+)[[:space:]]*\;[[:space:]]*$ ]]; then
            if [[ ! -s $tmp_package ]]; then
                printf 'package %s;\n\n' "${BASH_REMATCH[1]}" >> "$output_file"
                printf 'written\n' > "$tmp_package"
            fi
        else
            printf '%s\n' "$line" >> "$output_file"
        fi
    done < "$file_path"

    printf '\n' >> "$output_file"
}

: > "$output_file"
emit_file "$entry_file"