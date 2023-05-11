trash() {
  files=()
  dirs=()
  for file in "$@"; do
    if [ -d "$file" ]; then
      dirs+=("$file")
      mv -f "$file" ~/.Trash
    else
      files+=("$file")
      mv -f "$file" ~/.Trash
    fi
  done
  if [ ${#dirs[@]} -gt 0 ]; then
    echo "Moved directories: ${dirs[*]} to Trash directory"
  fi
  if [ ${#files[@]} -gt 0 ]; then
    echo "Moved files: ${files[*]} to Trash directory"
  fi
}

trash-empty() {
  rm -rf ~/.Trash/*
  echo "Trash directory has been emptied"
}

caches-empty() {
  cd ~/Library/Caches
  if [ "$(ls -A .)" ]; then
    rm -rf *
    echo "Cache directory emptied."
  else
    echo "Cache directory is already empty."
  fi
}