# Verilog-template

simple verilog template,can easy test by verilator
Verilator 4.038

## 使用方法

将.v 文件放置到 src 目录下，测试的 C 代码放置到 main.cpp 中，将 Makefile 中 line 8 的 EMU_TOP_MODULE 改为顶层文件。运行`make run-emu`进行测试。

## 添加了Verilator的波形生成
在Verilator 命令中添加```--trace```

### 对模块进行测试
定义全局C函数```sc_time_stamp```来获取当前时间。

在eval函数调用的时候，会调用sc_time_stamp函数来获取当前时间，所以在测试过程中需要维护时间。

注意Verilator不支持delay 语句 ```#5```这种。
