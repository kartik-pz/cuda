# GPU 100 days Learning Journey

This document serves as a log of the progress and knowledge I gained while working on GPU programming and studying the **PMPP (Parallel Programming and Optimization)** book alongside Stanford CS149. 

---

## Day 1
### File: `vectadd.cu`
**Summary:**  
Implemented vector addition by writing a simple CUDA program. Explored how to launch a kernel to perform a parallelized addition of two arrays, where each thread computes the sum of a pair of values.  

**Learned:**  
- Basics of writing a CUDA kernel.
- Understanding of grid, block, and thread hierarchy in CUDA.  
- How to allocate and manage device (GPU) memory using `cudaMalloc`, `cudaMemcpy`, and `cudaFree`.  

### Reading:  
- Read **Chapter 1** of the PMPP book.  
  - Learned about the fundamentals of parallel programming, CUDA architecture, and the GPU execution model.
