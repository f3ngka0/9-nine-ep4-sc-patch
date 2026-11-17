@echo off
chcp 65001 >nul
setlocal
set "DEFAULT_DIR=C:\Program Files (x86)\Steam\steamapps\common\9-nine-Episode 4"
set "GAME_DIR=%~dp0"
if exist "%GAME_DIR%nine_yukiiro.exe" goto :found
if exist "%DEFAULT_DIR%\nine_yukiiro.exe" goto :found_default
echo 未找到 nine_yukiiro.exe，请手动删除游戏目录下的 video 文件夹即可完全卸载补丁。
pause
exit /b 1

:found_default
set "GAME_DIR=%DEFAULT_DIR%\"

:found
if not exist "%GAME_DIR%video" goto :not_found
rmdir /S /Q "%GAME_DIR%video"
echo 已卸载简体中文补丁，游戏已恢复纯原版状态。
pause
exit /b 0

:not_found
echo 未检测到已安装的补丁（video 目录不存在）。
pause
