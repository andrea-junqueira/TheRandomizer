# The Randomizer: An Example
# Author: Andrea Junqueira, Texas A&M University

# Importing the function:
source("/home/andrea/Dropbox/Randomizer/TheRandomizer.R") #replace the path to match your own directory

####################################################
# Using the Randomizer to select students randomly #
####################################################

# Creating the parameters:

# List of all students registered to my class:
# tip: you can import the name of your students from a CSV file and then transform the vector into a list;
# remember, you must supply this list only the first time you use the Randomizer.
mystudents = c("Student 1", "Student 2", "Student 3", "Student 4", "Student 5",
               "Student 6", "Student 7", "Student 8", "Student 9", "Student 10")

# Adding the students who unenrolled my class:
# tip: you can have this vector saved in an R script, and then just add new names as
# new students unenroll the class.
unenrolled = c("Student 2", "Student 9")

# Adding students who are temporarily on leave (e.g., they tested positive for COVID).
# tip: you can remove students that are no longer on leave as needed.
students_excused = c("Student 1", "Student 8")

# Adding the directory in which you wish to save the output of your table during the semester
# tip: it is helpful to use the directory where you keep your other files related to the course;
# do not change the directory during the semester
mydirectory = "/home/andrea/Dropbox/MyClass_Spring22/Participation"

# If you wish to keep backups of previous versions of the table, please provide the directory
# to which they should be saved. 
# tip: I reccomend creating a folder just for the backups.
mydirectory_backup = "/home/andrea/Dropbox/MyClass_Spring22/Participation/Randomizer_backup"

# Indicating the name of your table:
myfilename = "MyClass_Participation_Spring22"

# Indicating whether you wish to save a backup
# tip: You do not need to save a backup every time you use the function;
# remember, the function also produces a log file, from which you can recover information
# of previous versions. 
mybackup = TRUE

# Indicating whether you wish to add an entry manually
# tip: In this example, we will randomize the selection; for an example of
# how to use the manual option, go to line XXX.
manualentry = FALSE

# USING THE FUNCTION:
# tip: you can run the function as many times as you wish. At every time,
# both the CSV spreadsheet and the log file will be updated. Since backup is equal to TRUE,
# we are also creating a copy of the CSV spreadsheet at every iteration.

randomizer(students = mystudents, students_drop = unenrolled, students_excused = students_excused,
           directory = mydirectory, directory_backup = mydirectory_backup, file_name = myfilename,
           backup = mybackup, manual = manualentry)

#-------------------------------------------------------------

########################################################
# Using the Randomizer to enter participation manually #
########################################################

# Indicating that you wish to add an entry manually
manualentry = TRUE

randomizer(students = mystudents, students_drop = unenrolled, students_excused = students_excused,
           directory = mydirectory, directory_backup = mydirectory_backup, file_name = myfilename,
           backup = mybackup, manual = manualentry)



