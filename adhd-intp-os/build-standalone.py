#!/usr/bin/env python3
"""
把 NeuroOS 打包成单个 HTML 文件，方便传到手机离线打开。
用法: python build-standalone.py
输出: NeuroOS-standalone.html
"""
import os, re

ROOT = os.path.dirname(os.path.abspath(__file__))

def read(name):
    with open(os.path.join(ROOT, name), 'r', encoding='utf-8') as f:
        return f.read()

def write(name, content):
    with open(os.path.join(ROOT, name), 'w', encoding='utf-8') as f:
        f.write(content)

html = read('index.html')
css = read('styles.css')
js = read('app.js')

# 内联 CSS
html = re.sub(
    r'<link rel="stylesheet" href="styles\.css">',
    f'<style>\n{css}\n</style>',
    html
)

# 内联 JS
html = re.sub(
    r'<script src="app\.js"></script>',
    f'<script>\n{js}\n</script>',
    html
)

# 移除 manifest 和 service worker（file:// 下无效，避免报错）
html = re.sub(r'<link rel="manifest" href="manifest\.json">', '', html)
html = re.sub(
    r'<script>\s*if\(\'serviceWorker\' in navigator\)\{\s*navigator\.serviceWorker\.register\(\'sw\.js\'\)\.catch\(\(\)=>\{\}\);\s*\}\s*</script>',
    '',
    html
)

write('NeuroOS-standalone.html', html)
size = os.path.getsize(os.path.join(ROOT, 'NeuroOS-standalone.html'))
print(f'已生成 NeuroOS-standalone.html ({size/1024:.1f} KB)')
print('把它传到手机，用浏览器直接打开即可使用。')
