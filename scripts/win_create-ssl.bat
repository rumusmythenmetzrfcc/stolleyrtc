@echo off

echo "PML: Create SSL"

SETLOCAL



:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;;set "[[=>"#" 2>&1&set/p "&set "]]==<# & del /q # >nul 2>&1" &::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo "Step 1: find git directory"
where git %[[%git-path%]]%
::C:\Users\[user]\AppData\Local\Programs\Git\bin

echo %git-path%

echo "Step 2: find git openssl dir"

set git-install-root=%git-path:~0,-11%
set openssl-dir=%git-install-root%usr\bin\

echo %openssl-dir%


echo "Step 3: Set keydir and numdays"
call set keydir=%USERPROFILE%\.ssh\stolleyrtc
echo "keydir=%keydir%"
call set numdays=1825
echo "numdays=%numdays%"

echo "Step 3.1: Create keydir if not existing"
call MD %keydir%

echo "Step 4: Create SSL"

call %openssl-dir%openssl req -x509 -out %keydir%/localhost.crt -keyout %keydir%/localhost.key -newkey rsa:2048 -nodes -sha256 -days %numdays% -subj '/CN=localhost' -extensions EXT -config scripts/conf/self-signed.conf

ENDLOCAL