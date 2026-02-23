# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "Z:\\CPE3201-Sevilla\\MPLABX TEST\\testmpx\\out\\testmpx\\production\\default-production.cmf"
  "Z:\\CPE3201-Sevilla\\MPLABX TEST\\testmpx\\out\\testmpx\\production\\default-production.hex"
  "Z:\\CPE3201-Sevilla\\MPLABX TEST\\testmpx\\out\\testmpx\\production\\default-production.hxl"
  "Z:\\CPE3201-Sevilla\\MPLABX TEST\\testmpx\\out\\testmpx\\production\\default-production.mum"
  "Z:\\CPE3201-Sevilla\\MPLABX TEST\\testmpx\\out\\testmpx\\production\\default-production.o"
  "Z:\\CPE3201-Sevilla\\MPLABX TEST\\testmpx\\out\\testmpx\\production\\default-production.sdb"
  "Z:\\CPE3201-Sevilla\\MPLABX TEST\\testmpx\\out\\testmpx\\production\\default-production.sym"
  )
endif()
