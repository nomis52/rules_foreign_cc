
AC_PREREQ([2.69])
AC_INIT([libarea], [1.0])

AC_CONFIG_SRCDIR([include/area.h])
AC_CONFIG_AUX_DIR([config])
#AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_HEADERS([config.h])

AM_INIT_AUTOMAKE
LT_PREREQ([2.2])
LT_INIT()

# Checks for programs.
AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_CC_C_O

# Checks for libraries.

# Checks for header files.
AC_CHECK_HEADERS([stdint.h])

# Checks for typedefs, structures, and compiler characteristics.

 Checks for library functions.
AC_CHECK_LIB([length], [length], [have_length=yes], [have_length=no])
if test "x${have_length}" = "xno"; then
   AC_MSG_ERROR([liblength required to build libvolume])
fi
AC_CHECK_HEADERS([length.h], [have_length_header=yes], [have_length_header=no])
if test "x${have_length_header}" = "xno"; then
   AC_MSG_ERROR([length.h not found])
fi
LENGTH_LIBS=-llength
AC_SUBST(LENGTH_LIBS)

AC_CONFIG_FILES([Makefile include/Makefile src/Makefile])
AC_OUTPUT
