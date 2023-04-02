macro(freertos_init)
    set(FREERTOS_PATH "C:\\repos\\libs\\FreeRTOS-Kernel" CACHE STRING "Path to FreeRTOS")
    list(APPEND CMAKE_MODULE_PATH ${FREERTOS_PATH})
    message("${CMAKE_MODULE_PATH}")
    message("${CMAKE_CURRENT_SOURCE_DIR}")
    
    set(FREERTOS_CONFIG_FILE_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/config" CACHE STRING "")
    set(FREERTOS_PORT GCC_ARM_CM4F CACHE STRING "")

    add_subdirectory(${FREERTOS_PATH} FreeRTOS)
endmacro()