#!/bin/bash
########################################################################
# Install bash prompt 
# https://github.com/muquit/bash-prompt
# Feb-19-2026 
########################################################################
DEST="$HOME/.bash_prompt.sh"
SRC="bash_prompt.sh"
BASHRC="$HOME/.bashrc"
SOURCE_LINE="[[ -f ~/.bash_prompt.sh ]] && source ~/.bash_prompt.sh"

if [[ -f "$DEST" ]]; then
    printf "%s already exists. Overwrite? [y/N] " "$DEST"
    read -r answer
    case "$answer" in
        [yY]) ;;
        *) echo "Aborted ..."; exit 1 ;;
    esac
fi

/bin/cp -fv "$SRC" "$DEST"
echo "Installed to $DEST"
echo ""

if grep -qF "$SOURCE_LINE" "$BASHRC" 2>/dev/null; then
    echo "$BASHRC already sources $DEST, nothing to do."
else
    echo "" >> "$BASHRC"
    echo "# bash-prompt" >> "$BASHRC"
    echo "$SOURCE_LINE" >> "$BASHRC"
    echo "Added source line to $BASHRC"
fi

exit 0
