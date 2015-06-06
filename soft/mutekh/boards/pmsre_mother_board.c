/*
 * This file is part of PMSRE.
 *
 * PMSRE is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; version 2.1 of the License.
 *
 * PMSRE is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with MutekH; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA
 *
 * Authors:
 *   Copyright (c) 2015 Julien Peeters <contact@julienpeeters.net>
 */

/**
 * @file
 * @module{PMSRE}
 * @short PMSRE mother board definition
 */

#include <device/resources.h>
#include <device/class/iomux.h>
#include <device/class/uart.h>

#include <arch/stm32_irq.h>
#include <arch/stm32_memory_map.h>
#include <arch/stm32f103rg_memory_map.h>

/* CPU */
DEV_DECLARE_STATIC_RESOURCES(cpu_dev_res, 1,
    DEV_STATIC_RES_ID(0, 0),
);

DEV_DECLARE_STATIC(cpu_dev, "cpu", DEVICE_FLAG_CPU, arm_m_drv, &cpu_dev_res);

#if defined(CONFIG_DRIVER_STM32_GPIO)

/* GPIO A..E. */
DEV_DECLARE_STATIC_RESOURCES(gpio_dev_res, 1,
  DEV_STATIC_RES_MEM(
    STM32_DEV_MEM_START(GPIO, A),
    STM32_DEV_MEM_END(GPIO, E)
  ),
);

DEV_DECLARE_STATIC(gpio_dev, "gpio", 0, stm32_gpio_drv, &gpio_dev_res);

#endif

#if defined(CONFIG_DRIVER_STM32_USART)

/* USART 2 */
DEV_DECLARE_STATIC_RESOURCES(usart2_dev_res, 6,
    DEV_STATIC_RES_MEM(
        STM32_DEV_MEM_START(USART, 2),
        STM32_DEV_MEM_END(USART, 2)
    ),

    DEV_STATIC_RES_IRQ(0, STM32_IRQ_USART2, 0, "/cpu"),

    DEV_STATIC_RES_DEV_PARAM("iomux", "/gpio"),
    DEV_STATIC_RES_IOMUX("tx", 0, /* PA2 */ 0*16+2, /* AF? */ 0, 0),
    DEV_STATIC_RES_IOMUX("rx", 0, /* PA3 */ 0*16+3, /* AF? */ 0, 0),

    DEV_STATIC_RES_UART(115200, 8, DEV_UART_PARITY_NONE, 1, 0, 0),
);

DEV_DECLARE_STATIC(usart2_dev, "uart2", 0, stm32_usart_drv, &usart2_dev_res);

#endif
