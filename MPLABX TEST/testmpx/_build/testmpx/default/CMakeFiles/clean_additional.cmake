# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "Z:\\CPE3201-Sevilla\\MPLABX TEST\\testmpx\\out\\testmpx\\default.cmf"
  "Z:\\CPE3201-Sevilla\\MPLABX TEST\\testmpx\\out\\testmpx\\default.hex"
  "Z:\\CPE3201-Sevilla\\MPLABX TEST\\testmpx\\out\\testmpx\\default.hxl"
  "Z:\\CPE3201-Sevilla\\MPLABX TEST\\testmpx\\out\\testmpx\\default.mum"
  "Z:\\CPE3201-Sevilla\\MPLABX TEST\\testmpx\\out\\testmpx\\default.o"
  "Z:\\CPE3201-Sevilla\\MPLABX TEST\\testmpx\\out\\testmpx\\default.sdb"
  "Z:\\CPE3201-Sevilla\\MPLABX TEST\\testmpx\\out\\testmpx\\default.sym"
  )
endif()
