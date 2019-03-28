@echo off
rem 本batファイルを置いたフォルダにある*.jsファイルをnodeで実行する。
rem 複数の*.jsファイルがある場合、一つのみ実行する。

cd /d %~dp0
for /f "usebackq tokens=*" %%a in (`dir /b *.js`) do @set NODE_FILE_NAME=%%a&goto :exit_for
:exit_for

echo 続行すると%NODE_FILE_NAME%を実行します。
echo.

pause

node %NODE_FILE_NAME%

echo.
echo %NODE_FILE_NAME%の実行が完了しました。
pause