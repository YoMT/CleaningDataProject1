
## Getting and Cleaning Data Course Project

# read the train data set
x_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')

# merge all the training data set into single data frame
train_data <- cbind(x_train,y_train,subject_train)

# read the test data set
x_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')

# Merge all the test data set into single data frame
test_data <- cbind(x_test,y_test,subject_test)

# Merge the training and the test sets to create single data set
AllData <- rbind(test_data,train_data)

# read the column names and assign it to the features variable
features <- read.table("./UCI HAR Dataset/features.txt",as.is=TRUE)

# assign activity_num and subject_num
ColNm <- c(features[,2],'activity_num','subject_num')

# set the column names for the merged data
colnames(AllData) <- ColNm

#Get the mean and standard deviation and assign it to a new data set
mean_sd_colmn <- grep("mean|std|_num", colnames(AllData))
measurements <- AllData[,mean_sd_colmn]

# read the actual activity names to replace the activity_num
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",as.is=TRUE)
measurements$activity_num <- factor(measurements$activity_num,levels=activities[,1],labels=activities[,2])

#load dplyr

library(dplyr)

# convert subject_num to factor
measurements$subject_num <- as.factor(measurements$subject_num)

# group the subject_num and activity_num
measurements <- group_by(measurements,subject_num,activity_num)

# Find the mean and standard deviation of all the variables in measurements data set
tidy_data <- summarise_each(measurements,funs(mean))

# change activity_num to activity_list as it is no longer a number
colnames(tidy_data)<-gsub("activity_num","activity_list",colnames(tidy_data))

#write tidy_data.txt data
write.table(tidy_data,"tidy_data.txt",row.name=FALSE )
