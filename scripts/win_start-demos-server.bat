@echo off
echo "PML: Starting Server"

call set PUBLIC=demos
call set DEBUG=signaling-server:

call node "./scripts/start-server"

@echo on