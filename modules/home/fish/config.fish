if status is-interactive
		set -x TERM xterm-256color
    set -x PAGER less
    set -x MANPAGER less
    set -x EDITOR emacs -Q -nw
    set -x DOCKER_BUILDKIT 1
		set -x ANDROID_HOME /opt/android-sdk
		set -x GOOGLE_CLOUD_PROJECT_ID ""
    set -x SUDO_EDITOR "emacs -nw --file"
end

function em -d 'Alias for terminal emacs client'
    emacs -nw --file $argv
end

function dbx -d 'Alias for distrobox'
    set -lx TERM xterm-256color
    distrobox $argv
end

function ll -d 'Alias for ls'
    ls --color -lAh $argv
end
