
run_analysis.R does the following. 
1.  Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The above requirement can be accomplished by the following steps
# read the train data set

# merge all the training data set into single data frame

# read the test data set

# Merge all the test data set into single data frame

# Merge the training and the test sets to create single data set

# read the column names and assign it to the features variable

# assign activity_num and subject_num

# set the column names for the merged data

#Get the mean and standard deviation and assign it to a new data set

# read the actual activity names to replace the activity_num

#load dplyr

# convert subject_num to factor

# group the subject_num and activity_num

# Find the mean and standard deviation of all the variables in measurements data set

# change activity_num to activity_list as it is no longer a number

#write tidy_data.txt data