# The following variables contains the files used by the different stages of the build process.
set(testlcdandkeypad_default_default_XC8_FILE_TYPE_assemble
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../PracticalActivities/PA1/PA1.as"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../PracticalActivities/PA1/startup.as"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../Test/demo.as"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../Test/startup.as")
set_source_files_properties(${testlcdandkeypad_default_default_XC8_FILE_TYPE_assemble} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${testlcdandkeypad_default_default_XC8_FILE_TYPE_assemble})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(testlcdandkeypad_default_default_XC8_FILE_TYPE_assemblePreprocess)
set_source_files_properties(${testlcdandkeypad_default_default_XC8_FILE_TYPE_assemblePreprocess} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${testlcdandkeypad_default_default_XC8_FILE_TYPE_assemblePreprocess})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(testlcdandkeypad_default_default_XC8_FILE_TYPE_compile
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../MPLABX TEST/testlcdandkeypad2/main.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../MPLABX TEST/testmpx/main.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../PracticalActivities/PA1/LE1.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../PracticalActivities/PA1/PA1.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../Test/demo.c")
set_source_files_properties(${testlcdandkeypad_default_default_XC8_FILE_TYPE_compile} PROPERTIES LANGUAGE C)
set(testlcdandkeypad_default_default_XC8_FILE_TYPE_link)
set(testlcdandkeypad_default_image_name "default.elf")
set(testlcdandkeypad_default_image_base_name "default")

# The output directory of the final image.
set(testlcdandkeypad_default_output_dir "${CMAKE_CURRENT_SOURCE_DIR}/../../../out/testlcdandkeypad")

# The full path to the final image.
set(testlcdandkeypad_default_full_path_to_image ${testlcdandkeypad_default_output_dir}/${testlcdandkeypad_default_image_name})

# Potential output file extensions
set(output_extensions
    .hex
    .hxl
    .mum
    .o
    .sdb
    .sym
    .cmf)
list(TRANSFORM output_extensions PREPEND "${testlcdandkeypad_default_output_dir}/${testlcdandkeypad_default_image_base_name}")
