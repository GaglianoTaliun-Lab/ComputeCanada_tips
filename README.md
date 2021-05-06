# ComputeCanada_tips

### Sharing files via Globus
1) Login to Globus and navigate to the folder/files you want to shared in https://app.globus.org/file-manager
2) Select the folder/files you want to share and on the right side click "Share". 
3) Use add guest collection on the right hand side to give a user read permission.


### Remote Development Tips and Tricks
log into remote machine using SSH keys(without input password everytime)

references: https://code.visualstudio.com/docs/remote/troubleshooting#_improving-your-security-with-a-dedicated-key


### Steps to establish JupyterNotebook environment
References: https://docs.computecanada.ca/wiki/JupyterNotebook#Introduction

1. log into remote machine using ssh: ssh qiangye@beluga.computecanada.ca
2. load python module and activete python environment
   module load python/3.7.9
3. create your virtual environment for Python
   python -m venv venv
4. activate your virtual environment
   source venv/bin/activate
5. install jupyter notebook and related extensions
   pip install jupyter
6. Create a wrapper script that launches jupyter notebook
   (jupyter_py3)_[name@server ~]$ echo -e '#!/bin/bash\nunset XDG_RUNTIME_DIR\njupyter notebook --ip $(hostname -f) --no-browser' > $VIRTUAL_ENV/bin/notebook.sh
7. make the script executable:
   (jupyter_py3)_[name@server ~]$ chmod u+x $VIRTUAL_ENV/bin/notebook.sh
8. starting jupyter notebook:
   salloc --time=3:0:0 --ntasks=1 --cpus-per-task=4 --mem-per-cpu=10240M --account=def-gsarah srun $VIRTUAL_ENV/bin/notebook.sh
9. open another terminal, activate sshuttle:
   sshuttle --dns -Nr qiangye@beluga.computecanada.ca
10.once jupyter notebook job has started, copy the web link to browser, all done.

### Using Visual Studio Code by SSH remote connection
references: https://code.visualstudio.com/docs/remote/ssh


### install python, jupyter notebook extension support for visual studio code.
Usually, Visual Studio Code will guide you to complete installing these extensions.
