#!/bin/bash

dev="$HOME/Developer"
dotfiles="$dev/benwestrate/dotfiles"

if [[ -d "$dotfiles" ]]; then
  echo "Symlinking dotfiles from $dotfiles"
else
  echo "$dotfiles does not exist"
  exit 1
fi

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

for location in $(find home -name '.*'); do
  file="${location##*/}"
  file="${file%.sh}"
  link "$dotfiles/$location" "$HOME/$file"
done

# link config files
for location in $(find config -name '**.*'); do
  file="${location}"
  file="${file//config/.config}"
  link "$dotfiles/$location" "$HOME/$file"
done
