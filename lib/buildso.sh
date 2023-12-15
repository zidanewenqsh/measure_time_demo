#!/bin/bash

# 编译目标代码
gcc -c -Wall -Werror -fpic function.c

# 创建动态链接库
gcc -shared -o libfunction.so -lm function.o