@echo off

for /r . %%f in (*.pyx) do (
  echo "%%f ..."
  cython -3 -f "%%f" || cmd /k "exit /b 0"
)

clang-cl.exe --version
if %ERRORLEVEL% neq 0 exit 1

REM set compilers to clang-cl
set "CC=clang-cl"
set "CXX=clang-cl"

REM clang-cl & gfortran use different LDFLAGS; unset it
set "LDFLAGS="
REM don't add d1trimfile option because clang doesn't recognize it.
set "SRC_DIR="

rmdir /s /q skimage/viewer/tests 
%PYTHON% -m pip install . -vv

