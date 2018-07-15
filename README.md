# git-scripts
This repository contains some utility scripts for git that may help you with automating git tasks.

# General Information:

## Scripts

1. `tag_add.sh` file does the following: 
* will ask the user to provide user/pass interactively.
* will clone the repository locally.
* will ask for the branch that the tags needs to be created from.
* will ask for the name of the tag to be created.
* will clone the repository locally.
* will create a git tag locally and push it onto the remote repository. 
* It will read on a per line basis from a file called repos.txt which contains a list of all the repositories. Each line contains the a single repository's name which is read, assigned a variable and used within the script using a while loop. In doing so, that tag will be created on each of those repositories listed in repos.txt file.

`tag_delete.sh` file does the following:
* will ask for git repo user/pass
* will ask for the tag name that needs to be removed.
* will clone the repository locally.
* will remove the tag and push it.
* It will read on a per line basis from a file called repos.txt which contains a list of all the repositories. Each line contains the a single repository's name which is read, assigned a variable and used within the script using a while loop. In doing so, that tag will be removed from all repositories listed in repos.txt file.

`branch_create-from-branch.sh` file does the following:
* will ask for git repo user/pass
* will ask for the name of an existing branch that you want to create a branch out of.
* will ask for the name of the new branch.
* will clone the repository locally.
* will create a new branch from the desired existing branch and push it onto remote.
* It will read on a per line basis from a file called repos.txt which contains a list of all the repositories. Each line contains the a single repository's name which is read, assigned a variable and used within the script using a while loop. In doing so, that new branch will be created onto all repositories listed in repos.txt file.


`branch_create-from-tag.sh` file does the following:
* will ask for git repo user/pass
* will ask for the name of an existing tag that you want to create a branch out of.
* will ask for the name of the new branch.
* will clone the repository locally.
* will create a new branch from the desired existing tag and push it onto remote.
* It will read on a per line basis from a file called repos.txt which contains a list of all the repositories. Each line contains the a single repository's name which is read, assigned a variable and used within the script using a while loop. In doing so, that new branch will be created onto all repositories listed in repos.txt file
	
`repos.txt` file contains the name of repositories as mentioned above. If a remote repository has been removed or a new one has been added, please modify this file to reflect the updated list of remote repositories accordingly.


## Assumptions:
1. The script is being run on a *nix machine capable of running BASH shell scripts.
2. GIT is installed on the *nix machine.
3. Has connectivity to connect to Remote repository, e.g. https://github.com/(username)/(repository-name).git
4. GIT has been configured against the identity of the user, i.e. username and user email. IF not, please execute the following two git commands prior to the execution of any of the above scripts to define your identity.
+ `git config --global user.email "you@example.com"`
+ `git config --global user.name "Your Name"`

**example:**

+ `git config --global user.email "123456@gmail.com"`
+ `git config --global user.name "John Doe"`
	
## Steps:
1. The five files (branch_create-from-branch.sh, branch_create-from-tag.sh, tag_add.sh, tag_delete.sh, repos.txt) need to be place into the home directory of the user for e.g. /home/overlord/
2. Modify the shell scripts where `repo_name_file` is being assinged the value of repos.txt file with whatever your home directory is. For e.g. if it is /home/overlord., then modify value from `repo_name_file="/home/ubuntu/repos.txt"` to `repo_name_file="/home/overlord/repos.txt"`.
3. Execute the following command in the directory you have placed these files into to give them "execute" permissions:
* `chmod +x *.sh`
4. Execute the shell script as desired, for e.g.
* `./tag_add.sh`
* `./tag_delete.sh`
* `./branch_create-from-branch.sh`
* `./branch_create-from-tag.sh`
