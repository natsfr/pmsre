
#include <device/device.h>
#include <device/driver.h>
#include <device/shell.h>
#include <device/resources.h>
#include <device/irq.h>
#include <device/class/iomux.h>
#include <device/class/clock.h>
#include <device/class/uart.h>
#include <device/class/spi.h>
#include <device/class/gpio.h>
#include <mutek/console.h>

#include <arch/stm32_irq.h>
#include <arch/stm32_memory_map.h>
#include <hexo/iospace.h>

/* CPU */

DEV_DECLARE_STATIC(cpu_dev, "cpu", DEVICE_FLAG_CPU, arm32m_drv,
                   DEV_STATIC_RES_ID(0, 0),
                   );

#include <hexo/endian.h>
#include <hexo/iospace.h>
#include <arch/stm32f1xx_rcc.h>
#include <mutek/startup.h>

#include "fpga.c"

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

  STM32_RCC_CFGR_MCO_SET(x, HSI);
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

  /* output mco on a8 */
  cpu_mem_write_32(0x40010800 + 0x04, /* io banks */ 0x4444444b);
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

#define DAC_CS_IO        28
#define FPGA_DONE_IO     1
#define FPGA_INITB_IO    4
#define FPGA_PROGB_IO    25

struct device_spi_ctrl_s d_cmd_spi;
struct device_spi_ctrl_s d_fpga_spi;
struct device_gpio_s d_gpio;

static void pmsre_spi_write(struct device_spi_ctrl_s *spi, unsigned int cs_id,
                            const uint8_t *data, size_t size)
{
  struct dev_spi_ctrl_transfer_s tr = {
    .count = size,
    .out = data,
    .out_width = 1,
  };

  ensure(!DEVICE_OP(&d_gpio, set_output, cs_id, cs_id, dev_gpio_mask0, dev_gpio_mask0));
  ensure(!dev_spi_wait_transfer(&d_cmd_spi, &tr));
  ensure(!DEVICE_OP(&d_gpio, set_output, cs_id, cs_id, dev_gpio_mask1, dev_gpio_mask1));
}

void main()
{
  ensure(!device_get_accessor_by_path(&d_fpga_spi, NULL, "spi1", DRIVER_CLASS_SPI_CTRL));
  ensure(!device_get_accessor_by_path(&d_cmd_spi, NULL, "spi2", DRIVER_CLASS_SPI_CTRL));
  ensure(!device_get_accessor_by_path(&d_gpio, NULL, "gpio", DRIVER_CLASS_GPIO));

  ensure(!DEVICE_OP(&d_gpio, set_mode, FPGA_DONE_IO, FPGA_DONE_IO, dev_gpio_mask1, DEV_PIN_OPENDRAIN_PULLUP));
  ensure(!DEVICE_OP(&d_gpio, set_mode, FPGA_INITB_IO, FPGA_INITB_IO, dev_gpio_mask1, DEV_PIN_OPENDRAIN_PULLUP));

  ensure(!DEVICE_OP(&d_gpio, set_mode, FPGA_PROGB_IO, FPGA_PROGB_IO, dev_gpio_mask1, DEV_PIN_PUSHPULL));
  ensure(!DEVICE_OP(&d_gpio, set_output, FPGA_PROGB_IO, FPGA_PROGB_IO, dev_gpio_mask0, dev_gpio_mask0));

  /* drive dac CS */
  ensure(!DEVICE_OP(&d_gpio, set_mode, DAC_CS_IO, DAC_CS_IO, dev_gpio_mask1, DEV_PIN_PUSHPULL));
  ensure(!DEVICE_OP(&d_gpio, set_output, DAC_CS_IO, DAC_CS_IO, dev_gpio_mask1, dev_gpio_mask1));

  struct dev_spi_ctrl_config_s cfg = {
    .ck_mode = DEV_SPI_CK_MODE_0,
    .bit_order = DEV_SPI_MSB_FIRST,
    .miso_pol = cfg.mosi_pol = DEV_SPI_ACTIVE_HIGH,
    .bit_rate = 1000000,
    .word_width = 8,
  };

  ensure(!DEVICE_OP(&d_cmd_spi, config, &cfg));
  ensure(!DEVICE_OP(&d_fpga_spi, config, &cfg));

  /* set dac reference to internal 2.0v */
  pmsre_spi_write(&d_cmd_spi, DAC_CS_IO, (const uint8_t*)"\x76\x0f\x00", 3);

  printk("PMSRE init done\n");

  mutek_shell_start(&console_dev, "xterm");
}

