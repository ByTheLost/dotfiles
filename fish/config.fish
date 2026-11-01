# Commands to run in interactive sessions can go here
if status is-interactive
    # No greeting
    set fish_greeting

    # Use starship
    function starship_transient_prompt_func
        starship module character
    end
    if test "$TERM" != linux
        starship init fish | source
        enable_transience
    end

    # Colors
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    set -gx EZA_ICON_SPACING 2

    # Aliases
    # kitty doesn't clear properly so we need to do this weird printing
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias celar "printf '\033[2J\033[3J\033[1;1H'"
    alias claer "printf '\033[2J\033[3J\033[1;1H'"
    alias pamcan pacman
    alias q 'qs -c ii'
    if test "$TERM" != linux
        alias ls 'eza --icons=auto'
    end
    if test "$TERM" = xterm-kitty
        alias ssh 'kitten ssh'
    end

    # Zoxide: navegación rápida entre directorios
    if type -q zoxide
        zoxide init fish | source

        # z sin argumentos vuelve a Home
        function z
            if test (count $argv) -eq 0
                cd ~
            else
                __zoxide_z $argv
            end
        end
    end

    # Atuin: historial de comandos
    if type -q atuin
        atuin init fish | source
    end

    # FZF: búsqueda interactiva
    if type -q fzf
        fzf --fish | source
    end
end
