#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $CURRENT_DIR/scripts/utils.sh
script="#(echo once)"
placeHolder="\#{thmip}"
script="#($CURRENT_DIR/scripts/thmIp.sh)"

do_interpolation() {
	local string="$1"
	local interpolated="${string/$placeHolder/$script}"
	echo "$interpolated"
}

update_tmux_option() {
	local option="$1"
	local option_value="$(tmux_get "$option")"
	local new_option_value="$(do_interpolation "$option_value")"
    tmux_set "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}

main
