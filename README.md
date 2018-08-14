# General Information:

## Description
`BASH` scripts that have been developed to facilitate in terms of the following:

* Creating a similar name tag on one or more multiple repositories as practically done in terms of Major, Minor, Hotfix or Support Releases during a software's SDLC.
	
* Removing tags from one or more repositories for housekeeping purposes.

* Creating branches out of any existing branch within one or more multiple repositories  as practically done in terms of Major, Minor, Hotfix or Support Releases during a software's SDLC.
	
* Creating branches out of any existing tag within one or multiple repositories.

* Merge a branch into another branch within one or multiple repositories.

## Scripts

1. [tag_add.sh](https://github.com/Tech-Overlord/git-scripts/blob/master/bash/github/create/tag/tag_add.sh) file does the following: 
	* will ask the user to provide user/pass interactively.
	* will clone the repository locally.
	* will ask for the branch that the tags needs to be created from.
	* will ask for the name of the tag to be created.
	* Read repository names from the file called "repos.txt". These are stated in the file with one on each line.
	* will clone the repository locally.
	* will create a git tag locally and push it onto the remote repository. 
	* Each line contains the a single repository's name which is read, assigned a variable and used within the script using a while loop. In doing so, that tag will be created on each of those repositories listed in repos.txt file.

2. [tag_delete.sh](https://github.com/Tech-Overlord/git-scripts/blob/master/bash/github/delete/tag/tag_delete.sh) file does the following:
	* will ask for git repo user/pass
	* will ask for the tag name that needs to be removed.
	* Read repository names from the file called "repos.txt". These are stated in the file with one on each line.
	* will clone the repository locally.
	* will remove the tag and push it.
	* Each line contains the a single repository's name which is read, assigned a variable and used within the script using a while loop. In doing so, that tag will be removed from all repositories listed in repos.txt file.

3. [branch_create-from-branch.sh](https://github.com/Tech-Overlord/git-scripts/blob/master/bash/github/create/branch/branch_create-from-branch.sh) file does the following:
	* will ask for git repo user/pass
	* will ask for the name of an existing branch that you want to create a branch out of.
	* will ask for the name of the new branch.
	* Read repository names from the file called "repos.txt". These are stated in the file with one on each line.
	* will clone the repository locally.
	* will create a new branch from the desired existing branch and push it onto remote.
	* Each line contains the a single repository's name which is read, assigned a variable and used within the script using a while loop. In doing so, that new branch will be created onto all repositories listed in repos.txt file.


4. [branch_create-from-tag.sh](https://github.com/Tech-Overlord/git-scripts/blob/master/bash/github/create/branch/branch_create-from-tag.sh) file does the following:
	* will ask for git repo user/pass
	* will ask for the name of an existing tag that you want to create a branch out of.
	* will ask for the name of the new branch.
	* Read repository names from the file called "repos.txt". These are stated in the file with one on each line.
	* will clone the repository locally.
	* will create a new branch from the desired existing tag and push it onto remote.
	* Each line contains the a single repository's name which is read, assigned a variable and used within the script using a while loop. In doing so, that new branch will be created onto all repositories listed in repos.txt file


5. [branch_merge-from-branch.sh](https://github.com/Tech-Overlord/git-scripts/blob/master/bash/github/merge/branch_merge-from-branch.sh) file does the following:
	* will ask for git repo user/pass
	* will ask for the name of the branch that you want to merge into (for .e.g master).
	* will ask for the name of the branch that you want to merge from (for .e.g develop).
	* will ask for a commit message that will be passed to the branch that is being merged into(for .e.g a commit message to be stored in the master branch), since it will perform a squash merge - only this message will be stored.
	* Read repository names from the file called "repos.txt". These are stated in the file with one on each line.
	* will clone the repository locally. 
	* will merge the branches as provided.
	* Each line contains the a single repository's name which is read, assigned a variable and used within the script using a while loop. In doing so, specified branch will be merged on to the desired branch within all repositories listed in repos.txt file
	
6. `repos.txt`
	* A file that contains the name of repositories as mentioned above. The above scripts read this file to perform actions. Each line should only contain a single repository's name and since shell scripts will be reading from this file, it's best to ensure the that `EOL` (End-of-Line) character of the file is `LF`.


## Assumptions:
1. The script is being run on a *nix machine capable of running BASH shell scripts.
2. GIT is installed on the *nix machine.
3. Has connectivity to connect to Remote repository, e.g. https://github.com/(username)/(repository-name).git
4. GIT has been configured against the identity of the user, i.e. username and user email. IF not, please execute the following two git commands prior to the execution of any of the above scripts to define your identity.
	+ `git config --global user.email "you@example.com"`
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
	* `./branch_merge-from-branch.sh`
