function fish_custom_key_bindings -d "Custom keybindings"
  function kill_char_or_region
		if test -z (commandline -s)
			commandline -f backward-delete-char
		else
			commandline -f kill-selection
			commandline -f end-selection
		end
  end

  bind ctrl-b 'backward-char'
  bind left 'backward-char'
  bind ctrl-f 'forward-char'
  bind right 'forward-char'

  bind ctrl-left 'backward-word'
  bind alt-left 'backward-word'
  bind ctrl-alt-b 'backward-word'
  bind ctrl-right 'forward-word'
  bind alt-left 'forward-word'
  bind ctrl-alt-f 'forward-word'

  bind backspace 'kill_char_or_region'
  bind ctrl-d 'delete-char'

  bind alt-backspace 'backward-kill-word'
  bind alt-backspace 'backward-kill-path-component'
  bind ctrl-alt-d 'kill-word'
  bind ctrl-k 'kill-line'

  bind ctrl-a 'beginning-of-line'
  bind ctrl-e 'end-of-line'

  bind ctrl-x,ctrl-u 'upcase-word'
  bind ctrl-x,ctrl-l 'downcase-word'

  bind ctrl-x,ctrl-d 'history-delete'
  bind ctrl-s 'pager-toggle-search'
  bind up 'up-or-search'
  bind ctrl-p 'up-or-search'
  bind down 'down-or-search'
  bind ctrl-n 'down-or-search'
  bind ctrl-/ 'undo'
  bind ctrl-alt-/ 'redo'

  bind ctrl-space 'begin-selection'
  bind ctrl-g 'end-selection' 'cancel'
  bind ctrl-x,ctrl-x 'swap-selection-start-stop'

  bind ctrl-y 'fish_clipboard_paste'
  bind alt-w 'fish_clipboard_copy'
  bind ctrl-x,ctrl-e 'edit_command_buffer'
  bind tab 'complete'

  bind ctrl-x,ctrl-p 'toggle_private_mode; commandline -f repaint'
end

set -g fish_key_bindings fish_custom_key_bindings
