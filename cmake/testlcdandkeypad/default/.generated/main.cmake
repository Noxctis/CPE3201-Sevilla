include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(testlcdandkeypad_default_library_list )

# Handle files with suffix (s|as|asm|AS|ASM|As|aS|Asm), for group default-XC8
if(testlcdandkeypad_default_default_XC8_FILE_TYPE_assemble)
add_library(testlcdandkeypad_default_default_XC8_assemble OBJECT ${testlcdandkeypad_default_default_XC8_FILE_TYPE_assemble})
    testlcdandkeypad_default_default_XC8_assemble_rule(testlcdandkeypad_default_default_XC8_assemble)
    list(APPEND testlcdandkeypad_default_library_list "$<TARGET_OBJECTS:testlcdandkeypad_default_default_XC8_assemble>")

endif()

# Handle files with suffix S, for group default-XC8
if(testlcdandkeypad_default_default_XC8_FILE_TYPE_assemblePreprocess)
add_library(testlcdandkeypad_default_default_XC8_assemblePreprocess OBJECT ${testlcdandkeypad_default_default_XC8_FILE_TYPE_assemblePreprocess})
    testlcdandkeypad_default_default_XC8_assemblePreprocess_rule(testlcdandkeypad_default_default_XC8_assemblePreprocess)
    list(APPEND testlcdandkeypad_default_library_list "$<TARGET_OBJECTS:testlcdandkeypad_default_default_XC8_assemblePreprocess>")

endif()

# Handle files with suffix [cC], for group default-XC8
if(testlcdandkeypad_default_default_XC8_FILE_TYPE_compile)
add_library(testlcdandkeypad_default_default_XC8_compile OBJECT ${testlcdandkeypad_default_default_XC8_FILE_TYPE_compile})
    testlcdandkeypad_default_default_XC8_compile_rule(testlcdandkeypad_default_default_XC8_compile)
    list(APPEND testlcdandkeypad_default_library_list "$<TARGET_OBJECTS:testlcdandkeypad_default_default_XC8_compile>")

endif()


# Main target for this project
add_executable(testlcdandkeypad_default_image_t_9AjYvT ${testlcdandkeypad_default_library_list})

set_target_properties(testlcdandkeypad_default_image_t_9AjYvT PROPERTIES
    OUTPUT_NAME "default"
    SUFFIX ".elf"
    ADDITIONAL_CLEAN_FILES "${output_extensions}"
    RUNTIME_OUTPUT_DIRECTORY "${testlcdandkeypad_default_output_dir}")
target_link_libraries(testlcdandkeypad_default_image_t_9AjYvT PRIVATE ${testlcdandkeypad_default_default_XC8_FILE_TYPE_link})

# Add the link options from the rule file.
testlcdandkeypad_default_link_rule( testlcdandkeypad_default_image_t_9AjYvT)


