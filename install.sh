#!/bin/bash
INSTALL_EVERYTHING=0
IMAGE_NAME=""
UNINSTALL=0
POSITIONAL_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    -i|--image)
        IMAGE_NAME="$2"
        shift # past argument
        shift # past value
      ;;
    -a|--all)
        INSTALL_EVERYTHING=1
        shift
      ;;
    -u|--uninstall)
        UNINSTALL=1
        shift
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

if [ -z "$IMAGE_NAME" ] && [ "$INSTALL_EVERYTHING" = "0" ]; then
  echo "Error: --image argument is required or -a"
  exit 1
fi

if [ `id -u` -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

cd `dirname "$0"`

function install_image {
    IMG_NAME="$1"
    mkdir -p /opt/good-enough-images/bin
    echo "Installing image: $IMG_NAME"
    
    # Open directory with that name and look for run.sh and links-file relative to this file.
    # If both exist, copy run.sh to /opt/good-enough-images/bin and link to every path in links-file
    # If not, print error message
    IMAGE_DIR="$(dirname "$(realpath "$0")")/$IMG_NAME"
    RUN_SCRIPT="$IMAGE_DIR/run.sh"
    LINKS_FILE="$IMAGE_DIR/links"

    # TODO: Move this to a new function for removing etc.
    if [[ -f "$RUN_SCRIPT" && -f "$LINKS_FILE" ]]; then
        cp "$RUN_SCRIPT" /opt/good-enough-images/bin/g-$IMG_NAME
        while IFS= read -r LINK_PATH || [ "$LINK_PATH" ]; do
            # Skip empty lines and comments
            if [[ -z "$LINK_PATH" || "$LINK_PATH" =~ ^# ]]; then
                continue
            fi
            # Split on \t into name and path
            IFS=$' ' read -r NAME LPATH <<< "$LINK_PATH"
            if [ -z "$LPATH" ]; then
              LPATH="$NAME"
            fi
            LPATH="/opt/good-enough-images/bin/$LPATH"
            echo "Linking $NAME to $LPATH"
            printf "#!/bin/bash\n/opt/good-enough-images/bin/g-$IMG_NAME $NAME \$@" > $LPATH
            chmod +x $LPATH
        done < "$LINKS_FILE"
    else
        echo "Error: Missing run.sh or links-file in $IMAGE_DIR"
        exit 1
    fi
}

# Copy default.conf to /etc/good-enough-images.conf
if [ ! -f /etc/good-enough-images.conf ]; then
    cp ./default.conf /etc/good-enough-images.conf
fi

# Add /opt/good-enough-images/bin to PATH
if ! grep -q "MARKER: good-enough-images" /etc/environment; then
    echo "PATH=\"/opt/good-enough-images/bin:\$PATH\" # MARKER: good-enough-images" >> /etc/environment
fi

if [ "$INSTALL_EVERYTHING" = "1" ]; then
  if [ "$UNINSTALL" = "1" ]; then
    echo "Uninstalling everything..."
    echo -n "Warning: This will remove all images, links, configs and working directories inside /opt/good-enough-images. Are you sure? [y/n] "
    read -r answer
    if [[ ! $answer =~ ^[Yy]$ ]]; then
        echo "Aborting."
        exit 1
    fi
    rm -r /opt/good-enough-images 2> /dev/null
    rm -r /etc/good-enough-images.conf 2> /dev/null
    sed -i '/MARKER: good-enough-images/d' /etc/environment
    echo "Done."
  else
    echo "Installing everything..."
    for dir in */; do
        if [ -d "$dir" ]; then
            IMAGE_NAME="${dir%/}"
            install_image "$IMAGE_NAME"
        fi
    done
  fi
else
  if [ "$UNINSTALL" = "1" ]; then
    echo "Uninstalling image: $IMAGE_NAME"
    echo -n "Warning: This will remove all images, links, configs and working directories inside /opt/good-enough-images/$IMAGE_NAME. Are you sure? [y/n] "
    read -r answer
    if [[ ! $answer =~ ^[Yy]$ ]]; then
        echo "Aborting."
        exit 1
    fi
    # TODO: Remove bin links
    rm -r /opt/good-enough-images/$IMAGE_NAME 2> /dev/null
  else
    echo "Installing image: $IMAGE_NAME"
    install_image "$IMAGE_NAME"
  fi
fi