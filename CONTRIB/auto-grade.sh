#!/bin/bash
#The purpose of this script is to facilitate the process of testing homework assignments.
#To protect academic integrity, the solutions have been removed from the project and 
#This script will do little more than prompt the user on how to download the essay
#questions, move the downloaded files to the current directory, rename and make them
#executable.
#In practice, this script would compare the output of student solutions to the expected
#result in the Solutions folder.
clear

#The following line prompts the user for which assignment they want to test and assigns
#the value to response.
read -p "Enter the name of the assignment you wish to grade: " response
echo "Creating directory in  ~/Downloads/autoGrade"
#The following lines are to facilitate the downloading and collecting of student solutions
sudo mkdir ~/Downloads/autoGrade && sudo chmod 777 ~/Downloads/autoGrade
echo -e "\n\nNavigate your browser to the code-based quiz assignment you want to test and copy/paste the output of the next" 
read -p "command to your browser's developer console. [Press enter to continue]" x 
#Read from autoDownload.js for the user to paste into their browser's developer console
cat autoDownload.js
read -rep $'\n\n[Press enter to continue] \n\n' x

#The following lines are to retrieve the user's current working directory so that the downloaded files
#can be moved and be cleaned up.
pwd=`pwd`
echo -e "Current directory is ${pwd}. Moving assignment folder to current directory\n\n"
sudo mv ~/Downloads/autoGrade/*.txt ${pwd}
sudo rm -r ~/Downloads/autoGrade
echo -e "Assignments will be converted to the appropriate file type\n\n"

#The following if statements are to determine which set of assignments the user wants to test.
#Within each block, the downloaded text files get converted to the appropraite type based on the
#assignment, made executable, executed, and the output is compared against the expected results
#(which have been removed to account for academic integrity.

if [ "${response}" == "H01" ]; then
	for f in H01*.txt; do
		sudo mv "$f" "${f%.txt}.sh"
		file=${f::-4}
		sudo chmod 777 ${file}.sh
		diff Solutions/${response}/${file}.txt ${file}.sh
	done
elif [ "$response" == "H02" ]; then
	for f in H02*.txt; do
		sudo mv "$f" "${f%.txt}.sh"
		file=${f::-4}
		sudo chmod 777 ${file}.sh
		diff Solutions/${response}/${file}.txt ./${file}.sh
	done
elif [ "$response" == "H03" ]; then
	for f in H03*.txt; do
		sudo mv "$f" "${f%.txt}.awk"
		file=${f::-4}
		sudo chmod 777 ${file}.awk
		diff Solutions/${response}/${file}.txt ./${file}.awk
	done
elif [ "$response" == "H04" ]; then
	for f in H04*.txt; do
		sudo mv "$f" "${f%.txt}.pl"
		file=${f::-4}
		sudo chmod 777 ${file}.pl
		diff Solutions/${response}/${file}.txt ./${file}.pl
	done
fi

sudo rm H0*.*
