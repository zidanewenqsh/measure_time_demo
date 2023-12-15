#include "function.h"
#include <iostream>
#include <chrono>

int main() {
    auto start = std::chrono::steady_clock::now();
    functionToMeasure();
    auto end = std::chrono::steady_clock::now();

    std::chrono::duration<double> elapsed = end - start;
    std::cout << "Elapsed time: " << elapsed.count() << " seconds" << std::endl;

    return 0;
}
