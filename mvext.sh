
#!/bin/bash

# Change filename extensions
# setup before
# mkdir testing
# cd testing
# touch {a..h}.txt

CUR_DIR="$PWD"
WORK_DIR="${CUR_DIR}/testing"

cd "${WORK_DIR}"

[[ $# -ne 2 ]] && { echo "Need exactly two arguments" >&2; exit 1; }

for f in *"$1"; do
    base=$(basename "$f" "$1")
    # debug by echo first
    # echo mv "$f" "${base}$2"
    mv "$f" "${base}$2"
done

cd "${CUR_DIR}"