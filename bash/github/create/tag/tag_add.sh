#!/bin/bash
## v1.0

## Contains the following steps:
##	- will ask the user to provide user/pass interactively.
##	- will clone the repository locally.
##	- will ask for the branch that the tags needs to be created from.
##	- will ask for the name of the tag to be created.
##	- will clone the repository locally.
##	- will create a git tag locally and push it onto the remote repository. 


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
## Asking for branch to tag.
read -p "Enter the branch name you want to tag (e.g.: develop) : " branch
## Asking for Sprint & number to use as tag name.
read -p "Enter the name that you would like to tag as (e.g.: SprintXX) :  " tag
echo

repo_name_file="/home/ubuntu/repos.txt"
while IFS= read -r repo_name
do
	git clone https://$username:$password@$domain/$repo_name.git
	cd $repo_name
	git checkout $branch 
	git tag -a $tag -m "Tag created out of $branch for $tag "
	git push origin tag $tag
	cd ..
done < "$repo_name_file"