# Downloads and extracts prepackaged archive of native libraries ("moonlibs")
function getLibs()
{
    # Downloading
    echo "Downloading latest moonlibs..."
    curl http://moonside.games/files/moonlibs.tar.bz2 > "$MY_DIR/moonlibs.tar.bz2"
    if [ $? -eq 0 ]; then
        echo "Finished downloading!"
    else
        >&2 echo "ERROR: Unable to download successfully."
        exit 1
    fi

    # Decompressing
    echo "Decompressing moonlibs..."
    mkdir -p "$MY_DIR"
    tar xjC "$MY_DIR" -f "$MY_DIR"/moonlibs.tar.bz2
    if [ $? -eq 0 ]; then
        echo "Finished decompressing!"
        echo ""
        rm "$MY_DIR"/moonlibs.tar.bz2
    else
        >&2 echo "ERROR: Unable to decompress successfully."
        exit 1
    fi
}

# Get the directory of this script
MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

readlinkf(){ perl -MCwd -e 'print Cwd::abs_path shift' "$1";}

getLibs