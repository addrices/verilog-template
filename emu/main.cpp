#include "emu.h"
#include <memory>
#include <iostream>
#include <verilated.h>

int main(int argc, char **argv)
{
  auto dut = std::make_shared<emu>();
  dut->a = 3;
  dut->b = 4;
  dut->eval();
  dut->clk = 1;
  dut->eval();
  dut->clk = 0;
  dut->eval();
  printf("c = %d\n", dut->c);
  return 0;
}