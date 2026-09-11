# 在 Windows 桌面创建 NeuroOS 快捷方式
$WshShell = New-Object -ComObject WScript.Shell
$Desktop = [Environment]::GetFolderPath("Desktop")
$Shortcut = $WshShell.CreateShortcut("$Desktop\NeuroOS.lnk")
$Shortcut.TargetPath = "powershell.exe"
$Shortcut.Arguments = "-WindowStyle Hidden -ExecutionPolicy Bypass -File `"$PSScriptRoot\start.ps1`""
$Shortcut.WorkingDirectory = "$PSScriptRoot"
$Shortcut.IconLocation = "shell32.dll,14"
$Shortcut.Description = "NeuroOS · ADHD/INTP 认知操作系统"
$Shortcut.Save()
Write-Host "桌面快捷方式已创建: $Desktop\NeuroOS.lnk"
