@echo off

echo "Making backup of the previous vimfiles..."

if exist "%HOMEPATH%\vimfiles" (
    copy "%HOMEPATH%\vimfiles" "%HOMEPATH%\vimfiles_old"
    del "%HOMEPATH%/vimfiles"
)

mklink /D "%HOMEPATH%\vimfiles" ".\.vim"
