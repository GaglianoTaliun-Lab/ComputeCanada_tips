# ComputeCanada_tips

### Clusters
We have access to 4 clusters: beluga, graham, cedar, narval (login via $ ssh [username]@[cluster].computecanada.ca)

### Running scripts
1) Do *not* run jobs on the login node. Always use sbatch https://docs.computecanada.ca/wiki/Running_jobs#Use_sbatch_to_submit_jobs or salloc (interactive job)! https://docs.computecanada.ca/wiki/Running_jobs#Interactive_jobs

### Sharing files via Globus
1) Login to Globus (via your Compute Canada login) and navigate to the folder/files you want to shared in https://app.globus.org/file-manager
2) Select the folder/files you want to share and on the right side click "Share". 
3) Use add guest collection on the right hand side to give a user read permission.

### Sharing files via ACL (permissions)
cd -P /home/gsarah/projects/def-gsarah

setfacl -m u:username-with-whom-to-share:--x .

setfacl -m u:username-with-whom-to-share:rx directory_to_share

cd -P /home/gsarah/projects/def-gsarah/directory_to_share

find . -type f -print0 | xargs -0 setfacl -m u:username-with-whom-to-share:r

### Remote Development Tips and Tricks
1) Log into remote machine using SSH keys(without inputting password every time)  References: https://code.visualstudio.com/docs/remote/troubleshooting#_improving-your-security-with-a-dedicated-key


### Steps to establish JupyterNotebook environment(references: https://docs.computecanada.ca/wiki/JupyterNotebook#Introduction)

1) Log into remote machine using ssh in a cluster with your username: $ ssh [username]@[cluster].computecanada.ca

2) Load python module and activate python environment: $ module load python/3.7.9

3) Create your virtual environment for Python: $ python -m venv venv

4) Activate your virtual environment: $ source venv/bin/activate

5) Install jupyter notebook and related extensions: $ pip install jupyter

6) Create a wrapper script that launches jupyter notebook: 
   $ VIRTUAL_ENV=venv
   $ echo -e '#!/bin/bash\nunset XDG_RUNTIME_DIR\njupyter notebook --ip $(hostname -f) --no-browser' > venv/bin/notebook.sh

7) Make the script executable: (jupyter_py3)_[name@server ~]$ chmod u+x $VIRTUAL_ENV/bin/notebook.sh

8) Starting jupyter notebook: $ salloc --time=3:0:0 --ntasks=1 --cpus-per-task=4 --mem-per-cpu=10240M --account=def-<PI_username> srun $VIRTUAL_ENV/bin/notebook.sh

   You may change the values of --account, --time, --mem-per-cpus.

9) open another terminal, activate sshuttle: $ sshuttle --dns -Nr [usename]@[cluster].computecanada.ca
  
   You may change the username and cluster.

10) Once jupyter notebook job has started, copy the web link to browser, all done.

### Using Visual Studio Code by SSH remote connection
- Please refer to: https://code.visualstudio.com/docs/remote/ssh


### Install python, jupyter notebook extension support for visual studio code.
- Usually, Visual Studio Code will guide you to complete installing these extensions.

### Installing packages in R from GitHub (install_github) if behind proxy/firewall
  R 
  <p>library("httr")<p/>
  <p>set_config(use_proxy("github.com", port = 443, username = "compute-canada-username", password="compute-canada-password"))<p/>
  <p>library("devtools")<p/>
  <p>devtools::install_github("PheWAS/PheWAS") #or insert whichever package you want to install<p/>


### Setup Machine Learning Environment using PyTorch and Python virtual Environment

1) Please first follow the steps in section: **Steps to establish JupyterNotebook environment**(step1-4) to install and activate a Python environment
2) In the activated virtual environment install pytorch library following the pytorch official website guidelines(https://pytorch.org/get-started/locally/#supported-linux-distributions)
3) Launch an interactive job in CC, write python codes like the following to test if Pytorch is successfully installed
    ```python
    import torch
    x = torch.rand(5, 3)
    print(x)
    ```
    The output should be something similar to:
    ```python
    tensor([[0.3380, 0.3845, 0.3217],
            [0.8337, 0.9050, 0.2650],
            [0.2979, 0.7141, 0.9069],
            [0.1449, 0.1132, 0.1375],
            [0.4675, 0.3947, 0.1426]])
    ```
    Use the following code to test if the job environment supports GPU computation:
    ```python
    import torch
    torch.cuda.is_available()
    ```
4) To work by submitting an job or job array, it is recommended to build 3 files: 
    1. a A.py file for the python codes
    2. a B.sh file including bash commands to activate the python environment and run the .py file
       ```bash

        # python environment and pytorch is installed here

        PYTHON_ENV_PATH="path_to_python_environment" # change this
        cd $PYTHON_ENV_PATH
        source venv/bin/activate # activate python environment where pytorch is installed

        # go to the code directory
        CODE_PATH="path_where_python_file_is_saved" # change this
        cd $CODE_PATH

        python A.py                    # run the python file
        # the output will be saved in a slurm-[job_id].out file
       ```
    3. a C.sh file including `sbatch` command and related configurations.
       ```bash
       #!/bin/bash

       #SBATCH --array=1                # modify here to change the Array
       #SBATCH --time=3:0:0
       #SBATCH --mem-per-cpu=5G
       #SBATCH --cpus-per-task=4
       #SBATCH --account=def-gsarah
       #SBATCH --gres=gpu:v100:1        # beluga only supports v100
       #                                # reference:
       #                                    https://docs.computecanada.ca/wiki/Using_GPUs_with_Slurm

       bash B.sh $SLURM_ARRAY_TASK_ID
       ```
5) To submit the job, just type the following commmand in terminal:
     ```bash
     # goto the directory where C.sh is saved
     sbatch C.sh
     ```
6) Done
     
