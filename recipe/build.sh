#/bin/bash

for f in $(find . -name "*.pyx" -print); do
  echo "$f ..."
  cython -3 -f $f || true
done

rm -rf skimage/viewer/tests  # we don't depend on Qt
$PYTHON -m pip install . --no-deps -vv

