include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(TESTINGVISUAL_default_library_list )

# Handle files with suffix (s|as|asm|AS|ASM|As|aS|Asm), for group default-XC8
if(TESTINGVISUAL_default_default_XC8_FILE_TYPE_assemble)
add_library(TESTINGVISUAL_default_default_XC8_assemble OBJECT ${TESTINGVISUAL_default_default_XC8_FILE_TYPE_assemble})
    TESTINGVISUAL_default_default_XC8_assemble_rule(TESTINGVISUAL_default_default_XC8_assemble)
    list(APPEND TESTINGVISUAL_default_library_list "$<TARGET_OBJECTS:TESTINGVISUAL_default_default_XC8_assemble>")

endif()

# Handle files with suffix S, for group default-XC8
if(TESTINGVISUAL_default_default_XC8_FILE_TYPE_assemblePreprocess)
add_library(TESTINGVISUAL_default_default_XC8_assemblePreprocess OBJECT ${TESTINGVISUAL_default_default_XC8_FILE_TYPE_assemblePreprocess})
    TESTINGVISUAL_default_default_XC8_assemblePreprocess_rule(TESTINGVISUAL_default_default_XC8_assemblePreprocess)
    list(APPEND TESTINGVISUAL_default_library_list "$<TARGET_OBJECTS:TESTINGVISUAL_default_default_XC8_assemblePreprocess>")

endif()

# Handle files with suffix [cC], for group default-XC8
if(TESTINGVISUAL_default_default_XC8_FILE_TYPE_compile)
add_library(TESTINGVISUAL_default_default_XC8_compile OBJECT ${TESTINGVISUAL_default_default_XC8_FILE_TYPE_compile})
    TESTINGVISUAL_default_default_XC8_compile_rule(TESTINGVISUAL_default_default_XC8_compile)
    list(APPEND TESTINGVISUAL_default_library_list "$<TARGET_OBJECTS:TESTINGVISUAL_default_default_XC8_compile>")

endif()


# Main target for this project
add_executable(TESTINGVISUAL_default_image_I_5xrzac ${TESTINGVISUAL_default_library_list})

set_target_properties(TESTINGVISUAL_default_image_I_5xrzac PROPERTIES
    OUTPUT_NAME "default"
    SUFFIX ".elf"
    ADDITIONAL_CLEAN_FILES "${output_extensions}"
    RUNTIME_OUTPUT_DIRECTORY "${TESTINGVISUAL_default_output_dir}")
target_link_libraries(TESTINGVISUAL_default_image_I_5xrzac PRIVATE ${TESTINGVISUAL_default_default_XC8_FILE_TYPE_link})

# Add the link options from the rule file.
TESTINGVISUAL_default_link_rule( TESTINGVISUAL_default_image_I_5xrzac)


