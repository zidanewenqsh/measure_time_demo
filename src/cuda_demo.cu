// #include <cuda_runtime.h>
// #include <iostream>
// #include <cmath>

// __global__ void kernelToMeasure(double *sum, int size) {
//     int index = threadIdx.x + blockIdx.x * blockDim.x;
//     int stride = blockDim.x * gridDim.x;

//     for (int i = index; i < size; i += stride) {
//         sum[i] = __sinf(i) * __cosf(i);
//     }
// }

// int main() {
//     const int size = 1000000;
//     double *sum;
//     double *d_sum;

//     // 分配主机内存
//     sum = (double*)malloc(size * sizeof(double));

//     // 分配设备内存
//     cudaMalloc(&d_sum, size * sizeof(double));

//     // 定义线程块大小和网格大小
//     int blockSize = 256;
//     int numBlocks = (size + blockSize - 1) / blockSize;

//     // 创建 CUDA 事件
//     cudaEvent_t start, stop;
//     cudaEventCreate(&start);
//     cudaEventCreate(&stop);

//     // 记录开始时间
//     cudaEventRecord(start);

//     // 调用核函数
//     kernelToMeasure<<<numBlocks, blockSize>>>(d_sum, size);

//     // 记录结束时间
//     cudaEventRecord(stop);

//     // 等待事件完成
//     cudaEventSynchronize(stop);

//     // 计算运行时间
//     float milliseconds = 0;
//     cudaEventElapsedTime(&milliseconds, start, stop);

//     // 将结果从设备内存复制回主机内存
//     cudaMemcpy(sum, d_sum, size * sizeof(double), cudaMemcpyDeviceToHost);

//     // 处理结果（例如，计算总和）
//     double totalSum = 0.0;
//     for (int i = 0; i < size; ++i) {
//         totalSum += sum[i];
//     }
//     std::cout << "Total Sum: " << totalSum << std::endl;
//     std::cout << "Elapsed Time: " << milliseconds << " ms" << std::endl;

//     // 释放 CUDA 事件
//     cudaEventDestroy(start);
//     cudaEventDestroy(stop);

//     // 释放内存
//     free(sum);
//     cudaFree(d_sum);

//     return 0;
// }



#include <cuda_runtime.h>
#include <iostream>
#include <cmath>

__global__ void kernelToMeasure(float *sum, int size) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    for (int i = index; i < size; i += stride) {
        sum[i] = __sinf(i) * __cosf(i);
    }
}

int main() {
    const int size = 1000000;
    float *sum;
    float *d_sum;

    // 分配主机内存
    sum = (float*)malloc(size * sizeof(float));
    memset(sum, 0, size * sizeof(float)); // 初始化内存

    // 分配设备内存
    cudaMalloc(&d_sum, size * sizeof(float));

    // 定义线程块大小和网格大小
    int blockSize = 256;
    int numBlocks = (size + blockSize - 1) / blockSize;

    // 创建 CUDA 事件
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);

    // 记录开始时间
    cudaEventRecord(start);

    // 调用核函数
    kernelToMeasure<<<numBlocks, blockSize>>>(d_sum, size);

    // 记录结束时间
    cudaEventRecord(stop);

    // 等待事件完成
    cudaEventSynchronize(stop);

    // 计算运行时间
    float milliseconds = 0;
    cudaEventElapsedTime(&milliseconds, start, stop);

    // 将结果从设备内存复制回主机内存
    cudaMemcpy(sum, d_sum, size * sizeof(float), cudaMemcpyDeviceToHost);

    // 处理结果（例如，计算总和）
    float totalSum = 0.0;
    for (int i = 0; i < size; ++i) {
        totalSum += sum[i];
    }
    std::cout << "Total Sum: " << totalSum << std::endl;
    std::cout << "Elapsed Time: " << milliseconds << " ms" << std::endl;

    // 释放 CUDA 事件
    cudaEventDestroy(start);
    cudaEventDestroy(stop);

    // 释放内存
    free(sum);
    cudaFree(d_sum);

    return 0;
}
