# Course Project for Data Science class
## Getting and Cleaning Data

Requirements:
 * Merges the training and the test sets to create one data set.
 * Extracts only the measurements on the mean and standard deviation for each measurement. 
 * Uses descriptive activity names to name the activities in the data set
 * Appropriately labels the data set with descriptive variable names. 
 * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

I fulfilled the requirements in R script run_analysis.R which should be available in the same directory as this README.

The script performs the following:
 * Load packages dplyr and tidyr.
 * Load the test and train data using read.table.  
 * Combine the test and train data using rbind.  
 * Use cbind to combine the data with the subject IDs and activity IDs.
 * Convert the resulting data.frame to a tbl_df for easier processing
 * Select only the mean and std deviation columns (plus subject_id and activity_id).
 * Use inner_join to add activity names
 * Use mutate to change the column names to descriptive names
 * Group by activity and subject using group_by
 * Use summarise_each to get means for the grouping
 * Output the result
