# Course Project for Data Science class
## Getting and Cleaning Data

Requirements:
 * Merges the training and the test sets to create one data set.
 * Extracts only the measurements on the mean and standard deviation for each measurement. 
 * Uses descriptive activity names to name the activities in the data set
 * Appropriately labels the data set with descriptive variable names. 
 * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

All data files available here: [UCI HAR Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

All code and documentation assumes you are in the directory that is created by unzipping this file.

This course project uses the following files from the UCI HAR Dataset:

  File                        |Description
  ----------------------------|------------
  test/X_test.txt             |The measurements from the dataset assigned to the test group
  test/y_test.txt             |The activity codes for the test group 
  test/subject_test.txt       |The subject ids for the test group
  train/X_train.txt           |The measurements from the dataset assigned to the train group
  train/y_train.txt           |The activity codes for the train group
  train/subject_train.txt     |The subject ids for the train group
  activity_labels.txt         |Descriptive text for the activity codes

This GitHub repo contains this README, an R script called run_analysis.R and a CodeBook.
The R script produces a dataset that is described in the CodeBook.

