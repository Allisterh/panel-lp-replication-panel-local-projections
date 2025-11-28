---
layout: default
title: "Docker & Strong Replication"
permalink: /docker/
nav_order: 3
---

# Docker Environment for Strong Replication

To ensure a fully reproducible environment, the replication package ships with a Docker workflow that bundles the full R stack, required packages, and JupyterLab.

> **Recommended**: Use Docker whenever you need a clean-room replication or plan to run the notebook on a new machine.
{: .tip }

## Prebuilt Image

- **Registry**: [`ztshi/plp`](https://hub.docker.com/repository/docker/ztshi/plp)
- Ready for local machines or GitHub Codespaces (install the suggested Jupyter kernel extension when prompted).

## Build Locally

```bash
docker build -t plp .
```

## Run the Container

```bash
docker run --rm -it -p 8888:8888 \
  -e JUPYTER_TOKEN=panel-lp \
  -v ${PWD}:/home/jovyan/work \
  plp
```

1. Wait for the console to print the JupyterLab URL (token or `panel-lp`).
2. Open the URL in a browser.
3. Launch `applications/replication.ipynb`.

All required R libraries (`ggplot2`, `reshape2`, `ggpubr`, etc.) are baked into the image, so the notebook runs without additional setup.

## Troubleshooting

- **Port already in use**: change `-p 8888:8888` to another host port (e.g., `-p 8787:8888`).
- **Permission issues on Windows**: ensure Docker Desktop has file-sharing enabled for the repository directory.
- **Need persistent tokens**: adjust `JUPYTER_TOKEN` or omit the flag to have Jupyter generate a random token each run.
