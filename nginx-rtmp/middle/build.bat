@echo off
call "D:\Tools\VisualStudio\VC\Auxiliary\Build\vcvarsall.bat" x64 > nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo VS environment setup failed!
    exit /b 1
)
echo VS 2022 x64 environment ready.
set PATH=D:\Tools\StrawberryPerl\perl\bin;%PATH%
echo Starting nmake...
cd /d D:\Tools\nginx-rtmp\middle\nginx
nmake
if %ERRORLEVEL% neq 0 (
    echo Build failed!
    exit /b 1
)
echo.
echo ============================================
echo Build successful!
echo Copying to D:\Tools\nginx-rtmp...
echo ============================================
if not exist "D:\Tools\nginx-rtmp\conf" mkdir "D:\Tools\nginx-rtmp\conf"
if not exist "D:\Tools\nginx-rtmp\logs" mkdir "D:\Tools\nginx-rtmp\logs"
if not exist "D:\Tools\nginx-rtmp\temp" mkdir "D:\Tools\nginx-rtmp\temp"
copy /Y objs\nginx.exe "D:\Tools\nginx-rtmp\"
xcopy /E /Y conf "D:\Tools\nginx-rtmp\conf\"
echo.
echo Done! nginx.exe is at D:\Tools\nginx-rtmp\nginx.exe
