# common build options for LALFrame

# macros
_make="make -j ${CPU_COUNT} V=1 VERBOSE=1"

# -- compile customisations

export CFLAGS=$(
   echo ${CFLAGS:-} |
   sed -E 's|\/usr\/local\/src\/conda\/'${PKG_NAME}'|/usr/local/src/conda/lalframe|g'
)

# -- configure arguments

CONFIGURE_ARGS="
  --disable-doxygen
  --disable-gcc-flags
  --disable-static
  --disable-swig-octave
  --enable-framec
  --enable-framel
  --prefix=${PREFIX}
"

# disable help2man when cross-compiling
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" = "1" && "${CROSSCOMPILING_EMULATOR}" = "" ]]; then
  CONFIGURE_ARGS="${CONFIGURE_ARGS} --disable-help2man"
fi
