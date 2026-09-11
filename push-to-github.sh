#!/bin/bash
# 用法：填好下面的 TOKEN、USER、REPO，然后在项目根目录运行此脚本
# bash push-to-github.sh

TOKEN="ghp_你的_TOKEN_替换这行"
USER="你的GitHub用户名替换这行"
REPO="neuroos"
REMOTE_URL="https://${USER}:${TOKEN}@github.com/${USER}/${REPO}.git"

echo "1) 检查本地仓库..."
cd "$(dirname "$0")" || exit 1

if [ ! -d .git ]; then
  echo "正在初始化 git..."
  git init
  git config user.email "neuroos@example.com"
  git config user.name "NeuroOS Sync"
  git branch -M main
  git add .
  git commit -m "chore: sync all NeuroOS versions for handover"
fi

echo "2) 创建 GitHub 仓库（如果已存在会跳过）..."
curl -s -H "Authorization: token ${TOKEN}" \
  -H "Accept: application/vnd.github+json" \
  -d "{\"name\":\"${REPO}\",\"private\":false,\"description\":\"NeuroOS - ADHD/INTP 任务拆分与启动辅助系统\"}" \
  https://api.github.com/user/repos | grep -q '"id":' && echo "仓库创建成功或已存在"

echo "3) 设置 remote 并推送..."
git remote remove origin 2>/dev/null
git remote add origin "$REMOTE_URL"
git push -u origin main --force

echo "完成。仓库地址： https://github.com/${USER}/${REPO}"
