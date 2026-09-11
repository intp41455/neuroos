@echo off
chcp 65001 >nul
setlocal

if "%~1"=="" (
  echo 用法: push-to-github.bat 你的GitHub用户名 [仓库名，默认 neuroos]
  exit /b 1
)

set USER=%~1
set REPO=%~2
if "%REPO%"=="" set REPO=neuroos

cd /d "%~dp0"

echo → 准备推送到 https://github.com/%USER%/%REPO%.git

if not exist .git (
  git init
  git branch -M main
)

git add .
git commit -m "update neuroos %date% %time%" 2>nul || echo 没有变更需要提交

git remote set-url origin "https://github.com/%USER%/%REPO%.git" 2>nul || git remote add origin "https://github.com/%USER%/%REPO%.git"

git push -u origin main

echo ✅ 推送完成。去 GitHub 仓库 Settings → Pages → Source 选 GitHub Actions 启用部署。
echo    网址: https://%USER%.github.io/%REPO%/

pause
