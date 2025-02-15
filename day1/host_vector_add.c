#include <stdio.h>
#include <stdlib.h>

// Compute vector sum h_C = h_A + h_B

void VectorAdd(const float *h_A, const float *h_B, float *h_C, int n) {
  for (int i = 0; i < n; ++i) {
    h_C[i] = h_A[i] + h_B[i];
  }
}

int main() {
  const int n = 1 << 20;  // 1M elements

  // Allocate host memory
  float *h_A, *h_B, *h_C;
  h_A = (float*) malloc(n * sizeof(float));
  h_B = (float*) malloc(n * sizeof(float));
  h_C = (float*) malloc(n * sizeof(float));

  // Initialize host arrays
  for (int i = 0; i < n; ++i) {
    h_A[i] = 1000.0f + i;
    h_B[i] = 2000.0f - i;
  }

  // Compute on the host
  VectorAdd(h_A, h_B, h_C, n);

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
  
  return 0;
}