---
layout: page
title: "Contents & Packages"
permalink: /contents/
nav_order: 2
---

# Repository Contents

The replication package is organized as follows (paths are relative to the repository root):

- `applications/` – Empirical applications.  
  Contains the data files (`empirical_*.csv`), the main R routine (`LP_panel_all.r`), and the Jupyter notebook `replication.ipynb` which reproduces the empirical results and figures in the paper (running time: ≲ 30 seconds).

- `simulations/` – Monte Carlo simulations for the main text (Figures 1–3).  
  See `simulations/README.md` for details about scripts and figures.

- `simulations_appendix/` – Simulation code for Appendix C (Figures C1–C12).  
  See `simulations_appendix/readme.md` for the workflow and instructions.

In short:

- Empirical results → `applications/`
- Main-text simulations → `simulations/`
- Appendix simulations → `simulations_appendix/`

