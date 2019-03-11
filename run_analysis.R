library(dplyr)

filename <- "Assignment_dataset.zip"


## Download and unzip the dataset:

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="wininet")
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# read trian data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(subject_train) = "subject"
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
#colnames(x_train) = features$functions
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
colnames(y_train) = "code"

# read activity labels
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

#colnames(activities) = "activity"
# read test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(subject_test) = "subject"
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
#colnames(x_test) = features$functions
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
colnames(y_test) = "code"

# read feature data 
features <- read.table("UCI HAR Dataset/features.txt")
colnames(features) = c("number","functions")


##1. Merges the training and the test sets to create one data set.

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
MergedData <- cbind(Subject, Y, X)

##2. Extracts only the measurements on the mean and standard deviation for each measurement.

TidyData <- MergedData %>% select(subject, code, contains("mean"), contains("std"))

##3. Uses descriptive activity names to name the activities in the data set.

TidyData$code <- activities[TidyData$code, 2]
names(TidyData)[2] = "activity"
## Create a dataset with the mean of each column for subject and activity
TidyData_summary <- TidyData %>%
                group_by(subject, activity) %>%
                summarize_all(funs(mean)) %>%
                ungroup()
## Save the data frame created as a text file in working directory
write.table(TidyData_summary, "TidyData_summary.txt", row.names = FALSE)
str(FinalData)

