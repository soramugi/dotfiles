@echo off
rem �{bat�t�@�C����u�����t�H���_�ɂ���*.js�t�@�C����node�Ŏ��s����B
rem ������*.js�t�@�C��������ꍇ�A��̂ݎ��s����B

cd /d %~dp0
for /f "usebackq tokens=*" %%a in (`dir /b *.js`) do @set NODE_FILE_NAME=%%a&goto :exit_for
:exit_for

echo ���s�����%NODE_FILE_NAME%�����s���܂��B
echo.

pause

node %NODE_FILE_NAME%

echo.
echo %NODE_FILE_NAME%�̎��s���������܂����B
pause