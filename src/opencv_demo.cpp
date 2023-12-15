#include "function.h"
#include <opencv2/opencv.hpp>

int main() {
    double start = static_cast<double>(cv::getTickCount());
    functionToMeasure();
    double end = static_cast<double>(cv::getTickCount());

    double elapsed = (end - start) / cv::getTickFrequency();
    std::cout << "Elapsed time: " << elapsed << " seconds" << std::endl;

    return 0;
}
