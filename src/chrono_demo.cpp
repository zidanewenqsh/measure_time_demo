#include <iostream>
#include <chrono>
#include "function.h"
int main() {
    auto start = std::chrono::high_resolution_clock::now();
    functionToMeasure();
    auto end = std::chrono::high_resolution_clock::now();

    std::chrono::duration<double> elapsed = end - start;
    std::cout << "Elapsed time: " << elapsed.count() << " seconds" << std::endl;

    return 0;
}
