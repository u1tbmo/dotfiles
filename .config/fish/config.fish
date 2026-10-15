if status is-interactive
    bind ctrl-h backward-kill-word
end

# PATHs & Environment Setup
fish_add_path ~/.local/bin ~/bin
fish_add_path ~/.deno/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.vite-plus/bin

# Environment Variables
set -Ux PAGER bat --plain --paging=always
set -Ux EDITOR ms
set -Ux VISUAL ms

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

# pnpm
set -gx PNPM_HOME "/home/u1tbmo/.local/share/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
    set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end
