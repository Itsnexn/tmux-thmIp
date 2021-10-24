function tmux_get() {
	local option=$(tmux show-option -gqv "$1")
	local default_value=$2
	[[ -z "$option" ]] && echo "$default_value" || echo "$option"
}

function tmux_set() {
	local option="$1"
	local value="$2"
	tmux set-option -gq "$option" "$value"
}
