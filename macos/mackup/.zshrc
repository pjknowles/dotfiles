if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
ZSH_THEME="frisk"
ZSH_THEME="jreese"
ZSH_THEME="kphoen"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias e="aquamacs"
alias git-delete-merged-branches="python3 -m git_delete_merged_branches"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx)

bindkey -v
source $ZSH/oh-my-zsh.sh

# Customize to your needs...

zstyle ':completion:*' hosts off
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
__git_files () { 
    _wanted files expl 'local files' _files     
}

fi

export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/libffi/lib/pkgconfig"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/opt/homebrew/opt/lapack/lib/pkgconfig"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/opt/homebrew/opt/openblas/lib/pkgconfig"

# test -r /opt/intel/compilers_and_libraries/mac/bin/compilervars.sh && . /opt/intel/compilers_and_libraries/mac/bin/compilervars.sh intel64
# test -r /opt/intel/oneapi/setvars.sh && . /opt/intel/oneapi/setvars.sh
test -r /opt/intel/oneapi/mkl/latest/env/vars.sh && . /opt/intel/oneapi/mkl/latest/env/vars.sh
#export MKLROOT=/opt/intel/oneapi/mkl/latest

export CDPATH=.:..:~:~/Dropbox/current:~/global:~/trees:~/global/programs:~/global/projects
if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
set -o vi

function gu {
result=$(git config --get remote.origin.url)
echo $result|egrep 'global/git|^local:' >/dev/null && ~/global/git/refresh $(echo $result | sed -e 's/^.*[\:\/]//')
git pull $*
}

function ff { osascript -e 'tell application "Finder"'\
 -e "if (${1-1} <= (count Finder windows)) then"\
 -e "get POSIX path of (target of window ${1-1} as alias)"\
 -e 'else' -e 'get POSIX path of (desktop as alias)'\
 -e 'end if' -e 'end tell'; };\

function cdff { cd "`ff $@`"; };

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# iterm2_print_user_vars() {
  # iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
# }

fi

# if [ -r /opt/pgi ]; then
# PGI=/opt/pgi; export PGI
# LM_LICENSE_FILE=$PGI/license.dat; export LM_LICENSE_FILE
# PATH=$PGI/osx86-64/2016/bin:$PATH; export PATH
# fi

export GTK_PATH=$HOME/.gtk-2.0/modules
export GTK_MODULES=gtk-vikb




export PATH=./cmake-build-debug/bin:./cmake-build-release/bin:.:./bin:~/global/bin:/~/bin/x86_64:/~/bin:/opt/homebrew/bin:$PATH

export CHEMSPIDER_API_KEY='UVF0J9Q5utVtYDU3VnGGjrKfDi3h1ALj'
export CMAKE_GENERATOR=Ninja

export OMPI_CXX=g++-12
export OMPI_CC=gcc-12


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/Applications/orca:$PATH"; export LD_LIBRARY_PATH="/Applications/orca:$LD_LIBRARY_PATH"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/opt/homebrew/opt/micromamba/bin/micromamba';
export MAMBA_ROOT_PREFIX='/Users/peterk/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

eval $(thefuck --alias)
