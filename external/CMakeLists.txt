function(stm32_add_library TARGET_NAME)
    if (NOT TARGET ${TARGET_NAME}) # hal, hal_gpio, hal_spi, etc.
        add_library(${TARGET_NAME} INTERFACE)
        target_sources(${TARGET_NAME} INTERFACE
            ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_${TARGET_NAME}.c
        )

        string(TOUPPER ${TARGET_NAME} TARGET_NAME_UPPER)
        target_compile_definitions(${TARGET_NAME} INTERFACE
            ${TARGET_NAME_UPPER}_MODULE_ENABLED
            USE_HAL_DRIVER
            STM32F407xx
        )
        
        target_include_directories(${TARGET_NAME}
        INTERFACE
            ${STM32_FW_PATH}/STM32Cube_FW_F4_V1.26.1/Drivers/STM32F4xx_HAL_Driver/Inc
            ${STM32_FW_PATH}/STM32Cube_FW_F4_V1.26.1/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy
            ${STM32_FW_PATH}/STM32Cube_FW_F4_V1.26.1/Drivers/CMSIS/Device/ST/STM32F4xx/Include
            ${STM32_FW_PATH}/STM32Cube_FW_F4_V1.26.1/Drivers/CMSIS/Include
        )
    endif()
endfunction()
