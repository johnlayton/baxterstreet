# This plugin loads kenv into the current shell and provides prompt info via
# the 'kenv_prompt_info' function.

FOUND_KENV=$+commands[kenv]

if [[ $FOUND_KENV -ne 1 ]]; then
    kenvdirs=("$HOME/.kenv" "/usr/local/duffparade" "/opt/duffparade" "/usr/local/opt/duffparade")
    for dir in $kenvdirs; do
        if [[ -d $dir/bin ]]; then
            export PATH="$dir/bin:$PATH"
            FOUND_KENV=1
            break
        fi
    done
fi

if [[ $FOUND_KENV -ne 1 ]]; then
    kenvdirs=("$HOME/Development/home/duffparade")
    for dir in $kenvdirs; do
        if [[ -d $dir/bin ]]; then
            export PATH="$dir/bin:$PATH"
            FOUND_KENV=1
            break
        fi
    done
fi

if [[ $FOUND_KENV -ne 1 ]]; then
    if (( $+commands[brew] )) && dir=$(brew --prefix duffparade 2>/dev/null); then
        if [[ -d $dir/bin ]]; then
            export PATH="$dir/bin:$PATH"
            FOUND_KENV=1
        fi
    fi
fi

if [[ $FOUND_KENV -eq 1 ]]; then
    eval "$(kenv init --no-rehash - zsh)"
    function current_kenv_desc() {
        echo "$(kenv machine-desc)"
    }

    function kenv_prompt_info() {
        echo "$(current_kenv_desc)"
    }

    kenv_activate() {
      if [[ -f .kenv-machine ]]; then
        eval "$(kenv activate)"
      fi
    }

    chpwd_functions=(${chpwd_functions[@]} "kenv_activate")
else

    alias kenvs="echo 'not supported'"

    function current_kenv_desc() {
      echo "not supported"
    }

    function kenv_prompt_info() {
      echo "not supported"
    }
fi

unset FOUND_KENV kenvdirs dir
