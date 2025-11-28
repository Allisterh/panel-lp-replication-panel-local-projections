---
layout: home
title: "Home"
nav_order: 1
---

# Panel Local Projection Replication

This site documents the replication package for

> Ziwei Mei, Liugang Sheng, Zhentao Shi (2025),  
> **"Nickell Bias in Panel Local Projection: Financial Crises Are Worse Than You Think,"**  
> *Journal of International Economics*.  
> [[arxiv:2302.13455](https://arxiv.org/abs/2302.13455)]

The repository provides:

- Empirical applications used in the paper.
- Monte Carlo simulations for main-text figures.
- Additional simulation material for the appendix.


# External Packages

The estimation method is implemented in the following external packages:

- **R package**: [`panel-local-projection`](https://github.com/zhentaoshi/panel-local-projection)  
  Provides functions to implement the panel local projection estimator used in the paper.

- **Stata package** (under construction): [`panel-local-projection-stata`](https://github.com/shenshuuu/panel-local-projection-stata)

These packages are not required to run the self-contained replication notebook in this repository, but they are useful for applying the method to other data sets.

# Navigation

Use the navigation bar to explore:

- [`Contents`]({{ "/contents" | relative_url }}) for an overview of folders and assets therein.
- [`Docker`]({{ "/docker" | relative_url }}) for instructions on running the code in a fully reproducible environment.

