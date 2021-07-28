paru -Syuu --skipreview --noupgrademenu \
  $(cat ~/.aur-packages | cut -d ' ' -f 1 | xargs)
