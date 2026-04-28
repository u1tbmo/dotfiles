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
set -x EDITOR hx

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

# Zoxide
if type -q zoxide
    zoxide init fish | source
end
