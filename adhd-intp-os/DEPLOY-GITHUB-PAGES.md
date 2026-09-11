# 方式二：部署到 GitHub Pages（像真 App）

这种方式会给 NeuroOS 一个固定网址，例如：
```
https://你的名字.github.io/neuroos/
```

手机浏览器打开后，选择"添加到主屏幕"，就能像原生 App 一样独立运行，支持离线使用。

---

## 第一步：注册 GitHub 账号

如果还没有，访问 https://github.com/signup 注册。

---

## 第二步：创建仓库

1. 登录 GitHub，点击右上角 **+** → **New repository**。
2. **Repository name** 填：`neuroos`（可以改，建议用小写英文）。
3. 选择 **Public**（免费）。
4. **不要勾选** "Initialize this repository with a README"。
5. 点击 **Create repository**。

---

## 第三步：上传文件

### 方法 A：网页直接上传（最简单）

1. 在创建好的仓库页面，点击 **uploading an existing file**。
2. 把 `/workspace/adhd-intp-os` 里的所有文件拖到上传区域。
   - 必须包含：`index.html`、`styles.css`、`app.js`、`manifest.json`、`sw.js`
   - 以及文件夹 `.github/workflows/deploy.yml`
3. 页面拉到最下面，点击 **Commit changes**。

### 方法 B：用 Git 命令上传（推荐会命令行的）

```bash
cd /workspace/adhd-intp-os
git init
git branch -M main
git add .
git commit -m "init neuroos"
git remote add origin https://github.com/你的用户名/neuroos.git
git push -u origin main
```

---

## 第四步：启用 GitHub Pages

1. 进入仓库页面，点击顶部的 **Settings**。
2. 左侧菜单点击 **Pages**。
3. 在 **Source** 下面，选择 **GitHub Actions**。
4. 点击保存（如果出现的话）。

然后 GitHub 会自动运行 `.github/workflows/deploy.yml`，把网站部署出去。

---

## 第五步：查看部署进度

1. 点击仓库顶部 **Actions** 标签。
2. 看到一条名为 "Deploy NeuroOS to GitHub Pages" 的工作流。
3. 等它变成绿色 ✅（通常 1-3 分钟）。

---

## 第六步：获取网址

1. 回到 **Settings → Pages**。
2. 上方会显示：
   ```
   Your site is live at https://你的名字.github.io/neuroos/
   ```
3. 电脑或手机打开这个链接。

---

## 第七步：添加到手机主屏幕

### iPhone / iPad（Safari）
1. 用 Safari 打开网址。
2. 点击底部分享按钮 ⬆️。
3. 选择 **添加到主屏幕**。
4. 点击右上角 **添加**。

### 安卓（Chrome / Edge）
1. 用 Chrome 打开网址。
2. 点击右上角菜单（三个点）。
3. 选择 **添加到主屏幕** 或 **安装应用**。
4. 点击 **安装**。

之后手机桌面上会出现一个 🧠 NeuroOS 图标，点开就是独立 App。

---

## 第八步：更新网站

如果以后修改了程序，重新上传文件到 GitHub，Actions 会自动重新部署。

---

## 常见问题

**Q：打开后是 404？**
A：等 2-3 分钟再刷新。如果还 404，检查仓库根目录有没有 `index.html`。

**Q：手机添加到主屏幕后还是浏览器？**
A：检查 `manifest.json` 是否正确上传。安卓 Chrome 会显示"安装应用"，iOS 是"添加到主屏幕"。

**Q：数据会同步吗？**
A：不会。每个设备的数据存在各自浏览器 localStorage 里。可以在设置里导出 JSON，再导入到另一台设备。
