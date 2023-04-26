set -ex
if [[ ${target_platform} == linux-ppc64le ]]; then
  export OPENBLAS_NUM_THREADS=2
fi
# clean any cython-generated .c/.cpp files (as used by "make clean")
find . -name "*.pyx" -exec ./tools/rm_pyx_assoc_c_cpp.sh {} \;
${PYTHON} -m pip install . -vv --no-deps --no-build-isolation
