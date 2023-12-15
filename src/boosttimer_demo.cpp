#include "function.h"
#include <iostream>
#include <boost/timer/timer.hpp>

int main() {
    boost::timer::cpu_timer timer;
    functionToMeasure();
    timer.stop();

    std::cout << "Elapsed time: " << timer.format() << std::endl;

    return 0;
}
