# BayesianWorkflow

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/cescalara/BayesianWorkflow/HEAD)

Under construction for [this course](https://indico.ph.tum.de/event/6875/).

## Website

https://francescacapel.com/BayesianWorkflow/

## Install

To run the course notebooks, you have a few different options

1. Click the above binder button to launch a working environment, all notebooks are in `work`
2. Use the Dockerfile provided to set up a docker environment
3. Simply fork/clone/download the material from this repo (everything you need is in `src/notebooks`) and install the required packages:
    - `pip install numpy scipy matplotlib cmdstanpy==0.9.76 arviz==0.11.2`
    - Run `install_cmdstan` as described in the [cmdstanpy docs](https://cmdstanpy.readthedocs.io/en/v0.9.77/installation.html).
