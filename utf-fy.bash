#!/bin/bash

FILES=$(find . -print | grep -E '\.(nas|bat|c|h|txt)$|Makefile' | sort)

while read line
do
  encode=$(nkf --guess $line)
  if [[ "$encode" == "Shift_JIS"* ]]; then
    echo "LINE: this is sjis. convert it! $line"
    nkf -Sw --overwrite "$line"
  fi
done <<END
$FILES
END
