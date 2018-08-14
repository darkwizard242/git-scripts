#!/bin/bash
# v1.0
## Contains the following steps:
##	- will ask for the git URL
##	- will ask for git repo user/pass
##	- will ask for the name of the branch that you want to merge into (for .e.g master).
##	- will ask for the name of the branch that you want to merge from (for .e.g develop).
##	- will ask for a commit message that will be passed to the branch that is being merged into(for .e.g a commit message to be stored in the master branch), since it will perform a squash merge - only this message will be stored.
##	- Read repository names from the file called "repos.txt". These are stated in the file with one on each line.
##	- will clone the repository locally. 
##	- will merge the branches as provided.


echo
echo "PLEASE NOTE THAT THE BRANCH YOU ARE MERGING FROM SHOULD BE A BRANCH THAT YOU ORIGINALLY CREATED OUT OF THE BRANCH YOU ARE MERGING INTO"
echo
## Change to home directory and execute the rest of script there.
cd ~
## Remove any existing git_repos folder
rm -rf git_repos
## Create Temporary path to hold all repositories
mkdir git_repos
## Change to the Temporary directory.
cd git_repos
## Provide domain name of where the repository is hosted
read -p "Enter the domain name where your remote repository is hosted (e.g. github.com/Tech-OverLord) : " domain
echo
## Provide user to authenticate with git
read -p "Enter the user to authenticate with git: " username
read -sp "Enter the password to authenticate with git: " password
echo
echo
## Asking for original branch to create a branch from.
read -p "Enter the branch name that you want to merge into (for e.g. master) : " branch_merge_into
## Asking for the branch's name.
read -p "Enter the branch name that want to merge from (for e.g.: develop) : " branch_merge_from
echo
read -p "Enter the commit message you would like for this merge (for e.g: merging release 1.0): " commit_msg

repo_name_file="/home/ubuntu/repos.txt"
while IFS= read -r repo_name
do
	git clone https://$username:$password@$domain/$repo_name.git
	cd $repo_name
	git checkout $branch_merge_into
	git merge --squash $branch_merge_from
	git commit -m "$commit_msg"
	git push
	cd ..
done < "$repo_name_file"