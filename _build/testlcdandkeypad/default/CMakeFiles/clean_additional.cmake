# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "Z:\\CPE3201-Sevilla\\out\\testlcdandkeypad\\default.cmf"
  "Z:\\CPE3201-Sevilla\\out\\testlcdandkeypad\\default.hex"
  "Z:\\CPE3201-Sevilla\\out\\testlcdandkeypad\\default.hxl"
  "Z:\\CPE3201-Sevilla\\out\\testlcdandkeypad\\default.mum"
  "Z:\\CPE3201-Sevilla\\out\\testlcdandkeypad\\default.o"
  "Z:\\CPE3201-Sevilla\\out\\testlcdandkeypad\\default.sdb"
  "Z:\\CPE3201-Sevilla\\out\\testlcdandkeypad\\default.sym"
  )
endif()
