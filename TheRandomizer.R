# The Randomizer
# January, 2022
# Author: Andrea Junqueira, Texas A&M University
# License: GNU AGPLv3

randomizer = function(students=NA, students_drop=NA, students_excused=NA,
                      directory=NA, directory_backup=NA, file_name=NA, backup=T, manual=F){ #start function
  
  
  # Check if a file already exists:
  file_created = file.exists(paste0(directory, "/", file_name, ".csv") )
    
  disregard = subset(c(students_drop, students_excused), !is.na(c(students_drop, students_excused))) 
  
  #----
  
  # Run checks:
  
  assert = function(cond, expr, call=F){
    if (!cond) stop(expr, call.=call)
  }
  
  assert(!(file_created==F & is.na(students)[1]==T),
         "'students' should be a list with the name of all students. 'students' must be provided when using the function for the first time.")
  
  assert(!is.na(directory),
         "('directory' is a string with the directory that your output should be saved (or the directory in which your output was previously saved.")
  
  assert((!is.na(directory_backup) & backup==T)|backup==F,
         "('directory_backup' is a string with the directory that you wish to save your backup. To save a backup you must inform the directory for the backup.")
  
  assert(!(file_created==F & manual==T),
         "To add an entry manually, you must have a preexisting table.")
  
  
  #----
  
  
  if(manual==T){
    
    # Read existing table:
    table = read.csv(paste0(directory, "/", file_name, ".csv"))
    
    students = table$Students
    
    # Select the student:
    students_draft = students %in% disregard
    students_draft = students[which(students_draft==F)]
    
    # Enter the number of points:
    print(students_draft)
    student_grade = readline(prompt="Enter the student's name and the number of points (format: Student, grade): ")
    
    selected = trimws(gsub(",.*","", student_grade)) 
    grade = trimws(gsub(".*,","", student_grade)) 
    
    # Update the table:
    student_history = table[table$Students==selected, ]
    column = which(is.na(student_history))
    
    if(length(column)==0){
      
      # Add a new column:
      var = paste0("Participation", ncol(table) )
      table$new_var = NA
      colnames(table)[ncol(table)] = var
      
      # Add grade to the table
      text = paste0("table$", var, "[table$Students==selected] = grade")
      eval(parse(text = text))
      
    } else {
      
      table[table$Students==selected, min(column)] = grade
      
    }
    
    # Save file: 
    write.csv(table, file=paste0(directory, "/", file_name, ".csv"), row.names = F)
    
    # Save history:
    df_log_file = read.csv(paste0(directory, "/", file_name, "_log_file.csv"))
    log_file = paste(selected, " | ", Sys.time(), " | ", grade, "| MANUAL") 
    df_log_file = rbind.data.frame(df_log_file, log_file)
    write.csv(df_log_file, file=paste0(directory, "/", file_name, "_log_file.csv"), row.names = F)
    
  } else { #**
    
    if (file_created==F){
      
      # Select the student:
      students_draft = students %in% disregard
      students_draft = students[which(students_draft==F)]
      selected = sample(students_draft, 1)
      
      # Enter the number of points:
      print(selected)
      student_grade = readline(prompt="Enter the number of points: ")
      
      # Create table:
      df = data.frame(Students=students, Participation1 = NA)
      df$Participation1[df$Students==selected] = student_grade
      
      if(!(student_grade=="skip"|student_grade=="Skip")){ #*
        
        # Save file: 
        write.csv(df, file=paste0(directory, "/", file_name, ".csv"), row.names = F)
        
        # Save history:
        log_file = paste(selected, " | ", Sys.time(), " | ", student_grade) 
        df_log_file = data.frame(history=log_file)
        write.csv(df_log_file, file=paste0(directory, "/", file_name, "_log_file.csv"), row.names = F)
        
      } #*
      
      
    } else {
      
      
      # Read existing table:
      table = read.csv(paste0(directory, "/", file_name, ".csv"))
      
      # Create backup:
      if(backup==T){
        
        write.csv(table, file=paste0(directory_backup, "/", file_name, "_", Sys.time(), ".csv"))
        
      }
      
      students = table$Students
      
      counting = apply(X = !is.na(table), MARGIN = 1, FUN = sum)
      
      # Select the student:
      students_draft = students %in% disregard
      students_draft = students[which(students_draft==F)]
      
      counting_considered = counting[which(table$Students %in% students_draft)]
      students_draft = students_draft[which(counting_considered==min(counting_considered))]
      selected = sample(students_draft, 1)
      
      # Enter the number of points:
      print(selected)
      student_grade = readline(prompt="Enter the number of points: ")
      
      # Update the table:
      student_history = table[table$Students==selected, ]
      column = which(is.na(student_history))
      
      if(length(column)==0){
        
        # Add a new column:
        var = paste0("Participation", ncol(table) )
        table$new_var = NA
        colnames(table)[ncol(table)] = var
        
        # Add grade to the table
        text = paste0("table$", var, "[table$Students==selected] = student_grade")
        eval(parse(text = text))
        
      } else {
        
        table[table$Students==selected, min(column)] = student_grade
        
      }
      
      
      if(!(student_grade=="skip"|student_grade=="Skip")){
        
        # Save file: 
        write.csv(table, file=paste0(directory, "/", file_name, ".csv"), row.names = F)
        
        # Save history:
        df_log_file = read.csv(paste0(directory, "/", file_name, "_log_file.csv"))
        log_file = paste(selected, " | ", Sys.time(), " | ", student_grade) 
        df_log_file = rbind.data.frame(df_log_file, log_file)
        write.csv(df_log_file, file=paste0(directory, "/", file_name, "_log_file.csv"), row.names = F)
        
      }
      
      
    } # end of else when the file already exists
    
  } #**
  
} # end of function










