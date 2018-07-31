# Student Database Script

# About the project:
This project is part of my second assignment for the FIT2065 (Operating Systems and The Unix Environment) unit which contains a menu script that allows the user to view, search, add, update, delete record of a particular student or students from the database file. The project contains the following:

## 1. records.txt (database file)
### Examples:
    Student ID, Title, Last Name, First Name, Degree, Teaching Period, Campus, No. of Units, Unit Code, Unit Grade, GPA, Email, Nationality
    11223344, MR, TOM, JOHN, BIT, 2016Sem1, CAULFIELD, 1, FIT2065, 2, 2, jt1@student.monash.edu, AUST
    11225566, MR, RICK, MATHEW, BIT, 2015Sem2, CLAYTON, 1, FIT2065, 3, 3, mr1@student.monash.edu, INT
    22334455, MR, HARRY, PAUL, BCS, 2016Sem1, BERWICK, 1, FIT1008, 4, 4, ph1@student.monash.edu, AUST
    22445566, MR, HARRY, PAUL, BCS, 2016Sem1, BERWICK, 1, FIT2001, 3, 3, ph2@student.monash.edu, AUST
    33556677, MR, HENRY, PAUL, BCS, 2015Sem2, CAULFIELD, 1, FIT2065, 2, 2, ph3@student.monash.edu, AUST
    66778899, MS, HANSEN, PAULINE, BIT, 2016Sem1, CLAYTON, 1, FIT2001, 2, 2, ph1@student.monash.edu, INT
    11111111, MR, LAY, RAY, BIT, 2016Sem1, CAULFIELD, 1, FIT1000, 1, 1.0, rk1@student.monash.edu, INT
    11111112, MS, LAY, RAY, BCS, 2016Sem2, CLAYTON, 2, FIT1000 FIT2000, 1 2, 1.5, rk1@student.monash.edu, AUST
    11111113, MR, LAY, RAY, BIT, 2017Sem1, BERWICK, 3, FIT1000 FIT2000 FIT3000, 1 2 3, 2.0, rk1@student.monash.edu, AUST
    11111114, MS, LAY, RAY, BCS, 2017Sem2, CAULFIELD, 4, FIT1000 FIT2000 FIT3000 FIT4000, 1 2 3 4, 2.5, rk1@student.monash.edu, INT
    
## 2. menu.sh 
### Description:
- The script presents a menu with the following operations that the user may choose:
  - a) Display detailed records of all current students on the standard output
  - b) Display only Student IDs, the GPAs, and the email addresses on the standard output
  - c) Search for any student’s record and displaying that specific student’s detailed record
  - d) Add new records to the database file (records.txt)
  - e) Delete existing records from the database file (records.txt)
  - f) Update existing records on specific record fields and save changes in the database file (records.txt)

- Once the user makes a selection and the selected operation has been completed, the main menu is refreshed and displayed again such that the script user could make another choice. The program is terminated when the user enter either q or Q.

- Appropriate error message (“Invalid option selected. Press Enter to continue...”) will be displayed if the user selects any input other than a, b, c, d, e, f, q or Q.
- Appropriate error message (“Selection not entered. Press Enter to continue...”) will be displayed if the user simply hits the Enter key instead of typing in any input.
   
### Syntax:
    menu.sh

