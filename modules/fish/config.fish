if status is-interactive
    if ! functions -q fisher
				curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && \
						fisher install jorgebucaran/fisher

				fisher install PatrickF1/fzf.fish
    end

		set -x XDG_CONFIG_HOME $HOME/.config
		set -x TERM xterm-256color
    set -x MOZ_ENABLE_WAYLAND 1
    set -x DESKTOP_APP_I_KNOW_ABOUT_GTK_INCOMPATIBILITY 1
    set -x PAGER less
    set -x MANPAGER less
    set -x EDITOR emacs -nw
    set -x DOCKER_BUILDKIT 1
		set -x ANDROID_HOME /opt/android-sdk
		set -x GOOGLE_CLOUD_PROJECT_ID ""
    set -x SUDO_EDITOR "emacs -nw --file"
    set -x TERMCMD "foot"

		fish_add_path -a -P "$HOME/.cargo/bin"
		fish_add_path -a -P "$HOME/texlive/bin/x86_64-linux"
		fish_add_path -a -P "$HOME/.local/bin"
end

function em -d 'Alias for terminal emacs client'
    emacs -nw --file $argv
end

function dbx -d 'Alias for distrobox'
    set -lx TERM xterm-256color
    distrobox $argv
end

function ssh -d 'Alias for ssh'
    set -lx TERM xterm-256color
    ssh $argv
end

function ll -d 'Alias for ls'
    ls --color -lAh $argv
end
