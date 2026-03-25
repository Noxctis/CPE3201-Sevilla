include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(Lecture4Practical4_default_library_list )

# Handle files with suffix (s|as|asm|AS|ASM|As|aS|Asm), for group default-XC8
if(Lecture4Practical4_default_default_XC8_FILE_TYPE_assemble)
add_library(Lecture4Practical4_default_default_XC8_assemble OBJECT ${Lecture4Practical4_default_default_XC8_FILE_TYPE_assemble})
    Lecture4Practical4_default_default_XC8_assemble_rule(Lecture4Practical4_default_default_XC8_assemble)
    list(APPEND Lecture4Practical4_default_library_list "$<TARGET_OBJECTS:Lecture4Practical4_default_default_XC8_assemble>")

endif()

# Handle files with suffix S, for group default-XC8
if(Lecture4Practical4_default_default_XC8_FILE_TYPE_assemblePreprocess)
add_library(Lecture4Practical4_default_default_XC8_assemblePreprocess OBJECT ${Lecture4Practical4_default_default_XC8_FILE_TYPE_assemblePreprocess})
    Lecture4Practical4_default_default_XC8_assemblePreprocess_rule(Lecture4Practical4_default_default_XC8_assemblePreprocess)
    list(APPEND Lecture4Practical4_default_library_list "$<TARGET_OBJECTS:Lecture4Practical4_default_default_XC8_assemblePreprocess>")

endif()

# Handle files with suffix [cC], for group default-XC8
if(Lecture4Practical4_default_default_XC8_FILE_TYPE_compile)
add_library(Lecture4Practical4_default_default_XC8_compile OBJECT ${Lecture4Practical4_default_default_XC8_FILE_TYPE_compile})
    Lecture4Practical4_default_default_XC8_compile_rule(Lecture4Practical4_default_default_XC8_compile)
    list(APPEND Lecture4Practical4_default_library_list "$<TARGET_OBJECTS:Lecture4Practical4_default_default_XC8_compile>")

endif()


# Main target for this project
add_executable(Lecture4Practical4_default_image_Sqa89ZIn ${Lecture4Practical4_default_library_list})

set_target_properties(Lecture4Practical4_default_image_Sqa89ZIn PROPERTIES
    OUTPUT_NAME "default"
    SUFFIX ".elf"
    ADDITIONAL_CLEAN_FILES "${output_extensions}"
    RUNTIME_OUTPUT_DIRECTORY "${Lecture4Practical4_default_output_dir}")
target_link_libraries(Lecture4Practical4_default_image_Sqa89ZIn PRIVATE ${Lecture4Practical4_default_default_XC8_FILE_TYPE_link})

# Add the link options from the rule file.
Lecture4Practical4_default_link_rule( Lecture4Practical4_default_image_Sqa89ZIn)


