#!/bin/bash
# v1.0
## Contains the following steps:
##	- will ask for git repo user/pass
##	- will ask for the name of an existing branch that you want to create a branch out of.
##	- will ask for the name of the new branch.
##	- will clone the repository locally.
##	- will create a new branch from the desired existing branch and push it onto remote.


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
## Provide user to authenticate with git
read -p "Enter the user to authenticate with git: " username
read -sp "Enter the password to authenticate with git: " password
echo
## Asking for original branch to create a branch from.
read -p "Enter the existing branch name you want to create a branch from (for e.g.: develop) : " branch_orig
## Asking for the branch's name.
read -p "Enter the new branch name you want to create (for e.g.: rc-7.7) : " branch_new

repo_name_file="/home/ubuntu/repos.txt"
while IFS= read -r repo_name
do
	git clone https://$username:$password@$domain/$repo_name.git
	cd $repo_name
	git checkout $branch_orig
	git checkout -b $branch_new
	git push --set-upstream origin $branch_new
	cd ..
done < "$repo_name_file"