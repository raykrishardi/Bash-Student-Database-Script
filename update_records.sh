#!/bin/bash

#RAY KRISHARDI LAYADI
#RKLAY1 - 26445549
#START DATE: 2016-05-18
#LAST MODIFIED DATE: 2016-05-27

#script description#
#The script allows the user to update specific record fields of an existing student when the user selects the option f in the main menu script (menu.sh).
#The record fields that can be modified include Teaching Period, Number of Units, and Unit Grade.
#
#The script first prompts for the studentID in which the student's detail/details will be updated and performs input validation. 
#The script will keep asking for a valid input if the given input is invalid
#To update the Teaching Period, the user is prompted for the new Teaching Period detail.
#If the user intends to modify the number of units, the new Unit Codes would be read in and updated. In addition, unit grades and GPA grade will be initialised to zero
#To update the Unit Grade, the user is prompted for the specific Unit Code for which its grade is to be updated. In addition, the GPA is updated whenever the unit grades are modified.


#variables
#variable that stores the line number of the record to be deleted
lineNumber=""
#variable that stores string of unit code(s)
strUnitCode=""
#variable that stores string of unit grade(s)
strUnitGrade=""
#variable that stores the total unit grade which will be used to calculate student's gpa
totalUnitGrade=0


#indexed array
#indexed array that stores selected student's unit code(s)
declare -a studentUnitCodeArray
#indexed array that stores selected student's unit grade(s)
declare -a studentUnitGradeArray


#functions
#menu to be displayed to the user
menu(){
cat << EOF
Select one of the record fields:
a. Teaching Period
b. Number of Units
c. Unit Grade
EOF
}

getStudentID(){
#student ID
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
}

getNewTeachingPeriod(){
#teaching period
#keep looping until the valid teaching period is given by the user (teaching period must be in the correct format (YYYYSem1 OR YYYYSem2))
teachingPeriodValid=false
while [ $teachingPeriodValid != true ]
do
	#prompt for teaching period
	read -p "Enter New Teaching Period >> " teachingPeriod
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
}

getNewNumOfUnits(){
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
		#if the value of the given number of units is invalid (not numeric or not in the range of 1 to 4) then display the appropriate error message and the user will be prompted for  number of units again
		read -p "Invalid input. Please retry..."
	fi
done
}

getUnitCode(){
#keep looping until the valid unit code is given by the user (unit code must be in the correct format (FIT____))
unitCodeValid=false
while [ $unitCodeValid != true ]
do
	#prompt for unit code
	read -p "Enter Unit Code >> " unitCode
	#check the value of the given unit code
	#if the value is in the correct format then the user can exit the loop that keeps asking for valid unit code
	#if not then the appropriate error message will be displayed and the user will be prompted for unit code again
	case $unitCode in
		FIT[1-9][0-9][0-9][0-9])
			#assign variable that stores string of unit code with the appropriate unit code given by the user
			strUnitCode+="$unitCode"
			#assign variable that stores string of unit grade with the appropriate grade (0) for each unit code given by the user
			strUnitGrade+="0"
			unitCodeValid=true
		;;
		*)
			read -p "Invalid input. Please retry..."
		;;
	esac
done
}

deleteRecord(){
#get the line number of the record to be deleted
lineNumber=`grep -n $studentID records.txt | cut -d ':' -f1`
#delete the appropriate record from the database file and redirect the output to a temporary file
sed "$lineNumber d" records.txt > tmp
#overwrite the existing database file with the temporary file
mv tmp records.txt
}



#call the getStudentID function that prompts for studentID that is needed to update specific student record
getStudentID;
#call the menu function that displays the menu
menu;

