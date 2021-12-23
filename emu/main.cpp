#include "emu.h"
#include <memory>
#include <iostream>
#include <verilated.h>

vluint64_t main_time = 0; // Current simulation time

double sc_time_stamp()
{                   // Called by $time in Verilog
  return main_time; // converts to double, to match
                    // what SystemC does
}

int main(int argc, char **argv)
{
  Verilated::commandArgs(argc, argv);
  // Open trace record
  Verilated::traceEverOn(true);
  // Create logs/ directory in case we have traces to put under it
  Verilated::mkdir("logs");
  auto dut = std::make_shared<emu>();

    dut->clk = 0;
    dut->a = 3;
    dut->b = 4;
    dut->eval();
    main_time++;

    dut->clk = 1;
    dut->eval();
    main_time++;

    dut->clk = 0;
    dut->eval();
    dut->a = 4;
    dut->b = 5;
    main_time++;

    dut->clk = 1;
    dut->eval();
    main_time++;

    dut->clk = 0;
    dut->a = 6;
    dut->b = 7;
    dut->eval();
    main_time++;

    dut->clk = 1;
    dut->eval();
    main_time++;

    dut->clk = 0;
    dut->eval();
    main_time++;
    dut->final();
    printf("c = %d\n", dut->c);
    return 0;
  }