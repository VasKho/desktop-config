if status is-interactive
		set -x TERM xterm-256color
    set -x PAGER less
    set -x MANPAGER less
    set -x DOCKER_BUILDKIT 1
		set -x ANDROID_HOME /opt/android-sdk
end

function dbx -d 'Alias for distrobox'
    set -lx TERM xterm-256color
    distrobox $argv
end

function ll -d 'Alias for ls'
    ls --color -lAh $argv
end
