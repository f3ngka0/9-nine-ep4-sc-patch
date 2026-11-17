@echo off
chcp 65001 >nul
setlocal
set "DEFAULT_DIR=C:\Program Files (x86)\Steam\steamapps\common\9-nine-Episode 4"
set "GAME_DIR=%~dp0"
if exist "%GAME_DIR%nine_yukiiro.exe" goto :found
if exist "%DEFAULT_DIR%\nine_yukiiro.exe" goto :found_default
echo 请将本补丁文件夹解压或复制到游戏根目录（含 nine_yukiiro.exe 的目录）后运行，
echo 或直接手动把本目录下的 video 文件夹复制到游戏根目录。
pause
exit /b 1

:found_default
set "GAME_DIR=%DEFAULT_DIR%\"

:found
echo 正在安装《9-nine-：雪色雪花雪之痕》简体中文补丁到：
echo "%GAME_DIR%"
xcopy /E /I /Y "%~dp0video" "%GAME_DIR%video" >nul
if not errorlevel 1 goto :ok
echo 复制失败！若游戏安装在 C:\Program Files (x86) 下，请右键“以管理员身份运行”。
pause
exit /b 1

:ok
echo.
echo 安装完成！原版游戏文件未被修改。
echo 提示：若您此前在游戏内设置过英语/日语，启动后请在菜单或设置中选择 Simplified Chinese / 简体中文 即可。
pause
