# Info
Resolutions to small issues in Python & Python related configurations.

## 1. `torch` not installing in `python:3.10-alpine` Docker Image
### ERROR: No matching distribution found for torch
#### Reason
On a `python:3.10-alpine` Docker image, it fails because:
- The default PyPI torch wheels are precompiled for glibc-based Linux distributions (like Ubuntu, Debian, CentOS), not Alpine, which uses musl libc.
- Alpine Linux is lightweight and uses musl instead of glibc. Most official PyTorch wheels are not compatible with musl.
- Compiling PyTorch from source on Alpine is very difficult and slow, because it requires a huge number of build dependencies (CMake, Ninja, BLAS, CUDA libraries, etc.).

#### Solution:
- Run command:
```bash
pip install torch --index-url https://download.pytorch.org/whl/cpu
```
- In `requirements.txt`:
```txt
--extra-index-url https://download.pytorch.org/whl/cpu
# https://download.pytorch.org/whl/cu<CUDA_VERSION>
# for cuda version
torch==2.2.0
```

---

## 2. 
