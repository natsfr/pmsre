
# include <device/device.h>
# include <device/driver.h>
# include <device/resources.h>
# include <device/irq.h>
# include <device/class/iomux.h>
# include <device/class/clock.h>
#include <device/class/uart.h>

#include <arch/stm32_irq.h>
#include <arch/stm32_memory_map.h>
#include <hexo/iospace.h>

/* CPU */

DEV_DECLARE_STATIC(cpu_dev, "cpu", DEVICE_FLAG_CPU, arm32m_drv,
                   DEV_STATIC_RES_ID(0, 0),
                   );

//void wait()
//{
//  uint32_t i = 100;
//  while (i--)
//    asm volatile("nop");
//}
//
//void spi_send(uint32_t x)
//{
//  uint32_t l = 24;
//
//  wait();
//  cpu_mem_write_32(0x40010c00 + 0x10, 0x00002000); /* set pb13 clk */
//  wait();
//  cpu_mem_write_32(0x40010c00 + 0x10, 0x10000000); /* clear pb12 cs */
//  wait();
//
//  while (l--)
//    {
//      if (x & 0x00800000)
//        cpu_mem_write_32(0x40010c00 + 0x10, 0x00008000); /* set pb15 mosi */
//      else
//        cpu_mem_write_32(0x40010c00 + 0x10, 0x80000000); /* clear pb15 */
//      x <<= 1;
//      wait();
//
//      cpu_mem_write_32(0x40010c00 + 0x10, 0x20000000); /* clear pb13 */
//      wait();
//      cpu_mem_write_32(0x40010c00 + 0x10, 0x00002000); /* set pb13 */
//      wait();
//    }
//
//  cpu_mem_write_32(0x40010c00 + 0x10, 0x00001000); /* set pb12 */
//  wait();
//}
//

void app_start()
{
//  /* enable mco on sysclk */
//  cpu_mem_write_32(0x40021000 + 0x04, /* io banks */ 0x04000000);
//
//  /* enable io bank clocks */
//  cpu_mem_write_32(0x40021000 + 0x18, /* io banks */ 0x7c);
//
//  /* port a8 alternate func */
//  cpu_mem_write_32(0x40010800 + 0x04, /* io banks */ 0x4444444b);
//
//  /* set pc11 pc12 for leds + dac */
//  cpu_mem_write_32(0x40011000 + 0x04, /* io banks */ 0x44333444);
//  cpu_mem_write_32(0x40011000 + 0x0c, /* io banks */ 0x00001800);
//
//  /* toggle dac clr */
//  cpu_mem_write_32(0x40011000 + 0x10, /* io banks */ 0x00002000);
//
//  /* port b[12,13,15] spi */
//  cpu_mem_write_32(0x40010c00 + 0x04, /* io banks */ 0x34334444);
//  cpu_mem_write_32(0x40010c00 + 0x10, 0x00001000); /* set pb12 cs */
//
//  spi_send(0x500000);           /* reset */
//  spi_send(0x400f00);           /* power */
//  spi_send(0x760f00);           /* ref */
//  spi_send(0x827900);           /* set all dacs */
//
//  /* orange led off */
//  cpu_mem_write_32(0x40011000 + 0x10, /* io banks */ 0x08000000);
//
//  while (1)
//    ;
}

#include <hexo/endian.h>
#include <hexo/iospace.h>
#include <arch/stm32f1xx_rcc.h>
#include <mutek/startup.h>

#define __IO volatile

struct stm32f1xx_flash_dev_s
{
  __IO uint32_t FLASH_ACR;
  __IO uint32_t FLASH_KEYR;
  __IO uint32_t FLASH_OPTKEYR;
  __IO uint32_t FLASH_SR;
  __IO uint32_t FLASH_CR;
  __IO uint32_t FLASH_AR;
  __IO uint32_t __reserved0;
  __IO uint32_t FLASH_OBR;
  __IO uint32_t FLASH_WRPR;
} __attribute__ ((packed));

#define STM32_FLASH_LAT_WS(n)   ((n) & 0x7)

