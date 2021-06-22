# ComputeCanada_tips

### Sharing files via Globus
1) Login to Globus (via your Compute Canada login) and navigate to the folder/files you want to shared in https://app.globus.org/file-manager
2) Select the folder/files you want to share and on the right side click "Share". 
3) Use add guest collection on the right hand side to give a user read permission.


### Remote Development Tips and Tricks
Log into remote machine using SSH keys(without inputting password everytime)

References: https://code.visualstudio.com/docs/remote/troubleshooting#_improving-your-security-with-a-dedicated-key


### Steps to establish JupyterNotebook environment
References: https://docs.computecanada.ca/wiki/JupyterNotebook#Introduction

- Log into remote machine using ssh in a cluster with your username: $ ssh [username]@[cluster].computecanada.ca

- Load python module and activate python environment: $ module load python/3.7.9

- Create your virtual environment for Python: $ python -m venv venv

- Activate your virtual environment: $ source venv/bin/activate

- Install jupyter notebook and related extensions: $ pip install jupyter

- Create a wrapper script that launches jupyter notebook: $ echo -e '#!/bin/bash\nunset XDG_RUNTIME_DIR\njupyter notebook --ip $(hostname -f) --no-browser' > $VIRTUAL_ENV/bin/notebook.sh

- Make the script executable: (jupyter_py3)_[name@server ~]$ chmod u+x $VIRTUAL_ENV/bin/notebook.sh

- Starting jupyter notebook: $ salloc --time=3:0:0 --ntasks=1 --cpus-per-task=4 --mem-per-cpu=10240M --account=def-<PI_username> srun $VIRTUAL_ENV/bin/notebook.sh

  You may change the values of --account, --time, --mem-per-cpus.

- open another terminal, activate sshuttle: $ sshuttle --dns -Nr [usename]@[cluster].computecanada.ca
  
  You may change the username and cluster.

- Once jupyter notebook job has started, copy the web link to browser, all done.

### Using Visual Studio Code by SSH remote connection
References: https://code.visualstudio.com/docs/remote/ssh


### Install python, jupyter notebook extension support for visual studio code.
Usually, Visual Studio Code will guide you to complete installing these extensions.

### Installing packages in R from GitHub (install_github) if behind proxy/firewall
library("httr")
set_config(use_proxy("github.com", port = 443, username = "compute-canada-username", password="compute-canada-password"))
library("devtools")
devtools::install_github("PheWAS/PheWAS") #or insert whichever package you want to install
