#include <stdio.h>
#include <cuda_runtime.h>

// Compute vector sum h_C = h_A + h_B

__global__ void VectorAddKernel(float* A, float* B, float* C, int n) {
  int i = threadIdx.x + blockDim.x * blockIdx.x;
  if (i < n) {
    C[i] = A[i] + B[i];
  }
}

int main() {
  const int n = 1024;
  const int size = n * sizeof(int);

  // Allocate host memory
  float *h_A, *h_B, *h_C;
  h_A = (float*) malloc(size);
  h_B = (float*) malloc(size);
  h_C = (float*) malloc(size);

  // Initialize host arrays
  for (int i = 0; i < n; ++i) {
    h_A[i] = 1000.0f + i;
    h_B[i] = 2000.0f - i;
  }

  // Allocate device memory
    float *d_A, *d_B, *d_C;
    cudaMalloc((void**)&d_A, size);
    cudaMalloc((void**)&d_B, size);
    cudaMalloc((void**)&d_C, size);

  // Copy data to the device
    cudaMemcpy(d_A, h_A, n * sizeof(float), cudaMemcpyHostToDevice);
    cudaMemcpy(d_B, h_B, n * sizeof(float), cudaMemcpyHostToDevice);

  // Compute on the device
    int blockSize = 256;
    int numBlocks = (n + blockSize - 1) / blockSize;
    VectorAddKernel<<<numBlocks, blockSize>>>(d_A, d_B, d_C, n);
    

  // Copy result back to the host
    cudaMemcpy(h_C, d_C, size, cudaMemcpyDeviceToHost);
    


  // Verify the result
  for (int i = 0; i < n; ++i) {
    if (h_C[i] != 3000.0f) {
      printf("Mismatch at element %d\n", i);
      return 1;
    }
  }

  printf("Success!\n");

  // Free host memory
  free(h_A);
  free(h_B);
  free(h_C);

    // Free device memory
    cudaFree(d_A);
    cudaFree(d_B);
    cudaFree(d_C);
  
  return 0;
}