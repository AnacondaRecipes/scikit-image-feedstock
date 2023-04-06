set -ex
# clean any cython-generated .c/.cpp files (as used by "make clean")
find . -name "*.pyx" -exec ./tools/rm_pyx_assoc_c_cpp.sh {} \;
${PYTHON} -m pip install . -vv --no-deps --no-build-isolation
