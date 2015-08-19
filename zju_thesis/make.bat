@echo off
title Monster XeLaTeX Template
:start
cls
echo 欢迎使用 XeLaTeX 学位论文模板，请指示您的需要~
echo ----------------
echo 0. 清理冗余文件
echo 1. 测试 main
echo 2. 退出
echo ----------------
set /p num="请输入您的选择: "
if "%num%"=="1" goto main
if "%num%"=="2" goto exit
if "%num%"=="0" goto clean
echo 错误的选择！
pause
goto start

:main
cls
call "clean.bat"
xelatex main
bibtex main
xelatex main
xelatex main
main.pdf
echo work down!
pause
goto start

:clean
call "clean.bat"
echo work down!
pause
goto start

:exit
exit