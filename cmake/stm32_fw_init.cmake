macro(stm32_fw_init FAMILY VERSION)
    if (NOT CMAKE_PROJECT_NAME)
        message(WARNING "stm32_fw_init() should be called after the project is created (and languages added)")
    endif()

    add_subdirectory("${STM32_FW_PATH}\\STM32Cube_FW_${FAMILY}_V${VERSION}" Drivers)

endmacro()

macro(stm32_create_outputs TARGET)
    add_custom_command(TARGET ${TARGET}
        POST_BUILD
        COMMAND ${CMAKE_SIZE_UTIL} ${TARGET}
    )

    # Create a custom command to generate binary and hex files.
    # These can be used depending on which method of loading the firmware to the MCU is used.
    add_custom_command(TARGET ${TARGET}
        POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -O ihex ${TARGET} ${TARGET}.hex
        COMMAND ${CMAKE_OBJCOPY} -O binary ${TARGET} ${TARGET}.bin
        # COMMAND ${CMAKE_OBJDUMP} -D ${TARGET} > ${TARGET}.list
    )
endmacro()