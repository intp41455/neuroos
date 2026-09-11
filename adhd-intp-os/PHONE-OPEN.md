# 手机独立打开 NeuroOS 的 3 种方式

## 方式一：单文件传到手机（最独立，不需要网络、不需要服务器）

1. 找到 `NeuroOS-standalone.html`（如果还没生成，先在电脑上运行 `python build-standalone.py`）。
2. 把这个文件传到手机：
   - 微信“文件传输助手”
   - QQ
   - 邮件附件
   - 数据线拷贝到手机 Download 文件夹
3. 在手机上点开这个 HTML 文件，选择用浏览器打开。

> 安卓：用文件管理器找到文件 → 长按 → 用 Chrome/Edge 打开。
> iOS：用“文件”App 找到文件 → 点击 → 用 Safari 打开（部分功能可能受限，建议用方式二）。

## 方式二：部署到 GitHub Pages（像真 App，有 HTTPS 和 PWA）

1. 把整个 `/workspace/adhd-intp-os` 文件夹推送到 GitHub 仓库。
2. 在仓库 Settings → Pages → Source 选择 **GitHub Actions**。
3. 推送后会自动运行 `.github/workflows/deploy.yml`。
4. 几分钟后你会得到一个 `https://你的用户名.github.io/仓库名/` 的网址。
5. 手机浏览器打开这个网址 → 菜单 → **添加到主屏幕** → 就能像 App 一样独立打开。

## 方式三：临时用手机访问电脑（同一 WiFi 或内网穿透）

### A. 同一 WiFi 下
1. 电脑上运行 `python start-with-qr.py`。
2. 扫目录里生成的 `qr-lan.png`。

### B. 不在同一 WiFi（用 Cloudflare Tunnel 临时公网）

1. 安装 cloudflared：
   - Windows: `winget install Cloudflare.cloudflared`
   - macOS: `brew install cloudflared`
   - Linux: `sudo apt install cloudflared` 或看官方文档
2. 启动 NeuroOS：
   ```bash
   python start-with-qr.py
   ```
3. 另开终端，运行：
   ```bash
   cloudflared tunnel --url http://localhost:8898
   ```
4. 终端会显示一个 `https://xxxx.trycloudflare.com` 的链接，手机浏览器打开即可。

> 这个链接是临时的，关闭后失效。想要固定地址请用方式二 GitHub Pages。