enum shell_pmsre_opts_e
{
  PMSRE_OPT_AXIS = 1,
  PMSRE_OPT_MAMPS = 2,
};

struct termui_optctx_pmsre_opts
{
  uint8_t  axis;
  uint16_t mamps;
};

static TERMUI_CON_COMMAND_PROTOTYPE(shell_pmsre_fpga_load)
{
  uint8_t x;

  /* pulse prog_b low */
  ensure(!DEVICE_OP(&d_gpio, set_output, FPGA_PROGB_IO, FPGA_PROGB_IO, dev_gpio_mask0, dev_gpio_mask0));
  ensure(!DEVICE_OP(&d_gpio, set_output, FPGA_PROGB_IO, FPGA_PROGB_IO, dev_gpio_mask1, dev_gpio_mask1));

  do {
    DEVICE_OP(&d_gpio, get_input, FPGA_INITB_IO, FPGA_INITB_IO, &x);
  } while (!(x & 1));

  printk("INITB ok, writing %u bytes\n", sizeof(fpga_stream));

  struct dev_spi_ctrl_transfer_s tr = {
    .count = sizeof(fpga_stream),
    .out = fpga_stream,
    .out_width = 1,
  };

  ensure(!dev_spi_wait_transfer(&d_fpga_spi, &tr));

  DEVICE_OP(&d_gpio, get_input, FPGA_DONE_IO, FPGA_DONE_IO, &x);
  printk("DONE: %u\n", x & 1);

  return 0;
}

static TERMUI_CON_COMMAND_PROTOTYPE(shell_pmsre_motor)
{
  struct termui_optctx_pmsre_opts *c = ctx;

  if (used & PMSRE_OPT_MAMPS)
    {
      uint8_t id = c->axis > 2 ? 3 : c->axis;
      /*
         drv8825 vref = amps / 2
         max5713 val = vout * 2048
      */
      uint16_t val = c->mamps * 2048 / 1000 / 2;
      uint8_t dac_cmd[3] = { 0x30 | id, val >> 4, val << 4 };
      pmsre_spi_write(&d_cmd_spi, DAC_CS_IO, dac_cmd, 3);
    }

  return 0;
}

static TERMUI_CON_OPT_DECL(pmsre_opts) =
{
  TERMUI_CON_OPT_INTEGER_RANGE_ENTRY("-x", "--axis", PMSRE_OPT_AXIS, struct termui_optctx_pmsre_opts, axis, 1, 0, 5,
                               TERMUI_CON_OPT_CONSTRAINTS(0, 0)
                               )

  TERMUI_CON_OPT_INTEGER_RANGE_ENTRY("-a", "--mA", PMSRE_OPT_MAMPS, struct termui_optctx_pmsre_opts, mamps, 1, 0, 2500,
                               TERMUI_CON_OPT_CONSTRAINTS(0, 0))
};

static TERMUI_CON_GROUP_DECL(shell_pmsre_subgroup) =
{
  TERMUI_CON_ENTRY(shell_pmsre_motor, "motor",
                   TERMUI_CON_OPTS_CTX(pmsre_opts, PMSRE_OPT_AXIS, PMSRE_OPT_MAMPS, NULL)
                   )

  TERMUI_CON_ENTRY(shell_pmsre_fpga_load, "fpga_load",
                   )
};

MUTEK_SHELL_ROOT_GROUP(shell_pmsre_subgroup, "pmsre")

