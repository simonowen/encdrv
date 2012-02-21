@echo off

if "%1"=="clean" goto clean

pyz80.py -I samdos2 --exportfile=trintest.sym trintest.asm
goto end

:clean
if exist trintest.dsk del trintest.dsk trintest.sym

:end
