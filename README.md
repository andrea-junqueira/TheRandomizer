# The Randomizer
A tool to foster students' participation

The Randomizer is an R function that allows instructors to foster and register participation in class effectively. At every run, the function selects an individual and provides the instructor with the opportunity of writing this individual's grade immediately. These records are then saved into two different CSV files. In the first, the function creates a spreadsheet with all students' grades. In the second, the function produces a log file with a record of all students invited to participate, including the exact day and time they were selected.
In addition, the function also allows instructors to write participation manually (no randomization). In that case, the function will display a list with all students registered to make it easier for instructors to copy the student's name and add the participation points, such as "Jane Doe, 10".

To ensure students are selected roughly a similar number of times, the function randomly selects those invited to participate the least.

If you run the function by mistake or wish not to make any modifications to the table, when the Randomizer asks you to "Enter the number of points:", just type either "Skip" or "skip".

If you find inefficiencies or errors, do not hesitate to contact me.

## Usage:

`randomizer(students=NA, students_drop=NA, students_excused=NA,
                      directory=NA, directory_backup=NA, file_name=NA, backup=T, manual=F)`

## Function Arguments:

- `students` -- List with the names of all students registered for the class. This argument is only required when you use the function for the first time. After that, all the names are recovered from a preexisting CSV file.

- `students_drop` -- A list with the names of all students who unenrolled your class. The Randomizer will no longer select these students.

- `students_excused` -- A list with the names of all students who are temporarily on excused leave (e.g., they received a positive COVID test). The Randomizer will no longer select these students.

- `directory` -- Path to the directory in which you wish to save your CSV files. For example: "~Dropbox/MyClassSpring22"

- `directory_backup` -- At every use of the function, The Randomizer updates the CSV file to reflect a new entry. If you wish to create a backup before the modification, please provide the directory to save the backup.

- `file_name` -- Provide a name to your CSV files. For example: "MyClassSpring22_Participation" 

- `backup` -- Logical parameter indicating whether you wish to create a backup. If `backup` is `TRUE`, the Randomizer will save the version of the CSV before the new addition was made in the directory indicated by `directory_backup`. 

- `manual` -- Logical parameter indicating whether you wish to add a new entry manually. Suppose `manual` is `TRUE`. In that case, the function will output the name of all students currently registered for the class (excluded those who unenrolled or are on leave), and will ask you to add the name of the student you wish to manually add participation points for and the number of points. For example, if the number of points is equal to 10: Jane Doe, 10


## Ancilarry Files

- `randomizer_example.R` -- R script exploring the possibilities of the function with an intuitive example.
