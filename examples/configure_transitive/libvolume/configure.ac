
AC_PREREQ([2.69])
AC_INIT([libvolume], [1.0])

AC_CONFIG_SRCDIR([include/volume.h])
AC_CONFIG_AUX_DIR([config])
#AC_CONFIG_MACRO_DIRS([config])
AC_CONFIG_HEADERS([config.h])

AM_INIT_AUTOMAKE
LT_PREREQ([2.2])
LT_INIT()

# Checks for programs.
AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_CC_C_O
AC_PROG_LIBTOOL

# Checks for header files.
AC_CHECK_HEADERS([stdint.h])

# Checks for libraries.
AC_ARG_WITH([libarea],
            AC_HELP_STRING([--without-libarea], [skip check for libarea]),
             [ case "$withval" in
             no)  ac_with_area=no ;;
             yes) ac_with_area=yes ;;
             *)   ac_with_area=yes ;;
           esac
           ])

AREA_LIBS=
if test x"${ac_with_area}" = xyes; then
  AC_MSG_CHECKING([for libarea support])
  AC_CHECK_LIB([area], [area], [have_area=yes], [have_area=no])
  if test "x${have_area}" = "xno"; then
     AC_MSG_ERROR([libarea required to build libvolume])
  fi
  AC_CHECK_HEADERS([area.h], [have_area_header=yes], [have_area_header=no])
  if test "x${have_area_header}" = "xno"; then
     AC_MSG_ERROR([area.h not found])
  fi
  AC_MSG_RESULT([yes])
  AREA_LIBS=-larea
fi
AC_SUBST(AREA_LIBS)

AC_CONFIG_FILES([Makefile include/Makefile src/Makefile])
AC_OUTPUT
