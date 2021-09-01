Bayesian workflow
=================

Welcome to the Bayesian workflow course. Here, you can browse and search the course notebooks.

This course is part of the ORIGINS Data Science Laboratory's Block courses. Please see the `main course page <https://indico.ph.tum.de/event/6875/>`_ for more information.

Installation
------------

To run the course notebooks, you have a few different options. I recommend to follow the standard install, and use docker or binder if there are problems. 

* **Plan A: Standard install:** Fork/clone/download material from this `GitHub repository <https://github.com/cescalara/BayesianWorkflow>`_, everything you need is in ``src/notebooks``

  * I recommend using a `virtual environment <https://docs.python.org/3/tutorial/venv.html>`_ if possible
  * Install the basics if necessary: ``pip install numpy scipy matplotlib``
  * Install: ``pip install cython==0.29.24 cmdstanpy==0.9.76 arviz==0.11.2 ultranest==3.3.0``
  * Run ``install_cmdstan`` (as described in the `cmdstanpy docs <https://cmdstanpy.readthedocs.io/en/v0.9.76/installation.html>`_)
  * If using a virtual environment, set up an ipython kernel with this environment (as described `here <https://ipython.readthedocs.io/en/stable/install/kernel_install.html>`_)
  * Open a notebook using jupyter, select correct kernel and get running

* **Plan B: Docker:** Fork/clone/download material from this `GitHub repository <https://github.com/cescalara/BayesianWorkflow>`_, everything you need is in ``src/notebooks``

  * Install `docker <https://www.docker.com>`_ on your computer
  * Get a ready made docker enironment: ``docker pull cescalara/bayesian_workflow``
  * Run ``docker run -p 8888:8888 -v "${PWD}":/home/jovyan/work cescalara/bayesian_workflow jupyter-notebook``
  * Open the given url ``http://127.0.0.1:8888/lab?token=....`` in your browser
  * The current directory will be mounted to the docker and the jupyter server has the environment needed to run the notebooks
    
* **Plan C: Binder:** Click `here <https://mybinder.org/v2/gh/cescalara/BayesianWorkflow/HEAD>`_ to launch a working environment via binder, all notebooks are in ``work/``

  * The binder may take a while to load, this is normal
  * Using binder you will automatically time out of sessions if you are inactive, so save your work frequently
  * The changes that you make are *not persistent* - if you close and repoen a tab your changes will be lost
  * To work continuously, download and upload your changes between sessions
    
Acknowledgements
----------------

I would like to highlight the `many resources <https://betanalpha.github.io/writing/>`_ of Michael Betancourt and the `KIPAC Statistical Methods course <https://kipac.github.io/StatisticalMethods/>`_ as providing inspiration for the course structure and content.


.. toctree::
   :maxdepth: 1
   :caption: Contents:

   notebooks/introduction.ipynb
   notebooks/model_building.ipynb
   notebooks/model_checking.ipynb
   notebooks/model_development.ipynb
   notebooks/model_comparison_part1.ipynb
   notebooks/model_comparison_part2.ipynb
   notebooks/experiment_design.ipynb
   notebooks/homework_project.ipynb
