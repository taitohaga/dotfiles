@echo off

echo "Backup files of the old vimfiles in %HOMEPATH%\vimfiles_old "

if exist "%HOMEPATH%\vimfiles" (
    mkdir "%HOMEPATH%\vimfiles_old"
    xcopy /s /h /y /q "%HOMEPATH%\vimfiles" "%HOMEPATH%\vimfiles_old"
    del "%HOMEPATH%\vimfiles"
)

mklink /D "%HOMEPATH%\vimfiles" ".\.vim"
