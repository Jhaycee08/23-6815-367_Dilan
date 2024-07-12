@echo off
:menu
echo --------------Welcome---------------------
echo 1. ipconfig
echo 2. tasklist/taskkill
echo 3. chkdsk
echo 4. format
echo 5. defrag
echo 6. find
echo 7. attrib
echo 8. Exit
echo ==========================================
choice /c 12345678 /m "Enter Choice"
echo ===========================================
if errorlevel 8 goto exit
if errorlevel 7 goto attrib
if errorlevel 6 goto find
if errorlevel 5 goto defrag
if errorlevel 4 goto format
if errorlevel 3 goto chkdsk
if errorlevel 2 goto tasklist
if errorlevel 1 goto ipconfig
:: ipconfig, tasklist/taskkill, chkdsk, format, defrag, find, and attrib
:ipconfig
    ipconfig
    pause
    choice /c YN /m "Do you want to run ipconfig all?"
    if errorlevel 2 goto :menu
    if errorlevel 1 ( 
        ipconfig /all 
        pause 
        cls
        goto :menu
    )

:tasklist
    tasklist
    pause
    choice /c YN /m "Do you want to run taskkill?"
    if errorlevel 2 goto :menu
    if errorlevel 1 (
        set /p a=Enter pid of task to kill:     
        taskkill /pid %a%
        pause
        cls
        goto :menu
    )
:chkdsk
    runas /user:Administrator "cmd.exe /C %CD%\installer.cmd %CD%" 
    chkdsk
    pause
    goto :menu

:format
    format /?
    set /p a=Enter drive letter to format:
    set /p b=Enter what to perform:
    format volume %a%
    pause
    cls
    goto :menu

:defrag
    defrag /?
    pause
    set /p a=Enter which operation you want to perform:
    set /p b=Enter which drive you want to defrag:
    cls
    defrag %b% %a%
    pause
    cls
    goto :menu

:find
    find /?
    pause
    echo format: /C "String" C:\ (filename)
    set /p a=Enter what you want to find:
    find %a%
    pause
    cls
    goto :menu

:attrib
    attrib /?
    pause
    echo format: [drive:][path][filename] [/S [/D]] [/L]
    set /p a=Enter which operation you want to perform:
    attrib %a%
    pause
    cls
    goto :menu
:exit
pause
cls
echo GOODBYE!!