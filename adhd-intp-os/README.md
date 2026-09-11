# 🧠 NeuroOS

给 ADHD / INTP 设计的认知操作系统。

## 最方便的打开方式

### Windows
1. 安装过 Python（[python.org](https://python.org) 下载，安装时勾选 "Add to PATH"）。
2. 双击 `start.bat`。
3. 浏览器会自动打开，同时目录里会生成 `qr-lan.png`，手机扫码就能访问。

想要桌面图标？右键 `create-shortcut.ps1`，选“使用 PowerShell 运行”。

### macOS / Linux
```bash
cd /path/to/adhd-intp-os
./start.sh
```

### 手机/平板

#### 方案 A：单文件传到手机（最独立，不需要网络/服务器）
1. 运行 `python build-standalone.py` 生成 `NeuroOS-standalone.html`。
2. 把这个文件传到手机（微信文件传输助手 / 邮件 / 数据线）。
3. 在手机上点开，用浏览器打开即可。

#### 方案 B：电脑开机时手机访问（同一 WiFi）
1. 电脑和手机连同一个 WiFi。
2. 电脑运行 `start-with-qr.py` 或 `start.bat`。
3. 用手机相机扫目录里的 `qr-lan.png`。

#### 方案 C：像真 App 一样独立打开（GitHub Pages + PWA）
1. 把整个文件夹推送到 GitHub 仓库。
2. 仓库 Settings → Pages → Source 选 **GitHub Actions**。
3. 自动部署后会得到 `https://你的用户名.github.io/仓库名/`。
4. 手机打开这个网址 → 菜单 → **添加到主屏幕**。

详见 `PHONE-OPEN.md`。

## 文件说明

| 文件 | 作用 |
|------|------|
| `index.html` | 程序入口 |
| `styles.css` | 样式 |
| `app.js` | 核心逻辑 |
| `manifest.json` | PWA 配置 |
| `sw.js` | 离线缓存 |
| `start.bat` | Windows 双击启动 |
| `start.ps1` | PowerShell 启动 |
| `start.sh` | macOS/Linux 启动 |
| `start-with-qr.py` | 启动服务器 + 生成二维码 |
| `create-shortcut.ps1` | 在 Windows 桌面创建快捷方式 |
| `build-standalone.py` | 打包单文件版 `NeuroOS-standalone.html` |
| `NeuroOS-standalone.html` | 单文件版，可直接传到手机打开 |
| `PHONE-OPEN.md` | 手机独立打开详细指南 |
| `DEPLOY-GITHUB-PAGES.md` | GitHub Pages 部署详细指南 |
| `.github/workflows/deploy.yml` | GitHub Pages 自动部署配置 |
| `push-to-github.bat` / `push-to-github.sh` | 一键推送到 GitHub |

## 数据说明

所有数据存在浏览器 `localStorage`，建议定期在“设置”里导出 JSON 备份。
