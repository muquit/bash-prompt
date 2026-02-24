#!/bin/bash
tag="$(< ./VERSION)"
git tag
printf "%s Remove tag? [y/N] " "$tag"
read -r answer
case "$answer" in
    [yY])
        echo "remove tag $tag"
        git tag -d ${tag}
    ;;
    *) 
        echo "Aborted ..."
esac
