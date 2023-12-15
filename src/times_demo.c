#include "function.h"
#include <stdio.h>
#include <sys/times.h>
#include <unistd.h>

int main() {
    struct tms start, end;
    long ticks;
    clock_t clockTime;

    ticks = sysconf(_SC_CLK_TCK);
    times(&start);
    functionToMeasure();
    times(&end);

    clockTime = end.tms_utime - start.tms_utime;
    printf("Time taken: %f seconds\n", (double)clockTime / ticks);

    return 0;
}