#variable that acts as a sentinel for the while loop
#exit the script if the user has selected one of the options (a or b or c)
quit=false
while [ $quit != true ]
do
	#prompt for option
	read -p "Your selection: " option
	#check the value of the option
	case $option in
		a)
			#exit the loop after these statements have been executed
			quit=true
			#get the old teaching period detail from the database file by using the studentID and remove any whitespace at the end of the string
			oldTeachingPeriod=`grep $studentID records.txt | cut -d ',' -f6 | xargs`
			#call the getNewTeachingPeriod function that prompts for new teaching period detail
			getNewTeachingPeriod;	
			#get the specific student's record from the database file by using the studentID
			#search for the old teaching period detail and replace it with the new teaching period detail
			#in addition, redirect the output to a temporary file
			grep $studentID records.txt | sed "s/$oldTeachingPeriod/$teachingPeriod/" > tmp1
			#delete the old record that contains the old detail/details from the database file
			deleteRecord;
			#insert/append the new record that contains the new detail/details into the database file
			cat tmp1 >> records.txt
			#remove the temporary file
			rm tmp1
		;;
		b)
			#exit the loop after these statements have been executed
			quit=true
			
			#get the old number of units detail from the database file by using the studentID and remove any whitespace at the end of the string
			oldNumOfUnits=`grep $studentID records.txt | cut -d ',' -f8 | xargs`
			#get the old unit code(s) detail from the database file by using the studentID and remove any whitespace at the end of the string
			oldUnitCode=`grep $studentID records.txt | cut -d ',' -f9 | xargs`
			#get the old unit grade(s) detail from the database file by using the studentID and remove any whitespace at the end of the string
			oldUnitGrade=`grep $studentID records.txt | cut -d ',' -f10 | xargs`
			#get the old gpa detail from the database file by using the studentID and remove any whitespace at the end of the string
			oldGpa=`grep $studentID records.txt | cut -d ',' -f11 | xargs`

			#call the getNewNumOfUnits function that prompts for new number of units detail
			getNewNumOfUnits;
			
			#remove whitespace at the end of the string
			strUnitCode=`echo "$strUnitCode" | xargs`
			strUnitGrade=`echo "$strUnitGrade" | xargs`
			
			#get the specific student's record from the database file by using the studentID
			#substitute the old details (number of units, unit grade(s), gpa, unit code(s)) with the new details and separate each field with a comma
			#in addition, redirect the output to a temporary file
			grep $studentID records.txt | awk -v oldNumOfUnits=$oldNumOfUnits -v newNumOfUnits=$numOfUnits -v "oldUnitGrade=$oldUnitGrade" -v "newUnitGrade=$strUnitGrade" -v oldGpa=$oldGpa -F, 'BEGIN { OFS = "," } sub(oldNumOfUnits, newNumOfUnits, $8) sub(oldUnitGrade, newUnitGrade, $10) sub(oldGpa, 0, $11)' | sed "s/$oldUnitCode/$strUnitCode/" > tmp1			
			#delete the old record that contains the old detail/details from the database file
			deleteRecord;
			#insert/append the new record that contains the new detail/details into the database file
			cat tmp1 >> records.txt
			#remove the temporary file
			rm tmp1
		;;
		c)
			#exit the loop after these statements have been executed
			quit=true
			
			#get all of the student's unit code detail/details
			listOfStudentUnitCode=`grep $studentID records.txt | cut -d ',' -f9 | xargs`
			#get the total number of student's unit code
			numberOfStudentUnitCode=`echo $listOfStudentUnitCode | wc -w`
			#get all of the student's unit grade detail/details
			listOfStudentUnitGrade=`grep $studentID records.txt | cut -d ',' -f10 | xargs`
			
			#ignore index 0 and starts with index of 1 for the indexed arrays 
			unitCodeIndex=1
			unitGradeIndex=1
			
			#populate the unit code array with the student's unit code detail/details
			for unitCodeElement in $listOfStudentUnitCode
			do
				studentUnitCodeArray[$unitCodeIndex]=$unitCodeElement
				unitCodeIndex=`expr $unitCodeIndex + 1`
			done
			
			#populate the unit grade array with the student's unit grade detail/details
			for unitGradeElement in $listOfStudentUnitGrade
			do
				studentUnitGradeArray[$unitGradeIndex]=$unitGradeElement
				unitGradeIndex=`expr $unitGradeIndex + 1`
			done	
			
			
			#keep looping until the valid unit code is given by the user (unit code must exist in the database)
			unitCodeExist=false
			while [ $unitCodeExist != true ]
			do
				#call the getUnitCode function that prompts for a valid unit code
				getUnitCode;
				#counter to keep track of the number of mismatch unit code
				mismatchUnitCodeCounter=0
				#loop through all of the student's unit code
				for individualUnitCode in $listOfStudentUnitCode
				do
					#if the unit code exists then the user can exit the loop
					#if not then increment the mismatch counter to check whether the unit code is found or not found in the database
					if [ $unitCode = $individualUnitCode ]
					then
						unitCodeExist=true
						read -p "Unit code found..."
						break
					else
						mismatchUnitCodeCounter=`expr $mismatchUnitCodeCounter + 1`
					fi
				done
				#if the number of mismatch unit code is equal to the total number of unit code then it means that unit code is not found in the database
				#in addition, appropriate error message will be displayed and the user will be prompted for unit code again
				if [ $mismatchUnitCodeCounter -eq $numberOfStudentUnitCode ]
				then
					read -p "Unit code not found. Please retry..."
				fi
			done
			
			
			#reset the index value to 1 for the unit code array
			unitCodeIndex=1			
			
			#find out the index of the specified unit code in the array of unit code	
			while [ ${studentUnitCodeArray[unitCodeIndex]} != $unitCode ]
			do
				unitCodeIndex=`expr $unitCodeIndex + 1`
			done
			
			#student grade
			#keep looping until the valid unit grade is given by the user (unit grade must be numeric and in the range of 0 to 4 only)
			gradeValid=false
			while [ $gradeValid != true ]
			do
				#prompt for unit grade
				read -p "Enter Student Grade >> " studentGrade
				#check the value of the given unitgrade
				#if the value is numeric and within the valid range then the user can exit the loop that keeps asking for valid unit grade
				#if not then the appropriate error message will be displayed and the user will be prompted for unit grade again
				if [ $studentGrade -ge 0 -a $studentGrade -le 4 ]
				then
					gradeValid=true
				else
					read -p "Invalid input. Please retry..."
				fi
			done
			
			#assign the value of the valid student grade to the appropriate unit grade array element that contains the grade for the specified unit code
			studentUnitGradeArray[$unitCodeIndex]=$studentGrade
			
			#loop through all of the student's unit grade array
			i=1
			while [ $i -le ${#studentUnitGradeArray[@]} ]
			do
				#assign variable that stores the new string of unit grade with the appropriate grade for each unit code
				newUnitGrade+="${studentUnitGradeArray[$i]} "
				#calculate the new total unit grade by adding each element of the student unit grade array
				totalUnitGrade=`expr $totalUnitGrade + ${studentUnitGradeArray[$i]}`
				i=`expr $i + 1`
			done
			
			#decrement the value of the unit grade index to get the number of unit grades (because the index starts with 1)
			unitGradeIndex=`expr $unitGradeIndex - 1`
			
			#get the old gpa detail from the database file by using the studentID and remove any whitespace at the end of the string
			oldGpa=`grep $studentID records.txt | cut -d ',' -f11 | xargs`
			#get the new gpa detail by dividing the new total unit grade with the number of unit grades (unitGradeIndex)
			#in addition, store the result with one position after the decimal
			newGpa=`echo $totalUnitGrade $unitGradeIndex | awk '{div=$1/$2; printf"%0.1f", div}'`

			
			#remove whitespace at the end of the string
			newUnitGrade=`echo $newUnitGrade | xargs`
			
			
			#get the specific student's record from the database file by using the studentID
			#substitute the old details (unit grade(s) and gpa) with the new details and separate each field with a comma
			#in addition, redirect the output to a temporary file
			grep $studentID records.txt | awk -v "oldUnitGrade=$listOfStudentUnitGrade" -v "newUnitGrade=$newUnitGrade" -v oldGpa=$oldGpa -v newGpa=$newGpa -F, 'BEGIN { OFS = "," } sub(oldUnitGrade, newUnitGrade, $10) sub(oldGpa, newGpa, $11)' > tmp1			
			#delete the old record that contains the old detail/details from the database file
			deleteRecord;
			#insert/append the new record that contains the new detail/details into the database file
			cat tmp1 >> records.txt
			#remove the temporary file
			rm tmp1
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
