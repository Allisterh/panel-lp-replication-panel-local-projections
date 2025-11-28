---
layout: page
title: "Docker & Strong Replication"
permalink: /docker/
nav_order: 3
---

# Docker Environment for Strong Replication

To ensure a fully reproducible environment, we provide a Docker-based setup that contains all required R dependencies and tools.

## DockerHub Image

An R environment is available on DockerHub:

- Image: [`ztshi/plp`](https://hub.docker.com/repository/docker/ztshi/plp)

This image can be used locally or in cloud environments such as GitHub Codespaces. In Codespaces, install a Jupyter Kernel extension if prompted.

## Local Reproducible Environment

From the repository root, build the Docker image:

```bash
docker build -t plp .
```

Launch the container, exposing JupyterLab on port `8888` and mounting the repository so that your changes persist:

```bash
docker run --rm -it -p 8888:8888 \
  -e JUPYTER_TOKEN=panel-lp \
  -v ${PWD}:/home/jovyan/work \
  plp
```

The container prints a URL containing the token (or the `JUPYTER_TOKEN` you supplied). Open that URL in a browser to access JupyterLab.

Once JupyterLab is running, open:

- `applications/replication.ipynb`

All required R packages (such as `ggplot2`, `reshape2`, and `ggpubr`) are pre-installed in the image. Executing the notebook reproduces the empirical results and figures reported in the paper, providing a strong replication environment.

