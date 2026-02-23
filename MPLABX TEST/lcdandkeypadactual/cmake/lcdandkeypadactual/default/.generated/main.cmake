include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(lcdandkeypadactual_default_library_list )

# Handle files with suffix (s|as|asm|AS|ASM|As|aS|Asm), for group default-XC8
if(lcdandkeypadactual_default_default_XC8_FILE_TYPE_assemble)
add_library(lcdandkeypadactual_default_default_XC8_assemble OBJECT ${lcdandkeypadactual_default_default_XC8_FILE_TYPE_assemble})
    lcdandkeypadactual_default_default_XC8_assemble_rule(lcdandkeypadactual_default_default_XC8_assemble)
    list(APPEND lcdandkeypadactual_default_library_list "$<TARGET_OBJECTS:lcdandkeypadactual_default_default_XC8_assemble>")

endif()

# Handle files with suffix S, for group default-XC8
if(lcdandkeypadactual_default_default_XC8_FILE_TYPE_assemblePreprocess)
add_library(lcdandkeypadactual_default_default_XC8_assemblePreprocess OBJECT ${lcdandkeypadactual_default_default_XC8_FILE_TYPE_assemblePreprocess})
    lcdandkeypadactual_default_default_XC8_assemblePreprocess_rule(lcdandkeypadactual_default_default_XC8_assemblePreprocess)
    list(APPEND lcdandkeypadactual_default_library_list "$<TARGET_OBJECTS:lcdandkeypadactual_default_default_XC8_assemblePreprocess>")

endif()

# Handle files with suffix [cC], for group default-XC8
if(lcdandkeypadactual_default_default_XC8_FILE_TYPE_compile)
add_library(lcdandkeypadactual_default_default_XC8_compile OBJECT ${lcdandkeypadactual_default_default_XC8_FILE_TYPE_compile})
    lcdandkeypadactual_default_default_XC8_compile_rule(lcdandkeypadactual_default_default_XC8_compile)
    list(APPEND lcdandkeypadactual_default_library_list "$<TARGET_OBJECTS:lcdandkeypadactual_default_default_XC8_compile>")

endif()


# Main target for this project
add_executable(lcdandkeypadactual_default_image_u8_xdkU2 ${lcdandkeypadactual_default_library_list})

set_target_properties(lcdandkeypadactual_default_image_u8_xdkU2 PROPERTIES
    OUTPUT_NAME "default"
    SUFFIX ".elf"
    ADDITIONAL_CLEAN_FILES "${output_extensions}"
    RUNTIME_OUTPUT_DIRECTORY "${lcdandkeypadactual_default_output_dir}")
target_link_libraries(lcdandkeypadactual_default_image_u8_xdkU2 PRIVATE ${lcdandkeypadactual_default_default_XC8_FILE_TYPE_link})

# Add the link options from the rule file.
lcdandkeypadactual_default_link_rule( lcdandkeypadactual_default_image_u8_xdkU2)


