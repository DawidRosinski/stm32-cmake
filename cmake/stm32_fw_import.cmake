if (DEFINED ENV{STM32_FW_PATH} AND (NOT STM32_FW_PATH))
    set(STM32_FW_PATH $ENV{STM32_FW_PATH})
    message("Using STM32_FW_PATH from environment ('${STM32_FW_PATH}')")
endif ()

set(STM32_INIT_CMAKE_FILE ${CMAKE_CURRENT_SOURCE_DIR}/stm32-cmake/cmake/stm32_fw_init.cmake)
if (NOT EXISTS ${STM32_INIT_CMAKE_FILE})
    message(FATAL_ERROR "Directory '${CMAKE_CURRENT_SOURCE_DIR}' does not appear to contain the STM32 firmware or CMake")
endif ()

include(${STM32_INIT_CMAKE_FILE})