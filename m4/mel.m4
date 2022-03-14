# -------------------------------------------------------------
# MEL
# -------------------------------------------------------------
AC_DEFUN([CONFIGURE_MEL],
[
  AC_ARG_ENABLE(mel,
                AC_HELP_STRING([--enable-mel],
                               [build with mel support]),
		[case "${enableval}" in
		  yes)  enablemel=yes ;;
		   no)  enablemel=no ;;
 		    *)  AC_MSG_ERROR(bad value ${enableval} for --enable-mel) ;;
		 esac],
		 [enablemel=yes])

  # The MEL lib is distributed with SU2, so we don't have to guess
  # where it might be installed...
  if (test $enablemel = yes); then

    # look for MEL build cppflags by honoring the --with-mel-cppflags="..." flag,
    # defaulting to what we know works
    AC_ARG_WITH([mel-cppflags],
                 AC_HELP_STRING([--with-mel-cppflags="-fPIC"],
                                [Specific MEL C Preprocessor flags to use]),
                 [SU2_MEL_CPPFLAGS="$withval"],
                 [SU2_MEL_CPPFLAGS=""])


     MEL_INCLUDE="-I\$(top_srcdir)/externals/mel"
     MEL_LIB="\$(top_builddir)/externals/mel/libmel.a"
     AC_DEFINE(HAVE_MEL, 1, [Flag indicating whether the library will be compiled with MEL support])
     AC_MSG_RESULT(<<< Configuring library with MEL support >>>)

     # look for thread-local storage
     #AX_TLS
 else
     MEL_INCLUDE=""
     MEL_LIB=""
     SU2_MEL_CPPFLAGS=""
     enablemel=no
  fi

  AC_SUBST(MEL_INCLUDE)
  AC_SUBST(MEL_LIB)
  AC_SUBST(SU2_MEL_CPPFLAGS)
])
