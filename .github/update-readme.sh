#!/bin/bash
BASE=`dirname "$0"`
cd "$BASE/.."

LINKS=""
for dir in */; do
    [ -d "$dir" ] || continue
    LINK_FILE="${dir%/}/links"
    [ -f "$LINK_FILE" ] || { echo "Skipping ${dir%/}, no links found."; continue; }
    while IFS= read -r LINK_PATH || [ "$LINK_PATH" ]; do
        [[ -z "$LINK_PATH" || "$LINK_PATH" =~ ^# ]] && continue
        IFS=$' ' read -r NAME LPATH <<< "$LINK_PATH"
        LINKS="$LINKS- ${LPATH:-$NAME},"
    done < "$LINK_FILE"
done

START_MARKER="<!-- LIST COMMANDS -->"
END_MARKER="<!-- END LIST COMMANDS -->"

LINKS=$(echo -n "$LINKS" | sed 's|,|\n|g' | sort)
SED_APPEND=$(printf "%s\n" "$LINKS" | sed 's/^/a\\/' )
sed -i "/$START_MARKER/,/$END_MARKER/{
    /$START_MARKER/{
        p
        $SED_APPEND
    }
    /$END_MARKER/p
    d
}" "README.md"