### Examples:
    $ menu.sh 
    Monash Student Database Main Menu

    a. Display detailed records of all current students
    b. Display Student ID, GPA, and Email Address of all current students
    c. Search for a specific student’s record with any record field
    d. Add a new student’s record
    e. Delete a student’s record based on Student ID
    f. Update a student’s record of specific fields
    q. Quit
    Your selection: 
    Selection not entered. Press Enter to continue...


    $ menu.sh 
    Monash Student Database Main Menu

    a. Display detailed records of all current students
    b. Display Student ID, GPA, and Email Address of all current students
    c. Search for a specific student’s record with any record field
    d. Add a new student’s record
    e. Delete a student’s record based on Student ID
    f. Update a student’s record of specific fields
    q. Quit
    Your selection: z
    Invalid option selected. Press Enter to continue...


    $ menu.sh 
    Monash Student Database Main Menu

    a. Display detailed records of all current students
    b. Display Student ID, GPA, and Email Address of all current students
    c. Search for a specific student’s record with any record field
    d. Add a new student’s record
    e. Delete a student’s record based on Student ID
    f. Update a student’s record of specific fields
    q. Quit
    Your selection: a

    Student ID   Title   Last Name   First Name   Degree   Teaching Period   Campus      No. of Units   Unit Code   Unit Grade   GPA   Email                    Nationality
    11223344     MR      TOM         JOHN         BIT      2016Sem1          CAULFIELD   1              FIT2065     2            2     jt1@student.monash.edu   AUST
    11225566     MR      RICK        MATHEW       BIT      2015Sem2          CLAYTON     1              FIT2065     3            3     mr1@student.monash.edu   INT
    22334455     MR      HARRY       PAUL         BCS      2016Sem1          BERWICK     1              FIT1008     4            4     ph1@student.monash.edu   AUST
    22445566     MR      HARRY       PAUL         BCS      2016Sem1          BERWICK     1              FIT2001     3            3     ph2@student.monash.edu   AUST
    33556677     MR      HENRY       PAUL         BCS      2015Sem2          CAULFIELD   1              FIT2065     2            2     ph3@student.monash.edu   AUST
    66778899     MS      HANSEN      PAULINE      BIT      2016Sem1          CLAYTON     1              FIT2001     2            2     ph1@student.monash.edu   INT


    $ menu.sh 
    Monash Student Database Main Menu

    a. Display detailed records of all current students
    b. Display Student ID, GPA, and Email Address of all current students
    c. Search for a specific student’s record with any record field
    d. Add a new student’s record
    e. Delete a student’s record based on Student ID
    f. Update a student’s record of specific fields
    q. Quit
    Your selection: b

    Student ID   GPA   Email
    22334455     4     ph1@student.monash.edu
    11225566     3     mr1@student.monash.edu
    22445566     3     ph2@student.monash.edu
    11223344     2     jt1@student.monash.edu
    33556677     2     ph3@student.monash.edu
    66778899     2     ph1@student.monash.edu
    Press Enter to continue...


    $ menu.sh 
    Monash Student Database Main Menu

    a. Display detailed records of all current students
    b. Display Student ID, GPA, and Email Address of all current students
    c. Search for a specific student’s record with any record field
    d. Add a new student’s record
    e. Delete a student’s record based on Student ID
    f. Update a student’s record of specific fields
    q. Quit
    Your selection: c
    Pattern to search: pa

    Student ID   Title   Last Name   First Name   Degree   Teaching Period   Campus      No. of Units   Unit Code   Unit Grade   GPA   Email                    Nationality
    22334455     MR      HARRY       PAUL         BCS      2016Sem1          BERWICK     1              FIT1008     4            4     ph1@student.monash.edu   AUST
    22445566     MR      HARRY       PAUL         BCS      2016Sem1          BERWICK     1              FIT2001     3            3     ph2@student.monash.edu   AUST
    33556677     MR      HENRY       PAUL         BCS      2015Sem2          CAULFIELD   1              FIT2065     2            2     ph3@student.monash.edu   AUST
    66778899     MS      HANSEN      PAULINE      BIT      2016Sem1          CLAYTON     1              FIT2001     2            2     ph1@student.monash.edu   INT


    $ menu.sh 
    Monash Student Database Main Menu

    a. Display detailed records of all current students
    b. Display Student ID, GPA, and Email Address of all current students
    c. Search for a specific student’s record with any record field
    d. Add a new student’s record
    e. Delete a student’s record based on Student ID
    f. Update a student’s record of specific fields
    q. Quit
    Your selection: d
    Enter Student ID >> 11111111
    Enter Title >> MR
    Enter Last Name >> LAY
    Enter First Name >> RAY
    Enter Degree >> BCS
    Enter Teaching Period >> 2017Sem1
    Enter Campus >> CLAYTON
    Enter No. of Units >> 4
    Enter Unit Code >> FIT1000 FIT2000 FIT3000 FIT4000
    Enter Student Email >> rk1@student.monash.edu
    Enter Student Nationality >> INT
    Record added to the database
    Press Enter to continue...


    $ menu.sh 
    Monash Student Database Main Menu

    a. Display detailed records of all current students
    b. Display Student ID, GPA, and Email Address of all current students
    c. Search for a specific student’s record with any record field
    d. Add a new student’s record
    e. Delete a student’s record based on Student ID
    f. Update a student’s record of specific fields
    q. Quit
    Your selection: e
    Enter Student ID >> 11111111
    StudentID record found...
    Record deleted from the database
    Press Enter to continue...

    $ menu.sh 
    Monash Student Database Main Menu

    a. Display detailed records of all current students
    b. Display Student ID, GPA, and Email Address of all current students
    c. Search for a specific student’s record with any record field
    d. Add a new student’s record
    e. Delete a student’s record based on Student ID
    f. Update a student’s record of specific fields
    q. Quit
    Your selection: f
    Enter Student ID >> 11223344
    StudentID record found...
    Select one of the record fields:
    a. Teaching Period
    b. Number of Units
    c. Unit Grade
    Your selection: a
    Enter New Teaching Period >> 2017Sem1
    Record updated from the database
    Press Enter to continue...


    $ menu.sh 
    Monash Student Database Main Menu

    a. Display detailed records of all current students
    b. Display Student ID, GPA, and Email Address of all current students
    c. Search for a specific student’s record with any record field
    d. Add a new student’s record
    e. Delete a student’s record based on Student ID
    f. Update a student’s record of specific fields
    q. Quit
    Your selection: f
    Enter Student ID >> 11223344
    StudentID record found...
    Select one of the record fields:
    a. Teaching Period
    b. Number of Units
    c. Unit Grade
    Your selection: b
    Enter No. of Units >> 3
    Enter Unit Code >> FIT1000 FIT2000 FIT3000
    Record updated from the database
    Press Enter to continue...


    $ menu.sh
    Monash Student Database Main Menu

    a. Display detailed records of all current students
    b. Display Student ID, GPA, and Email Address of all current students
    c. Search for a specific student’s record with any record field
    d. Add a new student’s record
    e. Delete a student’s record based on Student ID
    f. Update a student’s record of specific fields
    q. Quit
    Your selection: f
    Enter Student ID >> 11223344
    StudentID record found...
    Select one of the record fields:
    a. Teaching Period
    b. Number of Units
    c. Unit Grade
    Your selection: c
    Enter Unit Code >> FIT1000
    Unit code found...
    Enter Student Grade >> 4
    Record updated from the database
    Press Enter to continue...


    $ menu.sh 
    Monash Student Database Main Menu

    a. Display detailed records of all current students
    b. Display Student ID, GPA, and Email Address of all current students
    c. Search for a specific student’s record with any record field
    d. Add a new student’s record
    e. Delete a student’s record based on Student ID
    f. Update a student’s record of specific fields
    q. Quit
    Your selection: q


    $ menu.sh 
    Monash Student Database Main Menu

    a. Display detailed records of all current students
    b. Display Student ID, GPA, and Email Address of all current students
    c. Search for a specific student’s record with any record field
    d. Add a new student’s record
    e. Delete a student’s record based on Student ID
    f. Update a student’s record of specific fields
    q. Quit
    Your selection: Q

