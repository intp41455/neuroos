#!/usr/bin/env bash
# 一键推送到 GitHub Pages
# 用法: ./push-to-github.sh 你的用户名

set -e

USER="$1"
REPO="${2:-neuroos}"

if [ -z "$USER" ]; then
  echo "用法: ./push-to-github.sh 你的GitHub用户名 [仓库名，默认 neuroos]"
  exit 1
fi

cd "$(dirname "$0")"

echo "→ 准备推送到 https://github.com/$USER/$REPO.git"

if [ ! -d .git ]; then
  git init
  git branch -M main
fi

git add .
git commit -m "update neuroos $(date +%Y-%m-%d-%H:%M)" || echo "没有变更需要提交"

if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "https://github.com/$USER/$REPO.git"
else
  git remote add origin "https://github.com/$USER/$REPO.git"
fi

git push -u origin main

echo "✅ 推送完成。去 GitHub 仓库 Settings → Pages → Source 选 GitHub Actions 启用部署。"
echo "   网址: https://$USER.github.io/$REPO/"
