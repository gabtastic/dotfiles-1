# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Color codes
. ~/dotfiles/bin/bash_colors.sh

# rbenv
if [ -d "$HOME/.rbenv/shims" ] ; then
  eval "$(rbenv init -)"
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/secrets can be used for other settings you don’t want to commit.
for file in ~/dotfiles/{path,bash_prompt,exports,aliases,functions,secrets}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Load Tab Completion
if [ -f `brew --prefix`/etc/bash_completion.d ]; then
    . `brew --prefix`/etc/bash_completion.d
fi

COMPLETION="${HOME}/dotfiles/completion.bash/*.bash"
for config_file in $COMPLETION
do
  source $config_file
done
