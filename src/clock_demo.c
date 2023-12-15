#include "function.h"

#include <stdio.h>
#include <time.h>

void functionToMeasure();

int main() {
    clock_t start = clock();
    functionToMeasure();
    clock_t end = clock();

    double elapsed = (double)(end - start) / CLOCKS_PER_SEC;
    printf("Elapsed time: %.4f seconds\n", elapsed);

    return 0;
}