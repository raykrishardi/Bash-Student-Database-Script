#!/bin/bash

#RAY KRISHARDI LAYADI
#RKLAY1 - 26445549
#START DATE: 2016-05-18
#LAST MODIFIED DATE: 2016-05-27

#script description#
#The script presents a menu with the following operations that a script user may choose:
#a) Displaying the detailed records of all current students on the standard output
#b) Displaying only Student IDs, the GPAs, and the email addresses on the standard output
#c) Search for any student’s record and displaying that specific student’s detailed record
#d) Add new records to the database file (records.txt)
#e) Delete existing records from the database file (records.txt)
#f) Update existing records on specific record fields and save changes in the database file (records.txt)
#
#Once the user makes a selection and the selected operation has been completed, the main menu is refreshed and displayed again such that the
#script user could make another choice. The program is terminated when the user enter either q or Q.
#
#Appropriate error message (“Invalid option selected. Press Enter to continue...”) will be displayed if the user selects any input other than a, b, c, d, e, f, q or Q.
#Appropriate error message (“Selection not entered. Press Enter to continue...”) will be displayed if the user simply hits the Enter key instead of typing in any input.


#functions
#menu to be displayed to the user
menu(){
cat << EOF
Monash Student Database Main Menu

a. Display detailed records of all current students
b. Display Student ID, GPA, and Email Address of all current students
c. Search for a specific student’s record with any record field
d. Add a new student’s record
e. Delete a student’s record based on Student ID
f. Update a student’s record of specific fields
q. Quit
EOF
}

#variables
#variable that acts as a sentinel for the while loop
#exit the script if the user enter either "q" or "Q"
quit=false

#while the user has not entered either "q" or "Q"
while [ $quit != true ]
do
	#clear the screen
	clear
	#display the menu
	menu;
	#prompt for option
	read -p "Your selection: " option
	#check the value of the option
	case $option in
		a)
			#create a table based on records.txt content with number of columns determined by separator of ','
			#in addition, perform a numeric sort for the table based on the StudentID column
			#finally, display the result using less with -S option that chop long lines rather than wrap the lines
			column -s ',' -t records.txt | sort -k1,1n | less -S
			
			#prompt the user to press enter which will redisplay the menu
			read -p "Press Enter to continue..."
		;;
		b)
			#get the StudentID, GPA, and Email column from records.txt and redirect the output to a temporary file
			cut -d ',' -f1,11,12 records.txt > tmp
			#get the first line from the temporary file and redirect the output to another temporary file (result)
			head -n 1 tmp > result
			#get all rows starting from the 2nd row of the temporary file
			#next, perform a primary numeric sort on the GPA value in descending order and secondary numeric sort on StudentID in ascending order
			#in addition, append the output to the second temporary file (result)
			tail -n +2 tmp | sort -k2,2nr -k1,1n >> result
			#create a table based on the second temporary file content with number of columns determined by separator of ','
			column -s ',' -t result
			#finally, remove all temporary files
			rm tmp result
			
			#prompt the user to press enter which will redisplay the menu
			read -p "Press Enter to continue..."
		;;
		c)
			#prompt for a pattern to search
			read -p "Pattern to search: " pattern
			
			#get the first line from records.txt and redirect the output to a temporary file (result)
			head -n 1 records.txt > result
			#get all rows starting from the 2nd row of records.txt
			#search for a specific pattern while ignoring case distinctions
			#perform a primary numeric sort on StudentID in ascending order
			#in addition, append the output to the temporary file (result)
			tail -n +2 records.txt | grep -i $pattern | sort -k1,1n >> result
			#create a table based on the temporary file (result) content with number of columns determined by separator of ','
			#in addition, display the result using less with -S option that chop long lines rather than wrap the lines
			column -s ',' -t result | less -S
			#remove temporary file
			rm result
			
			#prompt the user to press enter which will redisplay the menu
			read -p "Press Enter to continue..."
		;;
		d)
			#run the add_records.sh script
			bash add_records.sh
			#display appropriate message when the record has been added
			echo "Record added to the database"
			
			#prompt the user to press enter which will redisplay the menu
			read -p "Press Enter to continue..."
		;;
		e)
			#run the delete_records.sh script
			bash delete_records.sh
			#display appropriate message when the record has been deleted
			echo "Record deleted from the database"
			
			#prompt the user to press enter which will redisplay the menu
			read -p "Press Enter to continue..."
		;;
		f)
			#run the update_records.sh script
			bash update_records.sh
			#display appropriate message when the record has been updated
			echo "Record updated from the database"
			
			#prompt the user to press enter which will redisplay the menu
			read -p "Press Enter to continue..."			
		;;
		[qQ])
			#exit the script if the user enter either "q" or "Q" 
			quit=true
			#clear the screen
			clear
		;;
		*)
			#determine whether the option is an empty string or an invalid option
			if [ -z $option ]
			then
				#display the appropriate message if the option is an empty string
				read -p "Selection not entered. Press Enter to continue..."
			else
				#display the appropriate message if the option is invalid
				read -p "Invalid option selected. Press Enter to continue..."
			fi
		;;
	esac
done
