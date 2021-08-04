yay -Syuu && yay -S \
  $(cat ~/.aur-packages | cut -d ' ' -f 1 | xargs)
