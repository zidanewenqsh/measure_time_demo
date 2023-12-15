#include "function.h"
#include <stdio.h>
#include <time.h>
/*
    * time_t time(time_t *tloc);
    * time() 函数通常用于获取当前的日历时间（即自协调世界时（UTC）1970年1月1日以来的秒数），而不是用于精确计时。它定义在 <ctime> 头文件中。如果您想用 time() 函数来计时，通常是测量两个事件之间的秒数差异。但请注意，time() 函数的精度仅限于秒级，不适合用于需要更高精度的计时。
    * 
*/
int main() {
    time_t start_time = time(NULL);
    functionToMeasure();
    time_t end_time = time(NULL);

    time_t elapsed = end_time - start_time;
    printf("Elapsed time: %ld seconds\n", elapsed);

    return 0;
}