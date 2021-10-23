#!/usr/bin/env bash 
# tmux-thmIp 
# https://github.com/Itsnexn/tmux-thmIp
# 
# Copyright (c) Itsnexn 2021
# License MIT

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $CURRENT_DIR/utils.sh

TUN="$(tmux_get "@thm-vpn-interface" "tun0")"
DEFAULT_INTERFACE="$(tmux_get "@thm-default-interface" "")"
PADDING="$(tmux_get "@thm-padding" " ")"
SLEEP="$(tmux_get "@thm-sleep-time" "15")"

function getIp() {
    local INTERFACE=$1
    ip -o -4 a s $INTERFACE | awk '{print $4}' | sed "s|/.*$||" | \
        xargs printf "$PADDING%s$PADDING"
}
function thmCheck(){
    local INTERFACE=$1
    curl --max-time 2 10.10.10.10 | \
        grep -iq "tryhackme" || return 1
}

function main(){
    if $(thmCheck); then
        printf "$(getIp "$TUN" | sed "s/\s$//")@THM$PADDING" && sleep $SLEEP
    elif [ -z $DEFAULT_INTERFACE]; then
        printf ""
    else
        printf "$(getIp $DEFAULT_INTERFACE)"
    fi
}
main
