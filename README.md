# 计时函数比较工程

这个工程旨在比较和分析不同的计时函数在各种环境下的性能和特性。包括标准库函数、Boost、OpenCV、CUDA 和 TensorRT 相关的计时方法。

## 构建指南

本项目使用 CMake 进行构建, Makefile仅作参考。要构建项目，请遵循以下步骤：

### 先决条件

确保您的系统上安装了以下依赖：

- CMake 3.12 或更高版本
- C++ 编译器（支持 C++14）
- CUDA Toolkit
- TensorRT
- Boost（包含 timer 组件）
- OpenCV

### 构建步骤

1. 克隆仓库到本地：

   ```bash
   git clone https://github.com/zidanewenqsh/measure_time_demo.git
   cd measure_time_demo
   ```

1. 创建并进入构建目录：

```bash
mkdir build
cd build
```
1. 运行 CMake 生成构建文件：

```bash
cmake ..
```
1. 编译项目：

```bash
make
```
构建完成后，所有的可执行文件将位于 bin 目录下。

### 运行指南
要运行任何特定的计时函数演示，您可以从 bin 目录中执行相应的可执行文件。例如：

```bash
./bin/boosttimer_demo
```
### 重点说明
**time()函数不是用于精确计时**

# 项目结构
bin/ - 存放构建生成的可执行文件
build/ - 存放 CMake 构建文件（临时生成）
src/ - 源代码文件
- boosttimer_demo.cpp
- clock_demo.c
- gettimeofday_demo.c
- opencv_demo.cpp
- systemclock_demo.cpp
- chrono_demo.cpp
- cuda_demo.cu
- time_demo.c
- times_demo.c
- steadyclock_demo.cpp
include/ - 头文件
lib/ - 库文件
- function.c
- libfunction.so
obj/ - 存放编译生成的中间对象文件
docs/ - 文档
test/ - 测试文件
LICENSE - 许可证文件
README.md - 项目说明文件

# 许可证
请参阅项目根目录下的 LICENSE 文件了解许可证信息。