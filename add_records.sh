#!/bin/bash

#RAY KRISHARDI LAYADI
#RKLAY1 - 26445549
#START DATE: 2016-05-18
#LAST MODIFIED DATE: 2016-05-27

#script description#
#The script allows the user to add a new student’s record when the user selects the option d in the main menu script (menu.sh).
#The script prompts for all required student details and performs input validation. In addition, the script will keep asking for a valid input if the given input is invalid
#For the units enrolled by every new student, the corresponding unit grades will be initialised to zero (and these grades can be updated by the user later). 
#Similarly, the GPA grade will also be initialised to zero but to be updated whenever the unit grades are modified. 
#Also, the input for the number of units will determine how many unit codes should be prompted.


#variables
#variable that stores the record to be added to the database
strRecord=""
#variable that stores string of unit code(s)
strUnitCode=""
#variable that stores string of unit grade 
strUnitGrade=""
#initialise gpa to 0
gpa=0


#student ID
#keep looping until the valid studentID is given by the user (studentID must be unique)
studentIDValid=false
while [ $studentIDValid != true ]
do
	#prompt for studentID
	read -p "Enter Student ID >> " studentID
	#check that the studentID given is in the correct format and is unique
	case $studentID in
		[1-9][1-9][1-9][1-9][1-9][1-9][1-9][1-9])
			#get all of the currently stored studentID
			listOfStudentID=`cut -d ',' -f1 records.txt | tail -n +2`
			#loop through all currently stored studentID
			for id in $listOfStudentID
			do
				#if the studentID is unique then the user can exit the loop
				#if not then the appropriate error message will be displayed and the user will be prompted for studentID again
				if [ $studentID != $id ]
				then
					studentIDValid=true
				elif [ $studentID = $id ]
				then
					studentIDValid=false
					read -p "StudentID already exists. Please retry..."
					break
				else
					studentIDValid=false
					read -p "Invalid input. Please retry..."
					break
				fi
			done
		;;
		*)
			#display the appropriate error message if the studentID given is not in the correct format
			read -p "Invalid input. Please retry..."
		;;
	esac
done


#title
#keep looping until the valid title is given by the user (title must be either MR/MS in all uppercase letter)
titleValid=false
while [ $titleValid != true ]
do
	#prompt for title
	read -p "Enter Title >> " title
	#check the value of the given title
	#if the value is either MR/MS then the user can exit the loop
	#if not then the appropriate error message will be displayed and the user will be prompted for title again
	case $title in
		MR|MS)
			titleValid=true
		;;
		mr|ms)
			read -p "Input must be in all uppercase. Please retry..."
		;;
		*)
			read -p "Invalid input. Please retry..."
		;;
	esac
done


#last name
#keep looping until the valid last name is given by the user (last name must begin with a letter)
lastNameValid=false
while [ $lastNameValid != true ]
do
	#prompt for last name
	read -p "Enter Last Name >> " lastName
	#check the value of the given last name
	#if last name begins with a letter then the user can exit the loop
	#if not then the appropriate error message will be displayed and the user will be prompted for last name again
	case $lastName in
		[a-zA-Z]*)
			lastNameValid=true
		;;
		*)
			read -p "Invalid input. Please retry..."
		;;
	esac
done


#first name
#keep looping until the valid first name is given by the user (first name must begin with a letter)
firstNameValid=false
while [ $firstNameValid != true ]
do
	#prompt for first name
	read -p "Enter First Name >> " firstName
	#check the value of the given first name
	#if first name begins with a letter then the user can exit the loop
	#if not then the appropriate error message will be displayed and the user will be prompted for first name again
	case $firstName in
		[a-zA-Z]*)
			firstNameValid=true
		;;
		*)
			read -p "Invalid input. Please retry..."
		;;
	esac
done


