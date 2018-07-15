#!/bin/bash
# v1.0
## Contains the following steps:
##	- will ask for git repo user/pass
##	- will ask for the tag name that needs to be removed.
##	- will clone the repository locally.
##	- will remove the tag and push it.


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

## Asking for tag name to remove.
read -p "Enter the tagname that you would like to remove (for e.g.: Sprint11) :  " tag
echo

repo_name_file="/home/ubuntu/repos.txt"
while IFS= read -r repo_name
do
	git clone https://$username:$password@$domain/$repo_name.git
        cd $repo_name
        git tag -d $tag
        git push origin :refs/tags/$tag
        cd ..
done < "$repo_name_file"