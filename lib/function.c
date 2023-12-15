/*
 * @file function
 * @date 2023-12-15
 * @time 10:40:35
 * @author wenquanshan
 * @license MIT
 * @description xxx
 */

// #include "function.h"
// function functions
#include <math.h>

void functionToMeasure() {
    const int size = 1000000;
    double sum = 0.0;
    for (int i = 1; i <= size; ++i) {
        sum += sin(i) * cos(i);
    }
}
