#!/bin/bash

dir() {
  voldev=$(df . | tail -1 | awk '{print $1}')
  vollabel=$(diskutil info "$voldev" 2>/dev/null | awk -F: '/Volume Name/ {print $2}' | sed 's/^ *//')
  [ -z "$vollabel" ] && vollabel="NO NAME"
  echo " Volume in drive $(basename "$voldev") is $vollabel"
  echo " Directory of $(pwd)"
  echo

  total_files=0
  total_dirs=0
  total_bytes=0

  for entry in $(ls -A | LC_ALL=C sort); do
    [ ! -e "$entry" ] && continue

    statline=$(stat -f "%Sm|%z|%N" -t "%m/%d/%Y  %I:%M %p" "$entry" 2>/dev/null)
    mtime=$(echo "$statline" | cut -d'|' -f1)
    size=$(echo "$statline" | cut -d'|' -f2)
    name=$(echo "$statline" | cut -d'|' -f3)

    if [ -d "$entry" ]; then
      printf "%-17s    <DIR>          %s\n" "$mtime" "$name"
      total_dirs=$((total_dirs + 1))
    else
      printf "%-17s %15ld %s\n" "$mtime" "$size" "$name"
      total_files=$((total_files + 1))
      total_bytes=$((total_bytes + size))
    fi
  done

  printf "             %d File(s) %d bytes\n" $total_files $total_bytes
  avail=$(df . | tail -1 | awk '{print $4 * 512}')
  printf "             %d Dir(s) %d bytes free\n" $total_dirs $avail
}

dir "$@"
