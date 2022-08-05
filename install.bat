@echo off

set DOTDIR=%HOMEPATH%\dotfiles

where git
if %ERRORLEVEL% == 0 (
    if not exist "%DOTDIR%" (
        git config --system core.symlinks true
        git config --global core.symlinks true
        git clone "https://github.com/taitohaga/dotfiles.git" "%DOTDIR%"
    ) else (
        echo "%DOTDIR% already exists. Quitting..."
        exit /b 1
    )
) else (
    echo "git required" >&2
    exit /b 1
)

echo "Backup files of the old vimfiles in %HOMEPATH%\vimfiles_old "

if exist "%HOMEPATH%\vimfiles" (
    mkdir "%HOMEPATH%\vimfiles_old"
    xcopy /s /h /y /q "%HOMEPATH%\vimfiles" "%HOMEPATH%\vimfiles_old"
    del "%HOMEPATH%\vimfiles"
)

mklink /D "%HOMEPATH%\vimfiles" "%DOTDIR%\.vim"
