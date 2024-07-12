@echo off
if not exist Z: (
    echo Folder Z: does not exist. please create drive first. Exiting script.
    pause
    exit /b 1
)

for /f "tokens=*" %%a in ('dir /b /a-d /od /s /t "*.txt" "C:\"') do (
    echo Moving "%%a" to archive
    move "%%a" "%ARCHIVE_DIR%"
)
if not exist Z:\Archive (
    md Z:\Archive
) else ( 
    for /f "tokens=4* delims= " %%a in ('dir /b /o-s /a-d "\*.txt" "Z:\Archive"') do (
    set FILE_SIZE=%%a
    set FILE_NAME=%%~na
    )
)

sort Z:\Archive /M /R


set /p a="These large files will be deleted from archive (y/n): "
if /i "%a%" EQU "y" (
    echo Deleting large files...
    del /f/s/q Z:\Archive > nul
    echo Deletion complete.
) else (
  echo Files not deleted.
)

echo Script completed.

pause