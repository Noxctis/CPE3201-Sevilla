# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "Z:\\CPE3201-Sevilla\\out\\lcdandkeypadactual\\default.cmf"
  "Z:\\CPE3201-Sevilla\\out\\lcdandkeypadactual\\default.hex"
  "Z:\\CPE3201-Sevilla\\out\\lcdandkeypadactual\\default.hxl"
  "Z:\\CPE3201-Sevilla\\out\\lcdandkeypadactual\\default.mum"
  "Z:\\CPE3201-Sevilla\\out\\lcdandkeypadactual\\default.o"
  "Z:\\CPE3201-Sevilla\\out\\lcdandkeypadactual\\default.sdb"
  "Z:\\CPE3201-Sevilla\\out\\lcdandkeypadactual\\default.sym"
  )
endif()
