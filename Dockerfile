# Use scipy notebook as base
FROM jupyter/scipy-notebook:notebook-6.4.2

# As root
USER root

# Install compiler
RUN apt-get update -y && apt-get install -y build-essential

# As user
USER ${NB_UID}

# Setup environment
RUN pip install cmdstanpy==0.9.76 jupyterthemes==0.20.0 arviz==0.11.2

# Install cmdstan
RUN install_cmdstan

# Set decent notebook theme
RUN jt -t grade3 -T -N -kl

# Clear entrypoint
ENTRYPOINT []

# Copy over notebooks
COPY src/notebooks/*.ipynb work/
COPY src/notebooks/figures work/figures
COPY src/notebooks/stan work/stan
COPY src/notebooks/data work/data

# Set permissions
USER root
RUN chmod -R 777 work/
RUN chown -R ${NB_UID}:${NB_GID} work/
USER ${NB_UID}

# run from the home directory
WORKDIR "${HOME}"
