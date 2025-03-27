@echo off
echo "PML: envar setup"

call set LOCALHOST_SSL_CERT=%USERPROFILE%\.ssh\stolleyrtc\localhost.crt
call set LOCALHOST_SSL_KEY=%USERPROFILE%\.ssh\stolleyrtc\localhost.key

@echo on