#!/bin/zsh

# Borrowed from grunt-cli
# http://gruntjs.com/
#
# Copyright (c) 2012 Tyler Kellen, contributors
# Licensed under the MIT license.
# https://github.com/gruntjs/grunt/blob/master/LICENSE-MIT

# Usage:
#
# To enable zsh <tab> completion for grunt, add the following line (minus the
# leading #, which is the zsh comment character) to your ~/.zshrc file:
#
# eval "$(gulp --completion=zsh)"

# Enable zsh autocompletion.
function _gulp_completion() {
  # Grap tasks
  compls=$(node -e "try { var gulp = require('gulp'); require('./gulpfile'); console.log(Object.keys(gulp.tasks).join(' ')); } catch (e) {}")
  # Trim whitespace.
  compls=$(echo "$compls" | sed -e 's/^ *//g' -e 's/ *$//g')
  completions=(${=compls})
  compadd -- $completions
}

compdef _gulp_completion gulp

