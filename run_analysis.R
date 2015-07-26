
###Getting and Cleaning Data Course Project

library(plyr) 


filename <- "getdata_projectfiles_UCI HAR Dataset.zip" 
 
## Download the dataset
if (!file.exists(filename)){ 
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
  download.file(fileURL, filename) 
  }   

## Unzip dataset
if (!file.exists("UCI HAR Dataset")) {  
  unzip(zipfile = filename)  
   } 

###1.Merges the training and the test sets to create one data set.

## read test data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

## read train data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

## append test and train data
x_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

### 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

## Read names of the measurements (features)
features <- read.table("UCI HAR Dataset/features.txt")

## names of features that match to mean or std
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2]) 

## select only mean_and_std_features from x data
x_data <- x_data[, mean_and_std_features]

### 4.Appropriately labels the data set with descriptive variable names

names(x_data) <- features[mean_and_std_features, 2] 

##3.Uses descriptive activity names to name the activities in the data set
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
names(y_data) <- "activity"

#row-names for y data set
y_data[, 1] <- activity[y_data[, 1], 2] 


# column name for Subject 
names(subject_data) <- "subject" 

finalData <- cbind(subject_data, y_data, x_data) 

### 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
Means_of_data <- ddply(finalData, .(subject, activity), function(x) colMeans(x[, 3:68]))
### export data as a text file
write.table(Means_of_data, file = "Means_of_data.txt", row.names =FALSE)
