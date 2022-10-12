@echo on

for /r . %%f in (*.pyx) do (
  echo "%%f ..."
  cython -3 -f %%f || cmd /k "exit /b 0
)
rmdir /s /q skimage/viewer/tests 
%PYTHON% -m pip install . --no-deps -vv


