# CUDA 100 days Learning Journey

This document serves as a log of the progress and knowledge I gained while working on CUDA programming and studying the **PMPP (Parallel Programming and Optimization)** book.

Mentor: https://github.com/hkproj/

---

## Day 1
### File: `vectadd.cu`
**Summary:**  
Implementing vector addition by writing a simple CUDA program. Explored how to launch a kernel to perform a parallelized addition of two arrays, where each thread computes the sum of a pair of values.  

**Learned:**  
- Basics of writing a CUDA kernel.
- Understanding of grid, block, and thread hierarchy in CUDA.  
- How to allocate and manage device (GPU) memory using `cudaMalloc`, `cudaMemcpy`, and `cudaFree`.  

### Reading:  
- Read **Chapter 1,2,3** of the PMPP book.

---
