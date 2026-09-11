# 🧠 NeuroOS

给 ADHD / INTP 设计的任务拆分与启动辅助系统。

## 项目版本说明

本项目包含多个迭代版本，全部保留，方便回溯和后续维护。

| 目录 | 说明 | 主要特点 |
| --- | --- | --- |
| `adhd-planner/` | 初代原型 | 单文件任务拆解工具 |
| `adhd-intp-os/` | 复杂完整版 | 多文件、PWA、专注计时、完整洞察 |
| `adhd-intp-os-simple/` | 极简 4-Tab 版 | 功能精简、操作路径最短 |
| `adhd-intp-os-warm/` | 暖色启动版（手机优先） | 暖色护眼、无计时、启动辅助、单步执行 |
| `adhd-intp-os-web/` | 桌面网页版 | 响应式布局、左侧边栏、保留完整功能 |

## 当前线上版本

- 桌面网页版（响应式）：https://ad6172f97822a5581.app.workbuddy.link
- 备用域名：https://ad6172f97822a5581.app.workbuddy.host

> 同一链接同时适配电脑大屏和手机小屏。

## 快速开始

### 本地打开桌面网页版

```bash
cd adhd-intp-os-web
python3 -m http.server 8080
```

浏览器打开 http://localhost:8080

### 手机优先版

```bash
cd adhd-intp-os-warm
python3 -m http.server 8080
```

## 核心功能

- 自动识别任务类型并拆分为 5 个可执行小步骤
- 「网 → 树 → 线」三段式任务工作区
- 单步执行模式，降低启动阻力
- 2 分钟启动版
- 快速记录 / 停车区
- 信息蒸馏（侦察 → 重构 → 分层 → 校验）
- 睡前交接仪式（3-2-1）
- 节律管理（睡眠 / 校准 / 深度 / 创意 / 断电）
- 洞察统计（预估校准、连续天数、完成曲线）
- JSON 导入导出备份

## 数据结构

所有数据保存在浏览器 `localStorage`，key 为 `neuroos-v1`。主要字段：

```json
{
  "settings": { "wake", "start", "wind", "sleep", "theme", "autoNext", "morningBlock" },
  "quests": [ ... ],
  "parking": { "idea", "question", "block", "insight", "quote" },
  "distills": [],
  "log": { "sessions", "completions" },
  "handoff": { "three", "two", "one", "morning", "date" },
  "meta": { "streak", "lastDay", "best" }
}
```

## 数据与隐私

- 所有数据保存在**本机浏览器**中
- 不上传云端、不跨设备同步
- 换设备、清缓存、卸载浏览器会丢失数据
- 请定期在「我的 → 导出 JSON」备份

## 目录结构

```
/workspace
├── adhd-planner/
│   └── index.html
├── adhd-intp-os/
│   ├── index.html / styles.css / app.js
│   ├── manifest.json / sw.js
│   ├── start.bat / start.sh / start.ps1
│   ├── build-standalone.py
│   ├── NeuroOS-standalone.html
│   ├── push-to-github.sh / push-to-github.bat
│   └── README.md
├── adhd-intp-os-simple/
│   └── index.html
├── adhd-intp-os-warm/
│   ├── index.html
│   └── 使用说明.md
├── adhd-intp-os-web/
│   └── index.html
└── README.md
```

## 技术栈

- 单文件静态 HTML（内联 CSS/JS）
- 零后端依赖
- localStorage 持久化
- 纯原生 JavaScript，兼容旧浏览器（避免 `||=`、`?.` 等新语法）

## 维护说明

1. 主要维护对象：`adhd-intp-os-web/`（当前线上版）
2. 修改后通过发布脚本更新线上链接
3. 每次重大变更建议同步更新本 README 和 `使用说明.md`
