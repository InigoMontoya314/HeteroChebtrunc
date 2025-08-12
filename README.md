# Efficient Function Approximation Under Heteroskedastic Noise — MATLAB Code

This repository contains MATLAB code accompanying the paper:

> **Yuji Nakatsukasa and Yifu Zhang**, “Efficient Function Approximation Under Heteroskedastic Noise”.

The code implements core routines for heteroskedastic-noise–aware approximation and model selection.

---

## Requirements

- **MATLAB** R20xxa or later (tested versions noted below)
- **[Chebfun](https://www.chebfun.org/)** (latest stable release)

### Installing Chebfun
- Via MATLAB Add-On: *Home → Add-Ons → Get Add-Ons*, search “Chebfun”.
- Or from source:
  1. Download/clone Chebfun.
  2. In MATLAB, add it to your path (persistently):
     ```matlab
     addpath(genpath('/path/to/chebfun'));
     savepath;
     ```

---

## Repository contents

- `MallowsCp.m` – Mallows’ \(C_p\) model selection.
- `Algorithm2.m` – Reference implementation of **Algorithm 2** from the paper.
- `HeteroChebtrunc.m` – Reference implementation of **Algorithm 3** (known as HeteroChebtrunc) from the paper.
