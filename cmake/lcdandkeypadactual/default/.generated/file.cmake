# The following variables contains the files used by the different stages of the build process.
set(lcdandkeypadactual_default_default_XC8_FILE_TYPE_assemble
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../PracticalActivities/PA1/PA1.as"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../PracticalActivities/PA1/startup.as"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../Test/demo.as"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../Test/startup.as")
set_source_files_properties(${lcdandkeypadactual_default_default_XC8_FILE_TYPE_assemble} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${lcdandkeypadactual_default_default_XC8_FILE_TYPE_assemble})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(lcdandkeypadactual_default_default_XC8_FILE_TYPE_assemblePreprocess)
set_source_files_properties(${lcdandkeypadactual_default_default_XC8_FILE_TYPE_assemblePreprocess} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${lcdandkeypadactual_default_default_XC8_FILE_TYPE_assemblePreprocess})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(lcdandkeypadactual_default_default_XC8_FILE_TYPE_compile
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../MPLABX TEST/lcdandkeypadactual/main.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../MPLABX TEST/testmpx/main.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../PracticalActivities/PA1/LE1.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../PracticalActivities/PA1/PA1.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../Test/demo.c")
set_source_files_properties(${lcdandkeypadactual_default_default_XC8_FILE_TYPE_compile} PROPERTIES LANGUAGE C)
set(lcdandkeypadactual_default_default_XC8_FILE_TYPE_link)
set(lcdandkeypadactual_default_image_name "default.elf")
set(lcdandkeypadactual_default_image_base_name "default")

# The output directory of the final image.
set(lcdandkeypadactual_default_output_dir "${CMAKE_CURRENT_SOURCE_DIR}/../../../out/lcdandkeypadactual")

# The full path to the final image.
set(lcdandkeypadactual_default_full_path_to_image ${lcdandkeypadactual_default_output_dir}/${lcdandkeypadactual_default_image_name})

# Potential output file extensions
set(output_extensions
    .hex
    .hxl
    .mum
    .o
    .sdb
    .sym
    .cmf)
list(TRANSFORM output_extensions PREPEND "${lcdandkeypadactual_default_output_dir}/${lcdandkeypadactual_default_image_base_name}")
