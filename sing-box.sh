#!/bin/bash

args=$@
is_sh_ver=v1.19

if [[ -f /etc/sing-box/sh/src/init.sh ]]; then
    . /etc/sing-box/sh/src/init.sh
else
    _script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    if [[ -f "$_script_dir/src/init.sh" ]]; then
        is_sh_dir="$_script_dir"
        . "$_script_dir/src/init.sh"
    fi
fi