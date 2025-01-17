@echo on

REM Use clang for pythran support
REM
REM check if clang-cl is on path as required
clang-cl.exe --version
if %ERRORLEVEL% neq 0 exit 1

REM set compilers to clang-cl
set "CC=clang-cl"
set "CXX=clang-cl"

REM clang-cl & gfortran use different LDFLAGS; unset it
set "LDFLAGS="
REM don't add d1trimfile option because clang doesn't recognize it.
set "SRC_DIR="

REM Adding --config-settings=compile-args="-j4" to make the windows build more stable for meson-python and cython compilation.
%PYTHON% -m pip install . -vvv --no-deps --no-build-isolation --config-settings=compile-args="-j4"
if %ERRORLEVEL% neq 0 exit 1
