# This is the  README file for Getting and Cleaning Date Course Project

# This course project has generated 4 outputs:
# - This readme file detailing the behaviour of the run_analysis.R file
# - The run_analysis.R file, used to get, clean and reformat data
# - The BookCode.md, detailing the variables in the GetDataProject.txt file
# - The GetDataProject.txt file containing the tidy data set which is the result of this project

# run_analysis.R:

# Step 1: load dplyr and tidyr packages, they have functions we'll need to do the cleanup

# Step 2: load the various data files in data frames in memory

# Step 3: load the various label files in vectors in memory

# Step 4: Attach the various label files to the corresponding data files,
#  and rename the columns for the files containing the Subjects and Activity IDs

# Step 5: Bind the data files in order to create a test dataset and a train dataset
# At the end of this step, merge the 2 datasets into a global dataset

# Step 6: Use a series of string substitutions in order to make more meaningful the variable names

# Step 7: delete the data frames which were only used as temporary steps, in order to save some memory. The vectors containing the labels weren't removed as they are very light

# Step 8: Replacement of the activity IDs by the activity labels

# Step 9: Calculation of the mean of each column for each combination of subect ID and activity

# Step 10: Creation of the end result file

# The instruction to read the tidy dataset is 
# View(read.table("GetDataProject.txt", header = TRUE)