void stm32_clock_init(void)
{
  uint32_t x;

  __IO struct stm32f1xx_flash_dev_s *flash_dev =
    (struct stm32f1xx_flash_dev_s *) 0x40022000;

  /* disable interrupts. */
  cpu_mem_write_32(STM32_RCC_ADDR + STM32_RCC_CIR_ADDR, 0);

  /* PLL OFF, PLLI2S OFF, HSE ON, HSI OFF. */
  cpu_mem_write_32(STM32_RCC_ADDR + STM32_RCC_CR_ADDR,
    endian_le32(STM32_RCC_CR_HSEON));

  /* wait for hse stability. */
  do
    {
      x = endian_le32(cpu_mem_read_32(STM32_RCC_ADDR + STM32_RCC_CR_ADDR));
    }
  while (!(x & STM32_RCC_CR_HSERDY));

  /* set pll to 64MHz. */
  x = 0;
  STM32_RCC_CFGR_PLLSRC_SET(x, HSE);
  STM32_RCC_CFGR_PLLXTPRE_SET(x, DIV_1);
  STM32_RCC_CFGR_PLLMUL_SET(x, MUL_4);
  cpu_mem_write_32(STM32_RCC_ADDR + STM32_RCC_CFGR_ADDR, endian_le32(x));

  /* switch the pll on. */
  x = endian_le32(cpu_mem_read_32(STM32_RCC_ADDR + STM32_RCC_CR_ADDR));
  STM32_RCC_CR_PLLON_SET(x, 1);
  cpu_mem_write_32(STM32_RCC_ADDR + STM32_RCC_CR_ADDR, endian_le32(x));

  /* wait until pll is locked. */
  do
    {
      x = endian_le32(cpu_mem_read_32(STM32_RCC_ADDR + STM32_RCC_CR_ADDR));
    }
  while (!(x & STM32_RCC_CR_PLLRDY));

  /* set wait cycles for the flash. */
  flash_dev->FLASH_ACR = STM32_FLASH_LAT_WS(2);

  /* configure prescalers. */
  x = endian_le32(cpu_mem_read_32(STM32_RCC_ADDR + STM32_RCC_CFGR_ADDR));
  STM32_RCC_CFGR_HPRE_SET(x, DIV_1);    /* 64MHZ */
  STM32_RCC_CFGR_PPRE1_SET(x, DIV_2);   /* 32MHZ */
  STM32_RCC_CFGR_PPRE2_SET(x, DIV_1);   /* 64MHz */

  /* use the pll @ 72MHz for the system clock. */
  STM32_RCC_CFGR_SW_SET(x, PLL);
  cpu_mem_write_32(STM32_RCC_ADDR + STM32_RCC_CFGR_ADDR, endian_le32(x));

  /* wait for system clock to be sourced by the pll. */
  do
    {
      x = endian_le32(cpu_mem_read_32(STM32_RCC_ADDR + STM32_RCC_CFGR_ADDR));
    }
  while (!(x & STM32_RCC_CFGR_SWS_PLL));

  /* enable all clock gates. */
  cpu_mem_write_32(STM32_RCC_ADDR + STM32_RCC_AHBENR_ADDR, -1);
  cpu_mem_write_32(STM32_RCC_ADDR + STM32_RCC_APB1ENR_ADDR, -1);
  cpu_mem_write_32(STM32_RCC_ADDR + STM32_RCC_APB2ENR_ADDR, -1);
}

/* GPIO A..E. */
DEV_DECLARE_STATIC(gpio_dev, "gpio", 0, stm32_gpio_drv,
                   DEV_STATIC_RES_DEV_ICU("/cpu"),
                   DEV_STATIC_RES_IRQ(0, STM32_IRQ_EXTI0,     DEV_IRQ_SENSE_HIGH_LEVEL, 0, 0x1),
                   DEV_STATIC_RES_IRQ(1, STM32_IRQ_EXTI1,     DEV_IRQ_SENSE_HIGH_LEVEL, 0, 0x1),
                   DEV_STATIC_RES_IRQ(2, STM32_IRQ_EXTI2,     DEV_IRQ_SENSE_HIGH_LEVEL, 0, 0x1),
                   DEV_STATIC_RES_IRQ(3, STM32_IRQ_EXTI3,     DEV_IRQ_SENSE_HIGH_LEVEL, 0, 0x1),
                   DEV_STATIC_RES_IRQ(4, STM32_IRQ_EXTI4,     DEV_IRQ_SENSE_HIGH_LEVEL, 0, 0x1),
                   DEV_STATIC_RES_IRQ(5, STM32_IRQ_EXTI9_5,   DEV_IRQ_SENSE_HIGH_LEVEL, 0, 0x1),
                   DEV_STATIC_RES_IRQ(6, STM32_IRQ_EXTI15_10, DEV_IRQ_SENSE_HIGH_LEVEL, 0, 0x1)
);

