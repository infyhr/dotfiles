ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} *%{$fg[white]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$reset_color%} "

vcs_status() {
if [[ $(whence in_svn) != "" ]] && in_svn; then
svn_prompt_info
elif [[ $(whence in_hg) != "" ]] && in_hg; then
hg_prompt_info
else
git_prompt_info
fi
}

#PROMPT='%2~ $(vcs_status)»%b '
PROMPT='%{$fg[red]%}%n@%m %{$reset_color%}%~ $(vcs_status)%{$fg[red]%}$%{$reset_color%} '
