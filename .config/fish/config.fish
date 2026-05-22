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

# Discord Bridge
if not pgrep -f discord-ipc-bridge >/dev/null
    ~/scripts/discord-ipc-bridge.sh &
end

## Programs

if type -q mise
    mise activate fish | source
end

if type -q fzf
    fzf --fish | source
end

if type -q starship
    starship init fish | source
end

if type -q zoxide
    zoxide init fish | source
end
