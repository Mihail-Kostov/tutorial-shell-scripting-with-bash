#!/bin/bash

# create_script
# This script creates a new bash script, sets permissions and more
# Author: reindert

# Is there an argument?
if [[ ! $1 ]]; then
    echo "Missing argument"
    exit 1
fi

scriptname="$1"
bindir="${HOME}/bin"
filename="${bindir}/${scriptname}"

if [[ -e $filename ]]; then
    echo "File ${filename} already exists"
    exit 1
fi

if type "$scriptname" > /dev/null 2>&1; then
    echo "There is already a command with name ${scriptname}"
    exit 1
fi

# check if directory exists
if [[ ! -d $bindir ]]; then
    if mkdir "$bindir"; then
        echo "created ${bindir}"
    else
        echo "Could not create ${binddir}."
        exit 1
    fi
fi

# Create a script with a single line
echo "#!/bin/bash" > "$filename"
# Add executable permission
chmod u+x "$filename"
# Open with editor
if [[ $EDITOR ]]; then
    $EDITOR "$filename"
else
    echo "Script created; not starting editor because \$EDITOR is not set."
fi

echo "End of code reached"
exit 0