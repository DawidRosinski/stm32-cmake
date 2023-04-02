macro(stm32_fw_init FAMILY VERSION)
    if (NOT CMAKE_PROJECT_NAME)
        message(WARNING "stm32_fw_init() should be called after the project is created (and languages added)")
    endif()

    add_subdirectory("${STM32_FW_PATH}\\STM32Cube_FW_${FAMILY}_V${VERSION}" Drivers)

    target_include_directories(Drivers
    PRIVATE
        config
    )
endmacro()