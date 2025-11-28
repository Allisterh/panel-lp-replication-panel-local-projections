---
layout: default
title: "Contents"
permalink: /contents/
nav_order: 2
---

# Repository Contents

The replication package is organized as follows (paths are relative to the repository root):

## `applications/`

- Empirical applications, including `empirical_*.csv` data files.
- Main R routine: `LP_panel_all.r`.
- `replication.ipynb` Jupyter notebook reproducing every empirical result and figure in <=30 seconds.

## `simulations/`

- Monte Carlo experiments for the main text (Figures 1-3).
- See `simulations/README.md` for script-by-script details and plotting instructions.

## `simulations_appendix/`

- Simulation workflow for Appendix C (Figures C1-C12).
- Read `simulations_appendix/readme.md` for the job orchestration and figure construction steps.

### Summary

- Empirical results -> `applications/`
- Main-text simulations -> `simulations/`
- Appendix simulations -> `simulations_appendix/`
