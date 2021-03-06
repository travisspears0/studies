/*
 * This program must be called with the constant name as the CONSTANT_NAME
 * define. If this is not the case, then a generic version which takes a
 * symbol to undefine as the first argument will be built.
 */

#include <config.h>

#ifdef HAVE_SYS_CONF_H
# ifdef HAVE_SYS_PARAM_H
# include <sys/param.h>
# endif
# ifdef HAVE_TIME_H
# include <time.h>
# endif
#include <sys/conf.h>
#endif

#ifdef HAVE_SYS_FILE_H
#include <sys/file.h>
#endif

#ifdef HAVE_SYS_IOCTL_H
#include <sys/ioctl.h>
#endif

#ifdef HAVE_SYS_SOCKET_H
#include <sys/socket.h>
#endif

#ifdef HAVE_SYS_SYSTEMINFO_H
#include <sys/systeminfo.h>
#endif

#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif

#ifdef HAVE_ERRNO_H
#include <errno.h>
#endif

#ifdef HAVE_FCNTL_H
#include <fcntl.h>
#endif

#ifdef HAVE_NETDB_H
#include <netdb.h>
#endif

#ifdef HAVE_NETINET_IN_H
#include <netinet/in.h>
#endif

#ifdef HAVE_NETINET_TCP_H
#include <netinet/tcp.h>
#endif

#ifdef HAVE_POLL_H
#include <poll.h>
#endif

#ifdef HAVE_SIGNAL_H
#include <signal.h>
#endif

#ifdef HAVE_STDIO_H
#include <stdio.h>
#endif

#ifdef HAVE_STDLIB_H
#include <stdlib.h>
#endif

#ifdef HAVE_STRING_H
#include <string.h>
#endif

#ifdef HAVE_STROPTS_H
#include <stropts.h>
#endif

#ifdef HAVE_TERMIO_H
#include <termio.h>
#endif

#ifdef HAVE_TERMIOS_H
#include <termios.h>
#endif

#ifdef HAVE_LINUX_SOCKIOS_H
#include <linux/sockios.h>
#endif

#ifdef HAVE_WINDOWS_H
#define Win32_Winsock
#include <windows.h>
/* This directive is checked only for mingw32 2.8.1 */
#if (_WIN32_WINNT >= 0x0400)
#include <ws2tcpip.h>
#endif

/* Absent declarations */
#define POLLIN 1
#define POLLPRI 2
#define POLLOUT 4

/* Undefine cygwin specific declarations to replace them */
#undef EINTR
#undef EWOULDBLOCK
#undef EINPROGRESS
#undef EALREADY
#undef EISCONN
#undef ECONNREFUSED

/* Replace with Windows sockets declaration */
#define EINTR		WSAEINTR
#define EWOULDBLOCK	WSAEWOULDBLOCK
#define EINPROGRESS	WSAEINPROGRESS
#define EALREADY	WSAEALREADY
#define EISCONN		WSAEISCONN
#define ECONNREFUSED	WSAECONNREFUSED
#endif

#include <ctype.h>

static char *
capitalize (char *name)
{
  int  beginning = 1;
  char *result   = (char *) malloc (strlen (name) + 1);
  char *ptr;
  for (ptr = result; *name; ptr++, name++) {
    *ptr = *name;
    if (beginning) {
      beginning = 0;
    } else if (*ptr == '_') {
      beginning = 1;
    } else if (isupper(*ptr)) {
      *ptr = tolower(*ptr);
    }
  }
  *ptr = '\0';
  return result;
}

static void
output (char *name, int value)
{
  char *capitalized = capitalize (name);
  if (value >= 0) {
    printf ("   %-20s : constant := 16#%04X#;\n", capitalized, value);
  } else {
    printf ("   %-20s : constant := %d;\n", capitalized, value);
  }
}

int
main (int argc, char *argv[])
{
#ifdef CONSTANT_NAME
  output (argv[1], CONSTANT_NAME);
#else
  output (argv[1], -1);
#endif
  exit (0);
}