## 3. add_records.sh 
### Description:
- The script allows the user to add a new student record when the user selects the option d in the main menu script (menu.sh).
- The script prompts for all required student details and performs input validation; the script will keep asking for a valid input if the given input is invalid
- For the units enrolled by every new student, the corresponding unit grades will be initialised to zero (and these grades can be updated by the user later). Similarly, the GPA grade will also be initialised to zero but to be updated whenever the unit grades are modified. 
- Furthermore, the input for the number of units will determine how many unit codes should be prompted.
   
### Syntax:
    add_records.sh

### Examples:
    Student ID   Title   Last Name   First Name   Degree   Teaching Period   Campus      No. of Units   Unit Code   Unit Grade   GPA   Email                    Nationality
    11223344     MR      TOM         JOHN         BIT      2016Sem1          CAULFIELD   1              FIT2065     2            2     jt1@student.monash.edu   AUST

    $ add_records.sh
    Enter Student ID >> 11223344
    StudentID already exists. Please retry...
    Enter Student ID >> 
    Invalid input. Please retry...
    Enter Student ID >> abc
    Invalid input. Please retry...
    Enter Student ID >> 123
    Invalid input. Please retry...
    Enter Student ID >> abc123
    Invalid input. Please retry...
    Enter Student ID >> 11111111
    Enter Title >> 
    Invalid input. Please retry...
    Enter Title >> abc
    Invalid input. Please retry...
    Enter Title >> 123
    Invalid input. Please retry...
    Enter Title >> abc123
    Invalid input. Please retry...
    Enter Title >> mr
    Input must be in all uppercase. Please retry...
    Enter Title >> ms
    Input must be in all uppercase. Please retry...
    Enter Title >> MR
    Enter Last Name >> 
    Invalid input. Please retry...
    Enter Last Name >> 123
    Invalid input. Please retry...
    Enter Last Name >> LAY
    Enter First Name >> 
    Invalid input. Please retry...
    Enter First Name >> 123
    Invalid input. Please retry...
    Enter First Name >> RAY
    Enter Degree >> 
    Invalid input. Please retry...
    Enter Degree >> abc
    Invalid input. Please retry...
    Enter Degree >> 123
    Invalid input. Please retry...
    Enter Degree >> abc123
    Invalid input. Please retry...
    Enter Degree >> bit
    Input must be in all uppercase. Please retry...
    Enter Degree >> bcs
    Input must be in all uppercase. Please retry...
    Enter Degree >> BIT
    Enter Teaching Period >> 
    Invalid input. Please retry...
    Enter Teaching Period >> abc
    Invalid input. Please retry...
    Enter Teaching Period >> 123
    Invalid input. Please retry...
    Enter Teaching Period >> abc123
    Invalid input. Please retry...
    Enter Teaching Period >> 2017Sem0
    Invalid input. Please retry...
    Enter Teaching Period >> 2017Sem3
    Invalid input. Please retry...
    Enter Teaching Period >> 2017sem1
    Invalid input. Please retry...
    Enter Teaching Period >> 2017Sem1
    Enter Campus >> 
    Invalid input. Please retry...
    Enter Campus >> abc
    Invalid input. Please retry...
    Enter Campus >> 123
    Invalid input. Please retry...
    Enter Campus >> abc123
    Invalid input. Please retry...
    Enter Campus >> caulfield
    Input must be in all uppercase. Please retry...
    Enter Campus >> clayton
    Input must be in all uppercase. Please retry...
    Enter Campus >> berwick
    Input must be in all uppercase. Please retry...
    Enter Campus >> CAULFIELD
    Enter No. of Units >> 
    add_records.sh: line 193: [: -eq: unary operator expected
    add_records.sh: line 221: [: -eq: unary operator expected
    add_records.sh: line 268: [: -eq: unary operator expected
    add_records.sh: line 318: [: -eq: unary operator expected
    Invalid input. Please retry...
    Enter No. of Units >> abc
    add_records.sh: line 193: [: abc: integer expression expected
    add_records.sh: line 221: [: abc: integer expression expected
    add_records.sh: line 268: [: abc: integer expression expected
    add_records.sh: line 318: [: abc: integer expression expected
    Invalid input. Please retry...
    Enter No. of Units >> abc123
    add_records.sh: line 193: [: abc123: integer expression expected
    add_records.sh: line 221: [: abc123: integer expression expected
    add_records.sh: line 268: [: abc123: integer expression expected
    add_records.sh: line 318: [: abc123: integer expression expected
    Invalid input. Please retry...
    Enter No. of Units >> 0
    Invalid input. Please retry...
    Enter No. of Units >> -1
    Invalid input. Please retry...
    Enter No. of Units >> 5
    Invalid input. Please retry...
    Enter No. of Units >> 1
    Enter Unit Code >>        
    Invalid input. Please retry...
    Enter Unit Code >> fit    
    Invalid input. Please retry...
    Enter Unit Code >> fit fit
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000
    Enter Student Email >> 
    Invalid input. Please retry...
    Enter Student Email >> abc
    Invalid input. Please retry...
    Enter Student Email >> 123
    Invalid input. Please retry...
    Enter Student Email >> abc123
    Invalid input. Please retry...
    Enter Student Email >> rk1@student.monash.edu
    Enter Student Nationality >> 
    Invalid input. Please retry...
    Enter Student Nationality >> abc
    Invalid input. Please retry...
    Enter Student Nationality >> abc123
    Invalid input. Please retry...
    Enter Student Nationality >> aust
    Input must be in all uppercase. Please retry...
    Enter Student Nationality >> int
    Input must be in all uppercase. Please retry...
    Enter Student Nationality >> AUST


    $ add_records.sh
    Enter Student ID >> 11111112
    Enter Title >> MS
    Enter Last Name >> LAY
    Enter First Name >> RAY
    Enter Degree >> BCS
    Enter Teaching Period >> 2016Sem2
    Enter Campus >> CLAYTON  
    Enter No. of Units >> 2
    Enter Unit Code >> FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT FIT
    add_records.sh: line 237: [: FIT: binary operator expected
    add_records.sh: line 240: [: too many arguments
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT1000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000
    Enter Student Email >> rk1@student.monash.edu
    Enter Student Nationality >> INT


    $ add_records.sh
    Enter Student ID >> 11111113
    Enter Title >> MR
    Enter Last Name >> LAY
    Enter First Name >> RAY
    Enter Degree >> BIT
    Enter Teaching Period >> 2016Sem2
    Enter Campus >> BERWICK
    Enter No. of Units >> 3
    Enter Unit Code >> FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT FIT FIT
    add_records.sh: line 287: [: FIT: binary operator expected
    add_records.sh: line 290: [: too many arguments
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT1000 FIT2000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT1000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT2000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT3000
    Enter Student Email >> rk1@student.monash.edu
    Enter Student Nationality >> INT


    $ add_records.sh
    Enter Student ID >> 11111114
    Enter Title >> MR
    Enter Last Name >> LAY
    Enter First Name >> RAY
    Enter Degree >> BIT
    Enter Teaching Period >> 2018Sem2
    Enter Campus >> CLAYTON
    Enter No. of Units >> 4
    Enter Unit Code >> FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT FIT FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT FIT FIT FIT
    add_records.sh: line 340: [: FIT: binary operator expected
    add_records.sh: line 343: [: too many arguments
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT3000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT1000 FIT3000 FIT4000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT1000 FIT4000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT3000 FIT1000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT2000 FIT4000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT3000 FIT2000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT3000 FIT3000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT3000 FIT4000
    Enter Student Email >> rk1@student.monash.edu
    Enter Student Nationality >> INT

## 4. delete_records.sh 
### Description:
- The script allows the user to delete an existing student’s record based on Student ID when the user selects the option e in the main menu script (menu.sh).
- The script prompts for the studentID and performs input validation. In addition, the script will keep asking for a valid input if the given input is invalid
   
### Syntax:
    delete_records.sh

### Examples:
    $ delete_records.sh
    Enter Student ID >> 
    Invalid input. Please retry...
    Enter Student ID >> abc
    Invalid input. Please retry...
    Enter Student ID >> 123
    Invalid input. Please retry...
    Enter Student ID >> abc123
    Invalid input. Please retry...
    Enter Student ID >> 99999999
    StudentID record not found. Please retry...
    Enter Student ID >> 11223344
    StudentID record found...
    
## 5. update_records.sh 
### Description:
- The script allows the user to update specific record fields of an existing student when the user selects the option f in the main menu script (menu.sh).
  - The record fields that can be modified include Teaching Period, Number of Units, and Unit Grade.

- The script first prompts for the studentID in which the student's detail/details will be updated and performs input validation. 
  - The script will keep asking for a valid input if the given input is invalid
- To update the Teaching Period, the user is prompted for the new Teaching Period detail.
- If the user intends to modify the number of units, the new Unit Codes would be read in and updated. In addition, unit grades and GPA grade will be initialised to zero
- To update the Unit Grade, the user is prompted for the specific Unit Code for which its grade is to be updated. In addition, the GPA is updated whenever the unit grades are modified.
   
### Syntax:
    update_records.sh

### Examples:
    $ update_records.sh
    Enter Student ID >> 
    Invalid input. Please retry...
    Enter Student ID >> abc
    Invalid input. Please retry...
    Enter Student ID >> 123
    Invalid input. Please retry...
    Enter Student ID >> abc123
    Invalid input. Please retry...
    Enter Student ID >> 99999999
    StudentID record not found. Please retry...
    Enter Student ID >> 11223344
    StudentID record found...
    Select one of the record fields:
    a. Teaching Period
    b. Number of Units
    c. Unit Grade
    Your selection: 
    Selection not entered. Press Enter to continue...
    Your selection: z
    Invalid option selected. Press Enter to continue...
    Your selection: a
    Enter New Teaching Period >> 
    Invalid input. Please retry...
    Enter New Teaching Period >> abc
    Invalid input. Please retry...
    Enter New Teaching Period >> 123
    Invalid input. Please retry...
    Enter New Teaching Period >> abc123
    Invalid input. Please retry...
    Enter New Teaching Period >> 2017Sem0
    Invalid input. Please retry...
    Enter New Teaching Period >> 2017Sem3
    Invalid input. Please retry...
    Enter New Teaching Period >> 2017sem1
    Invalid input. Please retry...
    Enter New Teaching Period >> 2017Sem1


    $ update_records.sh
    Enter Student ID >> 11223344
    StudentID record found...
    Select one of the record fields:
    a. Teaching Period
    b. Number of Units
    c. Unit Grade
    Your selection: b
    Enter No. of Units >> 
    [: -eq: unary operator expected
    [: -eq: unary operator expected
    [: -eq: unary operator expected
    [: -eq: unary operator expected
    Invalid input. Please retry...
    Enter No. of Units >> abc
    [: abc: integer expression expected
    [: abc: integer expression expected
    [: abc: integer expression expected
    [: abc: integer expression expected
    Invalid input. Please retry...
    Enter No. of Units >> abc123
    [: abc123: integer expression expected
    [: abc123: integer expression expected
    [: abc123: integer expression expected
    [: abc123: integer expression expected
    Invalid input. Please retry...
    Enter No. of Units >> 0
    Invalid input. Please retry...
    Enter No. of Units >> -1
    Invalid input. Please retry...
    Enter No. of Units >> 5
    Invalid input. Please retry...
    Enter No. of Units >> 1
    Enter Unit Code >>        
    Invalid input. Please retry...
    Enter Unit Code >> fit    
    Invalid input. Please retry...
    Enter Unit Code >> fit fit
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000


    $ update_records.sh
    Enter Student ID >> 11223344
    StudentID record found...
    Select one of the record fields:
    a. Teaching Period
    b. Number of Units
    c. Unit Grade
    Your selection: b
    Enter No. of Units >> 2
    Enter Unit Code >> FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT FIT
    [: FIT: binary operator expected
    [: too many arguments
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT1000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000


    $ update_records.sh
    Enter Student ID >> 11223344
    StudentID record found...
    Select one of the record fields:
    a. Teaching Period
    b. Number of Units
    c. Unit Grade
    Your selection: b
    Enter No. of Units >> 3
    Enter Unit Code >> FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT FIT FIT
    [: FIT: binary operator expected
    [: too many arguments
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT1000 FIT2000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT1000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT2000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT3000


    $ update_records.sh
    Enter Student ID >> 11223344
    StudentID record found...
    Select one of the record fields:
    a. Teaching Period
    b. Number of Units
    c. Unit Grade
    Your selection: b
    Enter No. of Units >> 4
    Enter Unit Code >> FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT FIT FIT
    Invalid input. Please retry...
    Enter Unit Code >> FIT FIT FIT FIT FIT
    [: FIT: binary operator expected
    [: too many arguments
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT3000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT1000 FIT3000 FIT4000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT1000 FIT4000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT3000 FIT1000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT2000 FIT4000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT3000 FIT2000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT3000 FIT3000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000 FIT3000 FIT4000


    $ update_records.sh
    Enter Student ID >> 11223344
    StudentID record found...
    Select one of the record fields:
    a. Teaching Period
    b. Number of Units
    c. Unit Grade
    Your selection: c
    Enter Unit Code >> 
    Invalid input. Please retry...
    Enter Unit Code >> fit
    Invalid input. Please retry...
    Enter Unit Code >> fit fit
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000 FIT2000
    Invalid input. Please retry...
    Enter Unit Code >> FIT1000
    Unit code not found. Please retry...
    Enter Unit Code >> FIT2065
    Unit code found...
    Enter Student Grade >> 
    [: too many arguments
    Invalid input. Please retry...
    Enter Student Grade >> abc
    [: abc: integer expression expected
    Invalid input. Please retry...
    Enter Student Grade >> abc123
    [: abc123: integer expression expected
    Invalid input. Please retry...
    Enter Student Grade >> -1
    Invalid input. Please retry...
    Enter Student Grade >> 5
    Invalid input. Please retry...
    Enter Student Grade >> 0


    $ update_records.sh
    Enter Student ID >> 11223344
    StudentID record found...
    Select one of the record fields:
    a. Teaching Period
    b. Number of Units
    c. Unit Grade
    Your selection: c
    Enter Unit Code >> FIT2065
    Unit code found...
    Enter Student Grade >> 1


    $ update_records.sh
    Enter Student ID >> 11223344
    StudentID record found...
    Select one of the record fields:
    a. Teaching Period
    b. Number of Units
    c. Unit Grade
    Your selection: c
    Enter Unit Code >> FIT2065
    Unit code found...
    Enter Student Grade >> 2


    $ update_records.sh
    Enter Student ID >> 11223344
    StudentID record found...
    Select one of the record fields:
    a. Teaching Period
    b. Number of Units
    c. Unit Grade
    Your selection: c
    Enter Unit Code >> FIT2065
    Unit code found...
    Enter Student Grade >> 3


    $ update_records.sh
    Enter Student ID >> 11223344
    StudentID record found...
    Select one of the record fields:
    a. Teaching Period
    b. Number of Units
    c. Unit Grade
    Your selection: c
    Enter Unit Code >> FIT2065
    Unit code found...
    Enter Student Grade >> 4
