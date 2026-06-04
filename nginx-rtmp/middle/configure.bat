@echo off
call "D:\Tools\VisualStudio\VC\Auxiliary\Build\vcvarsall.bat" x64 > nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo VS environment setup failed!
    exit /b 1
)
echo VS 2022 x64 environment ready.
echo Starting configure...
D:\Tools\Git\bin\bash.exe -c "cd /d/Tools/nginx-rtmp/middle/nginx && auto/configure --with-cc=cl --with-debug --prefix= --conf-path=conf/nginx.conf --pid-path=logs/nginx.pid --http-log-path=logs/access.log --error-log-path=logs/error.log --sbin-path=nginx.exe --http-client-body-temp-path=temp/client_body_temp --http-proxy-temp-path=temp/proxy_temp --http-fastcgi-temp-path=temp/fastcgi_temp --http-scgi-temp-path=temp/scgi_temp --http-uwsgi-temp-path=temp/uwsgi_temp --with-cc-opt="-DFD_SETSIZE=1024 -wd5294" --with-pcre=objs/lib/pcre2 --with-zlib=objs/lib/zlib --with-openssl=objs/lib/openssl --with-openssl-opt="no-asm no-tests" --with-http_ssl_module --with-http_v2_module --with-http_realip_module --with-http_stub_status_module --with-http_mp4_module --with-http_flv_module --with-stream --add-module=/c/Users/kedlikz/Downloads/nginx-http-flv-module-1.2.13"
if %ERRORLEVEL% neq 0 (
    echo Configure failed!
    exit /b 1
)
echo Configure done.
