#!/bin/bash

#RAY KRISHARDI LAYADI
#RKLAY1 - 26445549
#START DATE: 2016-05-18
#LAST MODIFIED DATE: 2016-05-27

#script description#
#The script allows the user to delete an existing student’s record based on Student ID when the user selects the option e in the main menu script (menu.sh).
#The script prompts for the studentID and performs input validation. In addition, the script will keep asking for a valid input if the given input is invalid


#variables
#variable that stores the line number of the record to be deleted
lineNumber=""

#get student ID
#keep looping until the valid studentID is given by the user (studentID must exist in the database)
studentIDValid=false
while [ $studentIDValid != true ]
do
	#prompt for studentID
	read -p "Enter Student ID >> " studentID
	#check that the studentID given is in the correct format and exists
	case $studentID in
		[1-9][1-9][1-9][1-9][1-9][1-9][1-9][1-9])
			#get all of the currently stored studentID
			listOfStudentID=`cut -d ',' -f1 records.txt | tail -n +2`
			#get the total number of studentID
			numberOfStudentID=`echo $listOfStudentID | wc -w`
			#counter to keep track of the number of mismatch studentID
			mismatchIdCounter=0
			#loop through all currently stored studentID
			for id in $listOfStudentID
			do
				#if the studentID exists then the user can exit the loop
				#if not then increment the mismatch counter to check whether the studentID is found or not found in the database
				if [ $studentID = $id ]
				then
					studentIDValid=true	
					read -p "StudentID record found..."
					break
				else
					mismatchIdCounter=`expr $mismatchIdCounter + 1`
				fi
			done
			#if the number of mismatch studentID is equal to the total number of studentID then it means that studentID is not found in the database
			#in addition, appropriate error message will be displayed and the user will be prompted for studentID again
			if [ $mismatchIdCounter -eq $numberOfStudentID ]
			then
				read -p "StudentID record not found. Please retry..."
			fi
		;;
		*)
			#display the appropriate error message if the studentID given is not in the correct format
			read -p "Invalid input. Please retry..."
		;;
	esac
done

#get the line number of the record to be deleted
lineNumber=`grep -n $studentID records.txt | cut -d ':' -f1`
#delete the appropriate record from the database file and redirect the output to a temporary file
sed "$lineNumber d" records.txt > tmp
#overwrite the existing database file with the temporary file
mv tmp records.txt
