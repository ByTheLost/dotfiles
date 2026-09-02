########################################
# 🚀 FISH CONFIG - ARCH LINUX (CLEAN)
########################################

# =========================
# INTERACTIVE ONLY
# =========================
if status is-interactive

    # Fisher (plugin manager)
    if not functions -q fisher
        curl -sL https://git.io/fisher | source
        fisher install jorgebucaran/fisher
    end

end

# =========================
# OS DETECTION
# =========================
set -l OS (uname)
set -l IS_TERMUX 0

if test -n "$TERMUX_VERSION"; or test -d /data/data/com.termux
    set IS_TERMUX 1
end

# =========================
# PATH SETUP (ARCH LINUX)
# =========================
if test $IS_TERMUX -eq 1
    set -gx PATH $PREFIX/bin $HOME/.local/bin $HOME/.cargo/bin $PATH

else if test "$OS" = Darwin

    if test -f /opt/homebrew/bin/brew
        set -gx BREW_BIN /opt/homebrew/bin/brew
    else if test -f /usr/local/bin/brew
        set -gx BREW_BIN /usr/local/bin/brew
    end

    set -gx PATH \
        $HOME/.local/bin \
        $HOME/.opencode/bin \
        $HOME/.volta/bin \
        $HOME/.bun/bin \
        $HOME/.cargo/bin \
        $PATH

else
    # 🐧 ARCH / LINUX
    set -gx BREW_BIN /home/linuxbrew/.linuxbrew/bin/brew

    set -gx PATH \
        $HOME/.local/bin \
        $HOME/.opencode/bin \
        $HOME/.volta/bin \
        $HOME/.bun/bin \
        $HOME/.nix-profile/bin \
        /nix/var/nix/profiles/default/bin \
        /usr/local/bin \
        $HOME/.cargo/bin \
        $PATH
end

# =========================
# HOMEBREW (IF EXISTS)
# =========================
if test $IS_TERMUX -eq 0; and set -q BREW_BIN; and test -f $BREW_BIN
    eval ($BREW_BIN shellenv)
end

# =========================
# TMUX / ZELLIJ AUTO START
# =========================
# if not set -q TMUX
#     if type -q tmux
#         tmux new-session -A -s main
#     else if type -q zellij
#         zellij attach -c main
#     end
# end

# =========================
# TOOLS INIT
# =========================
starship init fish | source
zoxide init fish | source
atuin init fish | source
fzf --fish | source

# =========================
# RUNTIME PATH FIX
# =========================
set -gx PATH $HOME/.cargo/bin $PATH

# =========================
# CARAPACE COMPLETIONS
# =========================
set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'

if not test -d ~/.config/fish/completions
    mkdir -p ~/.config/fish/completions
end

if not test -f ~/.config/fish/completions/.initialized
    carapace --list | awk '{print $1}' | xargs -I{} touch ~/.config/fish/completions/{}.fish
    touch ~/.config/fish/completions/.initialized
end

if type -q carapace
    carapace _carapace | source
end

# =========================
# FISH UI SETTINGS
# =========================
set -g fish_greeting ""
fish_vi_key_bindings

# =========================
# EDITOR
# =========================
set -gx EDITOR nvim
set -gx VISUAL nvim

# =========================
# ALIASES
# =========================
alias grep "grep --color=auto"
alias .. "cd .."
# alias ls "eza --icons"
# alias ll "eza -lah --icons"

alias ls "eza --icons=always"
alias ll "eza -lah --icons=always"

alias fzfbat 'fzf --preview="bat --theme=gruvbox-dark --color=always {}"'
alias fzfnvim 'nvim (fzf --preview="bat --theme=gruvbox-dark --color=always {}")'

# =========================
# FZF CD (CTRL+F)
# =========================
function fzf_cd
    set dir (find . -type d 2>/dev/null | fzf)
    if test -n "$dir"
        cd $dir
    end
end

bind \cf fzf_cd

# =========================
# LOCALE
# =========================
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8

# =========================
# BUN
# =========================
set -gx BUN_INSTALL $HOME/.bun
set -gx PATH $BUN_INSTALL/bin $PATH

if test -s "$HOME/.bun/_bun.fish"
    source "$HOME/.bun/_bun.fish"
end

# =========================
# SSH KEYCHAIN
# =========================
if type -q keychain
    keychain --quiet --eval id_ed25519 | source
end

# =========================
# FISH COLORS (YOUR THEME)
# =========================
set -l foreground F3F6F9 normal
set -l selection 263356 normal
set -l comment 8394A3 brblack
set -l red CB7C94 red
set -l orange DEBA87 orange
set -l yellow FFE066 yellow
set -l green B7CC85 green
set -l purple A3B5D6 purple
set -l cyan 7AA89F cyan
set -l pink FF8DD7 magenta

set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
