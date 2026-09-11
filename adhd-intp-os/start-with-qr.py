#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
一键启动 NeuroOS 并生成手机扫码二维码。
Windows/macOS/Linux 都能跑。
"""
import os, socket, subprocess, sys, webbrowser

def get_ip():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]
        s.close()
        return ip
    except Exception:
        return "127.0.0.1"

def make_qr(url, path):
    try:
        import qrcode
        qr = qrcode.QRCode(box_size=10, border=2)
        qr.add_data(url)
        qr.make(fit=True)
        img = qr.make_image(fill_color="#0f0f12", back_color="#ffffff")
        img.save(path)
        return True
    except Exception as e:
        print("生成二维码失败:", e)
        return False

def main():
    port = 8898
    ip = get_ip()
    local_url = f"http://127.0.0.1:{port}"
    lan_url = f"http://{ip}:{port}"
    base = os.path.dirname(os.path.abspath(__file__))
    os.chdir(base)

    qr_path = os.path.join(base, "qr-lan.png")
    make_qr(lan_url, qr_path)

    print("=" * 50)
    print("🧠 NeuroOS 已启动")
    print("-" * 50)
    print(f"电脑访问: {local_url}")
    print(f"手机扫码访问: {lan_url}")
    print(f"二维码图片: {qr_path}")
    print("=" * 50)
    print("按 Ctrl+C 停止服务")

    webbrowser.open(local_url)

    try:
        from http.server import HTTPServer, SimpleHTTPRequestHandler
        server = HTTPServer(("0.0.0.0", port), SimpleHTTPRequestHandler)
        server.serve_forever()
    except KeyboardInterrupt:
        print("\n已停止")
        sys.exit(0)

if __name__ == "__main__":
    main()
