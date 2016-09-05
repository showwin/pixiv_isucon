#!/bin/bash

if [ $# -eq 1 ]; then
  commit_message="${1}"
else
  echo 'no commit message'
  exit 1
fi

if [ -e ./etc ]; then
  echo 'exists etc'
else
  mkdir etc
fi

# 設定ファイルコピー
sudo cp /etc/* ./etc

branch_name=`git rev-parse --abbrev-ref HEAD`

git add .

git commit -m "${commit_message}"

git push origin ${branch_name}
