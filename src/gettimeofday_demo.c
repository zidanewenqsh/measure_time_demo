#include "function.h"
#include <stdio.h>
#include <sys/time.h>

void functionToMeasure();

int main() {
    struct timeval start, end;
    gettimeofday(&start, NULL);
    functionToMeasure();
    gettimeofday(&end, NULL);

    long seconds = (end.tv_sec - start.tv_sec);
    long micros = ((seconds * 1000000) + end.tv_usec) - (start.tv_usec);

    printf("Elapsed time: %ld seconds and %ld microseconds\n", seconds, micros);

    return 0;
}