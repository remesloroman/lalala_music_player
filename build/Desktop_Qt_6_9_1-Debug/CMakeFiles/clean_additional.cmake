# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appTestPlayer_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appTestPlayer_autogen.dir/ParseCache.txt"
  "appTestPlayer_autogen"
  )
endif()