#degree
#keep looping until the valid degree is given by the user (degree must be either BIT/BCS in all uppercase letter)
degreeValid=false
while [ $degreeValid != true ]
do
	#prompt for degree
	read -p "Enter Degree >> " degree
	#check the value of the given degree
	#if the value is either BIT/BCS then the user can exit the loop
	#if not then the appropriate error message will be displayed and the user will be prompted for degree again
	case $degree in
		BIT|BCS)
			degreeValid=true
		;;
		bit|bcs)
			read -p "Input must be in all uppercase. Please retry..."
		;;
		*)
			read -p "Invalid input. Please retry..."
		;;
	esac
done


#teaching period
#keep looping until the valid teaching period is given by the user (teaching period must be in the correct format (YYYYSem1 OR YYYYSem2))
teachingPeriodValid=false
while [ $teachingPeriodValid != true ]
do
	#prompt for teaching period
	read -p "Enter Teaching Period >> " teachingPeriod
	#check the value of the given teaching period
	#if the value is in the correct format then the user can exit the loop
	#if not then the appropriate error message will be displayed and the user will be prompted for teaching period again
	case $teachingPeriod in
		[2-9][0-9][0-9][0-9]Sem[12])
			teachingPeriodValid=true
		;;
		*)
			read -p "Invalid input. Please retry..."
		;;
	esac
done


#campus
#keep looping until the valid campus is given by the user (campus must be either CAULFIELD/CLAYTON/BERWICK in all uppercase letter)
campusValid=false
while [ $campusValid != true ]
do
	#prompt for campus
	read -p "Enter Campus >> " campus
	#check the value of the given campus
	#if the value is either CAULFIELD/CLAYTON/BERWICK then the user can exit the loop
	#if not then the appropriate error message will be displayed and the user will be prompted for campus again
	case $campus in
		CAULFIELD|CLAYTON|BERWICK)
			campusValid=true
		;;
		caulfield|clayton|berwick)
			read -p "Input must be in all uppercase. Please retry..."
		;;
		*)
			read -p "Invalid input. Please retry..."
		;;
	esac
done


