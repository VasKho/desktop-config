name=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')

pkill wl-mirror || wl-present mirror "$name"
