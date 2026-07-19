#
# ~/.bash_profile
#

# User-installed tools
case ":$PATH:" in
    *:"$HOME/.local/bin":*) ;;
    *) export PATH="$HOME/.local/bin${PATH:+:${PATH}}" ;;
esac

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/genuinenoob/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/genuinenoob/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<

[[ -f ~/.bashrc ]] && . ~/.bashrc
