## Project Description
The purpose of this course project is to learn how to collect, work with, and clean a data set. 


##Collection of the raw data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

##Original (raw) data 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]


##Guide to create the tidy data file
tocreate a tydy dataset folloowins 5 steps from course project's definition were performed:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

`run_analysis.r` skript creates the tydy data set `Means_of_data.txt` deskribed in Step 5.

###Cleaning of the data

* `rbind()` is used to merge training and test data. Train and test data has the same structure, it can be appended.
* only those columns with the mean and standard deviation measures are extracted from the whole dataset. To extract the wright colomns names from  `features.txt` are required.
* Activity names and IDs are taken from  `activity_labels.txt` dataset                           .
* Final dataset contains wright colomnnames.
* New dataset `Means_of_data.txt` with all the average measures for each subject and activity type is generated and uploaded to this repository.



##Description of the variables 

* `x_train`,  `y_train`,  `x_test`,  `y_test`,  `subject_train`  and  `subject_test`  contain the raw data.
* `x_data`,  `y_data`  and  `subject_data`  append the train and test datasets for further analysis.
* `features`  contains the names for the  `x_data`  dataset. only the measurements on the mean and standard deviation for each measurement are stored in  `mean_and_std_features`. A numeric vector is used to extract the desired data.
* activity names are stored in `activity`.
* `finalData`  merges  x_data ,  y_data  and  subject_data  in a big dataset.
* `Means_of_data` contains the relevant averages which will be exported to a  `Means_of_data.txt`  file.  ddply()  from the plyr package is used to apply  colMeans().