/* USART 2 */
DEV_DECLARE_STATIC(usart2_dev, "uart2", 0, stm32_usart_drv,
    DEV_STATIC_RES_MEM(STM32_USART2_ADDR, STM32_USART2_ADDR + STM32_USART2_SIZE),

    DEV_STATIC_RES_FREQ(32000000, 1),

    DEV_STATIC_RES_DEV_ICU("/cpu"),
    DEV_STATIC_RES_IRQ(0, STM32_IRQ_USART2, DEV_IRQ_SENSE_HIGH_LEVEL, 0, 0x1),

    DEV_STATIC_RES_DEV_PARAM("iomux", "/gpio"),
    DEV_STATIC_RES_IOMUX("tx", 0, /* PA2 */ 0*16+2, 0, 0),
    DEV_STATIC_RES_IOMUX("rx", 0, /* PA3 */ 0*16+3, 0, 0),

    DEV_STATIC_RES_UART(9600, 8, DEV_UART_PARITY_NONE, 1, 0, 0)
);

/* FPGA programming */
DEV_DECLARE_STATIC(spi1_dev, "spi1", 0, stm32_spi_drv,
                   DEV_STATIC_RES_MEM(STM32_SPI1_ADDR, STM32_SPI1_ADDR + STM32_SPI1_SIZE),

                   DEV_STATIC_RES_FREQ(64000000, 1),

                   DEV_STATIC_RES_DEV_ICU("/cpu"),
                   DEV_STATIC_RES_IRQ(0, STM32_IRQ_SPI1, DEV_IRQ_SENSE_RISING_EDGE, 0, 0x1),

                   DEV_STATIC_RES_DEV_IOMUX("/gpio"),
                   DEV_STATIC_RES_IOMUX("clk", 0, 0*16+5 /* PA5 */, 0 /* no remap */, 0),
                   DEV_STATIC_RES_IOMUX("miso", 0, 0*16+6 /* PA6 */, 0 /* no remap */, 0),
                   DEV_STATIC_RES_IOMUX("mosi", 0, 0*16+7 /* PA7 */, 0 /* no remap */, 0)
                   );

/* DAC/FPGA */
DEV_DECLARE_STATIC(spi2_dev, "spi2", 0, stm32_spi_drv,
                   DEV_STATIC_RES_MEM(STM32_SPI2_ADDR, STM32_SPI2_ADDR + STM32_SPI2_SIZE),

                   DEV_STATIC_RES_FREQ(64000000, 1),

                   DEV_STATIC_RES_DEV_ICU("/cpu"),
                   DEV_STATIC_RES_IRQ(0, STM32_IRQ_SPI2, DEV_IRQ_SENSE_RISING_EDGE, 0, 0x1),

                   DEV_STATIC_RES_DEV_IOMUX("/gpio"),
                   DEV_STATIC_RES_IOMUX("clk", 0, 1*16+13 /* PB13 */, 0 /* no remap */, 0),
                   DEV_STATIC_RES_IOMUX("miso", 0, 1*16+14 /* PB14 */, 0 /* no remap */, 0),
                   DEV_STATIC_RES_IOMUX("mosi", 0, 1*16+15 /* PB15 */, 0 /* no remap */, 0)
                   );

DEV_DECLARE_STATIC(timer4_dev, "timer4", 0, stm32_timer_drv,
                   DEV_STATIC_RES_MEM(STM32_TIM4_ADDR, STM32_TIM4_ADDR + STM32_TIM4_SIZE),

                   DEV_STATIC_RES_DEV_ICU("/cpu"),
                   DEV_STATIC_RES_IRQ(0, STM32_IRQ_TIM4, DEV_IRQ_SENSE_HIGH_LEVEL, 0, 0x1),
                   );
