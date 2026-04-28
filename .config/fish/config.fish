if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_user_keybindings
    bind ctrl-h backward-kill-word
end

# PATHs & Environment Setup
fish_add_path ~/.local/bin ~/bin
fish_add_path ~/.deno/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.vite-plus/bin

# Environment Variables
set -x PAGER bat --plain --paging=always

# Abbreviations

abbr -a sudo sudo-rs
abbr -a hx helix

# uutils abbreviations
abbr -a ls 'uu-coreutils ls'
abbr -a cat 'uu-coreutils cat'
abbr -a cp 'uu-coreutils cp'
abbr -a mv 'uu-coreutils mv'
abbr -a rm 'uu-coreutils rm'
abbr -a chown 'uu-coreutils chown'
abbr -a date 'uu-coreutils date'
abbr -a dd 'uu-coreutils dd'
abbr -a echo 'uu-coreutils echo'
abbr -a hostname 'uu-coreutils hostname'
abbr -a kill 'uu-coreutils kill'
abbr -a pwd 'uu-coreutils pwd'
abbr -a whoami 'uu-coreutils whoami'

# Discord Bridge
if not pgrep -f discord-ipc-bridge >/dev/null
    ~/scripts/discord-ipc-bridge.sh &
end

# Completions

COMPLETE=fish jj | source

# Programs

if type -q starship
    starship init fish | source
end

if type -q zoxide
    zoxide init fish | source
end
