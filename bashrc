# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

# VI mode in the terminal
# FIXME: Make sure it works on both ubuntu and Mac
set -o vi

# Color codes
. ~/dotfiles/bin/bash_colors.sh

# rbenv
if [ -d "$HOME/.rbenv/shims" ] ; then
  eval "$(rbenv init -)"
  # export PATH=./bin:"$PATH"
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/secrets can be used for other settings you don’t want to commit.
for file in ~/dotfiles/{path,bash_prompt,exports,aliases,local_aliases,functions,secrets}; do
    [ -r "$file" ] && source "$file"
done
unset file

COMPLETION="${HOME}/dotfiles/completion.bash/*.bash"
for config_file in $COMPLETION
do
  source $config_file
done

# Load Tab Completion
if [[ "$OSTYPE" == "darwin"* ]]; then
  [ -f "$(brew --prefix)/etc/bash_completion" ] && source $(brew --prefix)/etc/bash_completion
fi
