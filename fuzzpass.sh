#!/usr/bin/env bash

SHOW=0
USERNAME=0
EDIT=0
REMOVE=0

function show_help() {
    echo "Usage: $0 [OPTIONS]"
    echo
    echo "If no options are provided, the password of the selected entry will be copied to clipboard."
    echo
    echo "Options:"
    echo "  -s, --show        Show full entry details"
    echo "  -u, --username    Copy username to clipboard"
    echo "  -e, --edit        Edit the entry"
    echo "  -r, --remove      Remove the entry"
    echo "  -h, --help        Show this help message"
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help) show_help; exit 0;;
        -s|--show) SHOW=1; shift;;
        -u|--username) USERNAME=1; shift;;
        -e|--edit) EDIT=1; shift;;
        -r|--remove) REMOVE=1; shift;;
        *) echo "unknown option: $1"; exit 1;;
    esac
done

name=$(lpass ls \
    | sed 's/^[^/]*\///' \
    | sed 's/ \[.*]$//' \
    | fzf --preview 'lpass show --quiet {}')

if [[ -z "$name" ]]; then
    exit 1
elif [[ $SHOW -eq 1 ]]; then
    lpass show --color=always "$name"
elif [[ $USERNAME -eq 1 ]]; then
    lpass show --color=always --username --clip "$name"
elif [[ $EDIT -eq 1 ]]; then
    lpass edit --color=always "$name"
elif [[ $REMOVE -eq 1 ]]; then
    lpass rm --color=always "$name"
else
    lpass show --color=always --password --clip "$name"
fi