#number of units
#keep looping until the valid number of units is given by the user (number of units must be numeric and in the range of 1 to 4 only)
numOfUnitsValid=false
while [ $numOfUnitsValid != true ]
do
	#prompt for number of units
	read -p "Enter No. of Units >> " numOfUnits
	#check the value of the given number of units
	if [ $numOfUnits -eq 1 ]
	then
		#if the value of the given number of units is numeric and in the range of 1 to 4 then the user can exit the loop that keeps asking for valid number of units
		#number of units: 1
		numOfUnitsValid=true
		#keep looping until the valid unit code is given by the user (unit code must be in the correct format (FIT____))
		unitCodeValid=false
		while [ $unitCodeValid != true ]
		do
			#prompt for unit code
			read -p "Enter Unit Code >> " unitCode1
			#check the value of the given unit code
			#if the value is in the correct format then the user can exit the loop that keeps asking for valid unit code
			#if not then the appropriate error message will be displayed and the user will be prompted for unit code again
			case $unitCode1 in
				FIT[1-9][0-9][0-9][0-9])
					#assign variable that stores string of unit code with the appropriate unit code given by the user
					strUnitCode+="$unitCode1"
					#assign variable that stores string of unit grade with the appropriate grade (0) for each unit code given by the user
					strUnitGrade+="0"
					unitCodeValid=true
				;;
				*)
					read -p "Invalid input. Please retry..."
				;;
			esac
		done
	#check the value of the given number of units
	elif [ $numOfUnits -eq 2 ]
	then
		#if the value of the given number of units is numeric and in the range of 1 to 4 then the user can exit the loop that keeps asking for valid number of units
		#number of units: 2
		numOfUnitsValid=true
		#keep looping until the valid unit codes are given by the user (unit codes must be in the correct format (FIT____))
		unitCodeValid=false
		while [ $unitCodeValid != true ]
		do
			#prompt for unit codes
			read -p "Enter Unit Code >> " unitCode1 unitCode2
			#check the value of the given unit codes
			#if one of the given unit codes is an empty string or a duplicate of another unit code then display the appropriate error message and the user will be prompted for unit codes again
			if [ -z $unitCode1 ]
			then
				read -p "Invalid input. Please retry..."
			elif [ -z $unitCode2 ]
			then
				read -p "Invalid input. Please retry..."
			elif [ $unitCode1 = $unitCode2 ]
			then
				read -p "Invalid input. Please retry..."
			else
				#if the value is not an empty string or a duplicate of another unit code then for each value check if the value is in the correct format
				#if all of the value is in the correct format then the user can exit the loop that keeps asking for valid unit codes
				#if not then the appropriate error message will be displayed and the user will be prompted for unit codes again
				for unitCode in $unitCode1 $unitCode2
				do
					case $unitCode in
						FIT[1-9][0-9][0-9][0-9])
							#assign variable that stores string of unit code with the appropriate unit codes given by the user
							strUnitCode+="$unitCode "
							#assign variable that stores string of unit grade with the appropriate grades (0) for each unit codes given by the user
							strUnitGrade+="0 "
							unitCodeValid=true
						;;
						*)
							#if one of the given unit codes is not in the correct format then display the appropriate error message, break the entire loop, and the user will be prompted for unit codes again
							read -p "Invalid input. Please retry..."
							unitCodeValid=false
							break
						;;
					esac					
				done		
			fi
		done
	#check the value of the given number of units
	elif [ $numOfUnits -eq 3 ]
	then
		#if the value of the given number of units is numeric and in the range of 1 to 4 then the user can exit the loop that keeps asking for valid number of units
		#number of units: 3
		numOfUnitsValid=true
		#keep looping until the valid unit codes are given by the user (unit codes must be in the correct format (FIT____))
		unitCodeValid=false
		while [ $unitCodeValid != true ]
		do
			#prompt for unit codes
			read -p "Enter Unit Code >> " unitCode1 unitCode2 unitCode3
			#check the value of the given unit codes
			#if one of the given unit codes is an empty string or a duplicate of another unit code then display the appropriate error message and the user will be prompted for unit codes again
			if [ -z $unitCode1 ]
			then
				read -p "Invalid input. Please retry..."
			elif [ -z $unitCode2 ]
			then
				read -p "Invalid input. Please retry..."
			elif [ -z $unitCode3 ]
			then
				read -p "Invalid input. Please retry..."
			elif [ $unitCode1 = $unitCode2 -o $unitCode1 = $unitCode3 -o $unitCode2 = $unitCode3 ]
			then
				read -p "Invalid input. Please retry..."
			else
				#if the value is not an empty string or a duplicate of another unit code then for each value check if the value is in the correct format
				#if all of the value is in the correct format then the user can exit the loop that keeps asking for valid unit codes
				#if not then the appropriate error message will be displayed and the user will be prompted for unit codes again
				for unitCode in $unitCode1 $unitCode2 $unitCode3
				do
					case $unitCode in
						FIT[1-9][0-9][0-9][0-9])
							#assign variable that stores string of unit code with the appropriate unit codes given by the user
							strUnitCode+="$unitCode "
							#assign variable that stores string of unit grade with the appropriate grades (0) for each unit codes given by the user
							strUnitGrade+="0 "
							unitCodeValid=true
						;;
						*)
							#if one of the given unit codes is not in the correct format then display the appropriate error message, break the entire loop, and the user will be prompted for unit codes again
							read -p "Invalid input. Please retry..."
							unitCodeValid=false
							break
						;;
					esac					
				done		
			fi
		done
	#check the value of the given number of units
	elif [ $numOfUnits -eq 4 ]
	then
		#if the value of the given number of units is numeric and in the range of 1 to 4 then the user can exit the loop that keeps asking for valid number of units
		#number of units: 4
		numOfUnitsValid=true
		#keep looping until the valid unit codes are given by the user (unit codes must be in the correct format (FIT____))
		unitCodeValid=false
		while [ $unitCodeValid != true ]
		do		
			#prompt for unit codes
			read -p "Enter Unit Code >> " unitCode1 unitCode2 unitCode3 unitCode4
			#check the value of the given unit codes
			#if one of the given unit codes is an empty string or a duplicate of another unit code then display the appropriate error message and the user will be prompted for unit codes again
			if [ -z $unitCode1 ]
			then
				read -p "Invalid input. Please retry..."
			elif [ -z $unitCode2 ]
			then
				read -p "Invalid input. Please retry..."
			elif [ -z $unitCode3 ]
			then
				read -p "Invalid input. Please retry..."
			elif [ -z $unitCode4 ]
			then
				read -p "Invalid input. Please retry..."
			elif [ $unitCode1 = $unitCode2 -o $unitCode1 = $unitCode3 -o $unitCode1 = $unitCode4 -o $unitCode2 = $unitCode3 -o $unitCode2 = $unitCode4 -o $unitCode3 = $unitCode4 ]
			then
				read -p "Invalid input. Please retry..."
			else
				#if the value is not an empty string or a duplicate of another unit code then for each value check if the value is in the correct format
				#if all of the value is in the correct format then the user can exit the loop that keeps asking for valid unit codes
				#if not then the appropriate error message will be displayed and the user will be prompted for unit codes again
				for unitCode in $unitCode1 $unitCode2 $unitCode3 $unitCode4
				do
					case $unitCode in
						FIT[1-9][0-9][0-9][0-9])
							#assign variable that stores string of unit code with the appropriate unit codes given by the user
							strUnitCode+="$unitCode "
							#assign variable that stores string of unit grade with the appropriate grades (0) for each unit codes given by the user
							strUnitGrade+="0 "
							unitCodeValid=true
						;;
						*)
							#if one of the given unit codes is not in the correct format then display the appropriate error message, break the entire loop, and the user will be prompted for unit codes again
							read -p "Invalid input. Please retry..."
							unitCodeValid=false
							break
						;;
					esac					
				done		
			fi			
		done
	else
		#if the value of the given number of units is invalid (not numeric or not in the range of 1 to 4) then display the appropriate error message and the user will be prompted for number of units again
		read -p "Invalid input. Please retry..."
	fi
