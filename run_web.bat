@echo off
start cmd /k "flutter run -d web-server --web-port=5000 --web-hostname=localhost --web-tls-cert-path=localhost.pem --web-tls-cert-key-path=localhost-key.pem"
timeout /t 5 >nul
start "" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --disable-web-security --user-data-dir="C:/tmp/edge_dev" https://localhost:5000
