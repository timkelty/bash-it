#!/usr/bin/env bash

SCM_THEME_PROMPT_DIRTY="${red}"
SCM_THEME_PROMPT_CLEAN="${bold_green}"
SCM_THEME_PROMPT_PREFIX="["
SCM_THEME_PROMPT_SUFFIX="${green}] "

GIT_THEME_PROMPT_DIRTY="${red}"
GIT_THEME_PROMPT_CLEAN="${bold_green}"
GIT_THEME_PROMPT_PREFIX="${reset_color} | ${green}"
GIT_THEME_PROMPT_SUFFIX="${green} "

RVM_THEME_PROMPT_PREFIX=""
RVM_THEME_PROMPT_SUFFIX=""

prompt() {
  PS1="\n${yellow}$(rvm_version_prompt) ${reset_color}| ${purple}\u ${reset_color}| ${reset_color}\w${bold_cyan}$(scm_prompt_info)${green}\n${reset_color}\$ "
}
PROMPT_COMMAND=prompt;
# PS1="\n${yellow}$(rvm_version_prompt) ${reset_color}| ${purple}\u ${reset_color}| ${reset_color}\w${bold_cyan}$(scm_prompt_info)${green}\n${reset_color}\$ "