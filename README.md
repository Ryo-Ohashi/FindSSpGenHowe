This repository provides the **Magma** implementation of the algorithm proposed in the following paper:

> [Superspecial generalized Howe curves of genus 4, 5, and 6 with completely decomposable Jacobians](https://arxiv.org/abs/2604.18074) by Ryo Ohashi

## Usage

You can run the main scripts by specifying the parameters `p1` and `p2` in Magma. The script processes all prime numbers $p$ in the range $p_1 < p \le p_2$. 
The output format varies depending on the genus $g$:

| Genus | Output | Reference |
| :--- | :--- | :--- |
| **$g=4$** | Parameters $(s,t)$ for superspecial curve $X_{s,t}$ | Section 3 |
| **$g=5$** | Parameters $(s^2,t^2)$ for superspecial curve $Y_{s,t}$ | Section 4 |
| **$g=6$** | Parameters $(s^3,t^3)$ for superspecial curve $Z_{s,t}$ | Section 5 |

### Example
To output $(s,t)$ such that $X_{s,t}$ is superspecial for all primes $p$ with $7 < p \le 20000$, use the following command:

```bash
magma p1:=7 p2:=20000 FindSSpGenHowe/g=4/main.m
