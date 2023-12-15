/*
 * @file main.c
 * @date 2023-12-15
 * @time 10:40:35
 * @author wenquanshan
 * @license MIT
 * @description xxx
 */

#include "stdio.h"
#include "function.h"
int main() {
    functionToMeasure();
    printf("hello world!\n");
    for (int i = 0; i < 10; i++) {
        printf("i = %d\n", i);
    }
    return 0;
}