done


#email
#keep looping until the valid email is given by the user (email must be in the correct format (e.g. rk1@student.monash.edu))
emailValid=false
while [ $emailValid != true ]
do
	#prompt for email
	read -p "Enter Student Email >> " email
	#check the value of the given email
	#if the value is in the correct format then the user can exit the loop
	#if not then the appropriate error message will be displayed and the user will be prompted for email again
	case $email in
		[a-z][a-z][1-9]@student.monash.edu)
			emailValid=true
		;;
		*)
			read -p "Invalid input. Please retry..."
		;;
	esac
done


#nationality
#keep looping until the valid nationality is given by the user (nationality must be either AUST/INT in all uppercase letter)
nationalityValid=false
while [ $nationalityValid != true ]
do
	#prompt for nationality
	read -p "Enter Student Nationality >> " nationality
	#check the value of the given nationality
	#if the value is either AUST/INT then the user can exit the loop
	#if not then the appropriate error message will be displayed and the user will be prompted for nationality again
	case $nationality in
		AUST)
			nationalityValid=true
		;;
		INT)
			nationalityValid=true
		;;
		aust|int)
			read -p "Input must be in all uppercase. Please retry..."
		;;
		*)
			read -p "Invalid input. Please retry..."
		;;
	esac
done


#remove whitespace at the end of the string
strUnitCode=`echo "$strUnitCode" | xargs`
strUnitGrade=`echo "$strUnitGrade" | xargs`

#structure the record based on all required database details in the correct format for insertion into the database file
strRecord+="$studentID, $title, $lastName, $firstName, $degree, $teachingPeriod, $campus, $numOfUnits, $strUnitCode, $strUnitGrade, $gpa, $email, $nationality"
#insert/append the record into the database file
echo "$strRecord" >> records.txt
