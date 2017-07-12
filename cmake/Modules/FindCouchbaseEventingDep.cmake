SET(_libcouchbase_exploded ${CMAKE_BINARY_DIR}/tlm/deps/libcouchbase.exploded)
FIND_PATH(LIBCOUCHBASE_INCLUDE_DIR libcouchbase/n1ql.h
          HINTS ${_libcouchbase_exploded}
          PATH_SUFFIXES include
          PATHS
               ~/Library/Frameworks
               /Library/Frameworks
               /opt/local
               /opt/csw
               /opt/jemalloc
               /opt)


FIND_LIBRARY( LIBCOUCHBASE_LIBRARIES
              NAMES couchbase libcoucbase
               HINTS ${CMAKE_INSTALL_PREFIX}/lib
             PATH_SUFFIXES lib
             PATHS
                 ~/Library/Frameworks
                 /Library/Frameworks
                 /opt/local
                 /opt/csw
                 /opt/jemalloc
                 /opt)

MESSAGE(STATUS "Found libcouchbase header and libraries ${LIBCOUCHBASE_INCLUDE_DIR} : ${LIBCOUCHBASE_LIBRARIES}")
IF (LIBCOUCHBASE_LIBRARIES)
  MESSAGE(STATUS "Found libcouchbase sdk ${LIBCOUCHBASE_LIBRARIES}")
ELSE (LIBCOUCHBASE_LIBRARIES)
  MESSAGE(FATAL_ERROR "Can't build Eventing without libcouchbase sdk")
ENDIF (LIBCOUCHBASE_LIBRARIES)

FIND_PATH(LIBUV_INCLUDE_DIR uv.h
          PATH_SUFFIXES libuv
          PATHS
               ~/Library/Frameworks
               /Library/Frameworks
               /opt/local
               /opt/csw
               /opt/jemalloc
               /opt)


FIND_LIBRARY( LIBUV_LIBRARIES
              NAMES uv libuv
             PATH_SUFFIXES lib
             PATHS
                 ~/Library/Frameworks
                 /Library/Frameworks
                 /opt/local
                 /opt/csw
                 /opt/jemalloc
                 /opt)

MESSAGE(STATUS "Found libuv header and libraries ${LIBUV_INCLUDE_DIR} : ${LIBUV_LIBRARIES}")
IF (LIBUV_LIBRARIES)
  MESSAGE(STATUS "Found libuv ${LIBUV_LIBRARIES}")
ELSE (LIBUV_LIBRARIES)
  MESSAGE(FATAL_ERROR "Can't build Eventing without libuv")
ENDIF (LIBUV_LIBRARIES)


MARK_AS_ADVANCED(LIBCOUCHBASE_INCLUDE_DIR LIBCOUCHBASE_LIBRARIES LIBUV_INCLUDE_DIR LIBUV_LIBRARIES)
