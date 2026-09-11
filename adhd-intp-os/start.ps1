# Windows 一键启动 NeuroOS
$Port = 8898
$Dir = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $Dir

# 获取本机 IP
$IP = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -notlike "127.*" -and $_.IPAddress -notlike "169.254.*" } | Select-Object -First 1).IPAddress
if (-not $IP) { $IP = "127.0.0.1" }

$LocalUrl = "http://127.0.0.1:$Port"
$LanUrl = "http://$IP`:$Port"

# 生成二维码（如果 python 可用）
if (Get-Command python -ErrorAction SilentlyContinue) {
    python "$Dir\start-with-qr.py" 2>&1
} else {
    Start-Process $LocalUrl
    python -m http.server $Port
}
