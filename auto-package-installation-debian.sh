#!/bin/bash -

clear
echo "This script will automate the process of installing packages and setup environment variables also."
echo "These packages are must for any debian based distro."

# Creating a log file
log="installation-log.txt"
d=`date`
echo "This log file created during installation on ${d}" > "$log"

# Updating all the package lists
printf "Updating all the package lists" | tee -a "$log"
apt-get update >> "$log"

# Retriving package list from https://gist.githubusercontent.com/CryptoSingh1337/d45723380f1e997d1955e983e3fde03b/raw/f30a2e692c2ac4487e5051e6e31209ee1eedf0cd/recommended-ubuntu-packages.txt
printf "%s\n" "Retriving package list from https://gist.github.com/CryptoSingh1337/d45723380f1e997d1955e983e3fde03b" | tee -a "$log"
curl -o packages.txt https://gist.githubusercontent.com/CryptoSingh1337/d45723380f1e997d1955e983e3fde03b/raw/f30a2e692c2ac4487e5051e6e31209ee1eedf0cd/recommended-ubuntu-packages.txt | tee -a "$log"

# check for specific package
# Return values:
#  0 - package is installed
#  1 - package is not installed, it is available in package repository
#  2 - package is not installed, it is not available in package repository

check_for_package(){
  	if dpkg-query -s "$1" 1>/dev/null 2>&1; then
    	return 0
  	else
    	if apt-cache show "$1" 1>/dev/null 2>&1; then
      		return 1
    	else
      		return 2
    	fi
  	fi
}

# Taking file name as input (by default file name is: packages.txt)

printf "Enter the name of custom package-name list (default - packages.txt): " 
read -r f
if [ -z "$f" ]; then
	f="packages.txt"
fi
printf "Reading packages from %s\n" "$f" | tee -a "$log"

while IFS= read -r line; do
   	if check_for_package "$line"; then
   		d=`date +"%r"`
    	printf "[ %s ] %-30s - package is already installed\n" "$d" "$line" | tee -a "$log"
  	else
    	if test "$?" -eq 1; then
    		d=`date +"%r"`
    		printf "[ %s ] %-30s - installing\n" "$d" "$line" | tee -a installation-log.txt
    		# apt-get install $line >> installation-log.txt
    		if check_for_package "$line"; then
    			d=`date +%r`
				printf "[ %s ] %-30s - successfully installed\n" "$d" "$line" | tee -a "$log"
    		else
    			d=`date +"%r"`
				printf "[ %s ] %-30s - unable to install\n" "$d" "$line" | tee -a "$log"
    			printf "%s\n" "please check log file: installation-log.txt"
      		fi
    	else
    		d=`date +"%r"`
      		printf "[ %s ] %-30s - package is not installed, it is not available in package repository\n" "$d" "$line" | tee -a "$log"
    	fi
  	fi
done < $f
