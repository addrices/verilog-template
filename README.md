# Verilog-template

simple verilog template,can easy test by verilator

## 使用方法

将.v 文件放置到 src 目录下，测试的 C 代码放置到 main.cpp 中，将 Makefile 中 line 8 的 EMU_TOP_MODULE 改为顶层文件。运行`make run-emu`进行测试。
