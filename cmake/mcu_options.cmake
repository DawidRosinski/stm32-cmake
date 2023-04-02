set(MCU_OPTIONS
    -mcpu=cortex-m4
    -mthumb
    -mfpu=fpv4-sp-d16
    -mfloat-abi=hard
)

set(EXTRA_OPTIONS
    -fdata-sections
    -ffunction-sections
)

# https://cmake.org/cmake/help/latest/manual/cmake-buildsystem.7.html#build-configurations
# https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html
set(OPTIMIZATION_OPTIONS
    $<$<CONFIG:Debug>:-Og>
)

# https://gcc.gnu.org/onlinedocs/gcc/Preprocessor-Options.html
set(DEPENDENCY_INFO_OPTIONS
    -MMD
    -MP
    -MF "$(@:%.o=%.d)"
)

# https://gcc.gnu.org/onlinedocs/gcc/Debugging-Options.html
set(DEBUG_INFO_OPTIONS
    -g
    -gdwarf-2
)

# use `target_compile_options()` to override these option for a specific target
add_compile_options(
    ${MCU_OPTIONS}
    ${EXTRA_OPTIONS}
    ${DEBUG_INFO_OPTIONS}
    ${DEPENDENCY_INFO_OPTIONS}
    ${OPTIMIZATION_OPTIONS}
)

add_link_options(
    ${MCU_OPTIONS}
    -specs=nano.specs
    -T${CMAKE_SOURCE_DIR}/STM32F407VGTx_FLASH.ld
    -Wl,-Map=${PROJECT_NAME}.map,--cref
    -Wl,--gc-sections
    -lstdc++
)

link_libraries("-lc -lm -lnosys")