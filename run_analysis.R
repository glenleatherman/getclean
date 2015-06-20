## Must be in same directory as test and train directories

## Step 1: Merges the training and the test sets to create one data set.
## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
## Step 3: Uses descriptive activity names to name the activities in the data set
## Step 4: Appropriately labels the data set with descriptive variable names. 
## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Load handy libraries
library(dplyr)
library(tidyr)

##Load the test data
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

##Load the train data
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

##Combine observations -- Step 1
X_all <- rbind(X_test, X_train)
y_all <- rbind(y_test, y_train)
subject_all <- rbind(subject_test, subject_train)

##Combine data tables
X_table <- cbind(X_all, y_all, subject_all)
names(X_table)[562] = "activity_id"
names(X_table)[563] = "subject_id"

##Convert to tbl_df (data frame table)
X_df <- tbl_df(X_table)

##Select only the means and standard deviations -- Step 2
X_select <-
select(X_df, 
V1 ,  ## tBodyAcc-mean()-X
V2 ,  ## tBodyAcc-mean()-Y
V3 ,  ## tBodyAcc-mean()-Z
V4 ,  ## tBodyAcc-std()-X
V5 ,  ## tBodyAcc-std()-Y
V6 ,  ## tBodyAcc-std()-Z
V41 , ## tGravityAcc-mean()-X
V42 , ## tGravityAcc-mean()-Y
V43 , ## tGravityAcc-mean()-Z
V44 , ## tGravityAcc-std()-X
V45 , ## tGravityAcc-std()-Y
V46 , ## tGravityAcc-std()-Z
V81 , ## tBodyAccJerk-mean()-X
V82 , ## tBodyAccJerk-mean()-Y
V83 , ## tBodyAccJerk-mean()-Z
V84 , ## tBodyAccJerk-std()-X
V85 , ## tBodyAccJerk-std()-Y
V86 , ## tBodyAccJerk-std()-Z
V121, ## tBodyGyro-mean()-X
V122, ## tBodyGyro-mean()-Y
V123, ## tBodyGyro-mean()-Z
V124, ## tBodyGyro-std()-X
V125, ## tBodyGyro-std()-Y
V126, ## tBodyGyro-std()-Z
V161, ## tBodyGyroJerk-mean()-X
V162, ## tBodyGyroJerk-mean()-Y
V163, ## tBodyGyroJerk-mean()-Z
V164, ## tBodyGyroJerk-std()-X
V165, ## tBodyGyroJerk-std()-Y
V166, ## tBodyGyroJerk-std()-Z
V201, ## tBodyAccMag-mean()
V202, ## tBodyAccMag-std()
V214, ## tGravityAccMag-mean()
V215, ## tGravityAccMag-std()
V227, ## tBodyAccJerkMag-mean()
V228, ## tBodyAccJerkMag-std()
V240, ## tBodyGyroMag-mean()
V241, ## tBodyGyroMag-std()
V253, ## tBodyGyroJerkMag-mean()
V254, ## tBodyGyroJerkMag-std()
V266, ## fBodyAcc-mean()-X
V267, ## fBodyAcc-mean()-Y
V268, ## fBodyAcc-mean()-Z
V269, ## fBodyAcc-std()-X
V270, ## fBodyAcc-std()-Y
V271, ## fBodyAcc-std()-Z
##V294, ## fBodyAcc-meanFreq()-X
##V295, ## fBodyAcc-meanFreq()-Y
##V296, ## fBodyAcc-meanFreq()-Z
V345, ## fBodyAccJerk-mean()-X
V346, ## fBodyAccJerk-mean()-Y
V347, ## fBodyAccJerk-mean()-Z
V348, ## fBodyAccJerk-std()-X
V349, ## fBodyAccJerk-std()-Y
V350, ## fBodyAccJerk-std()-Z
##V373, ## fBodyAccJerk-meanFreq()-X
##V374, ## fBodyAccJerk-meanFreq()-Y
##V375, ## fBodyAccJerk-meanFreq()-Z
V424, ## fBodyGyro-mean()-X
V425, ## fBodyGyro-mean()-Y
V426, ## fBodyGyro-mean()-Z
V427, ## fBodyGyro-std()-X
V428, ## fBodyGyro-std()-Y
V429, ## fBodyGyro-std()-Z
##V452, ## fBodyGyro-meanFreq()-X
##V453, ## fBodyGyro-meanFreq()-Y
##V454, ## fBodyGyro-meanFreq()-Z
V503, ## fBodyAccMag-mean()
V504, ## fBodyAccMag-std()
##V513, ## fBodyAccMag-meanFreq()
V516, ## fBodyBodyAccJerkMag-mean()
V517, ## fBodyBodyAccJerkMag-std()
##V526, ## fBodyBodyAccJerkMag-meanFreq()
V529, ## fBodyBodyGyroMag-mean()
V530, ## fBodyBodyGyroMag-std()
##V539, ## fBodyBodyGyroMag-meanFreq()
V542, ## fBodyBodyGyroJerkMag-mean()
V543, ## fBodyBodyGyroJerkMag-std()
##V552,  ## fBodyBodyGyroJerkMag-meanFreq()
activity_id,
subject_id
)

## Step 3
activities <- read.table("activity_labels.txt")
activities_df <- tbl_df(activities)
X_with_activities <- inner_join(X_select, activities_df, by = c("activity_id" = "V1"))
names(X_with_activities)[69] = "activity" 
names(X_with_activities)[2] = "V2"

## Step 4
X_with_names <- mutate(X_with_activities,
                       subject_id,
                       activity,
Mean_Time_Body_Acceleration_X = V1 ,  ## tBodyAcc-mean()-X
Mean_Time_Body_Acceleration_Y = V2 ,  ## tBodyAcc-mean()-Y
Mean_Time_Body_Acceleration_Z = V3 ,  ## tBodyAcc-mean()-Z
Standard_Deviation_Time_Body_Acceleration_X = V4 ,  ## tBodyAcc-std()-X
Standard_Deviation_Time_Body_Acceleration_Y = V5 ,  ## tBodyAcc-std()-Y
Standard_Deviation_Time_Body_Acceleration_Z = V6 ,  ## tBodyAcc-std()-Z
Mean_Time_Gravity_Acceleration_X = V41 , ## tGravityAcc-mean()-X
Mean_Time_Gravity_Acceleration_Y = V42 , ## tGravityAcc-mean()-Y
Mean_Time_Gravity_Acceleration_Z = V43 , ## tGravityAcc-mean()-Z
Standard_Deviation_Time_Gravity_Acceleration_X = V44 , ## tGravityAcc-std()-X
Standard_Deviation_Time_Gravity_Acceleration_Y = V45 , ## tGravityAcc-std()-Y
Standard_Deviation_Time_Gravity_Acceleration_Z = V46 , ## tGravityAcc-std()-Z
Mean_Time_Body_Acceleration_Jerk_X = V81 , ## tBodyAccJerk-mean()-X
Mean_Time_Body_Acceleration_Jerk_Y = V82 , ## tBodyAccJerk-mean()-Y
Mean_Time_Body_Acceleration_Jerk_Z = V83 , ## tBodyAccJerk-mean()-Z
Standard_Deviation_Time_Body_Acceleration_Jerk_X = V84 , ## tBodyAccJerk-std()-X
Standard_Deviation_Time_Body_Acceleration_Jerk_Y = V85 , ## tBodyAccJerk-std()-Y
Standard_Deviation_Time_Body_Acceleration_Jerk_Z = V86 , ## tBodyAccJerk-std()-Z
Mean_Time_Body_Angular_Velocity_X = V121, ## tBodyGyro-mean()-X
Mean_Time_Body_Angular_Velocity_X = V122, ## tBodyGyro-mean()-Y
Mean_Time_Body_Angular_Velocity_X = V123, ## tBodyGyro-mean()-Z
Standard_Deviation_Time_Body_Angular_Velocity_X = V124, ## tBodyGyro-std()-X
Standard_Deviation_Time_Body_Angular_Velocity_X = V125, ## tBodyGyro-std()-Y
Standard_Deviation_Time_Body_Angular_Velocity_X = V126, ## tBodyGyro-std()-Z
Mean_Time_Body_Angular_Velocity_Jerk_X = V161, ## tBodyGyroJerk-mean()-X
Mean_Time_Body_Angular_Velocity_Jerk_Y = V162, ## tBodyGyroJerk-mean()-Y
Mean_Time_Body_Angular_Velocity_Jerk_Z = V163, ## tBodyGyroJerk-mean()-Z
Standard_Deviation_Time_Body_Angular_Velocity_Jerk_X = V164, ## tBodyGyroJerk-std()-X
Standard_Deviation_Time_Body_Angular_Velocity_Jerk_Y = V165, ## tBodyGyroJerk-std()-Y
Standard_Deviation_Time_Body_Angular_Velocity_Jerk_Z = V166, ## tBodyGyroJerk-std()-Z
Mean_Time_Body_Acceleration_Magnitude = V201, ## tBodyAccMag-mean()
Standard_Deviation_Time_Body_Acceleration_Magnitude = V202, ## tBodyAccMag-std()
Mean_Time_Gravity_Acceleration_Magnitude = V214, ## tGravityAccMag-mean()
Standard_Deviation_Time_Gravity_Acceleration_Magnitude = V215, ## tGravityAccMag-std()
Mean_Time_Body_Acceleration_Magnitude = V227, ## tBodyAccJerkMag-mean()
Standard_Deviation_Time_Body_Acceleration_Jerk_Magnitude = V228, ## tBodyAccJerkMag-std()
Mean_Time_Body_Angular_Velocity_Magnitude = V240, ## tBodyGyroMag-mean()
Standard_Deviation_Time_Body_Angular_Velocity_Magnitude = V241, ## tBodyGyroMag-std()
Mean_Time_Body_Angular_Velocity_Jerk_Magnitude = V253, ## tBodyGyroJerkMag-mean()
Standard_Deviation_Time_Body_Angular_Velocity_Jerk_Magnitude = V254, ## tBodyGyroJerkMag-std()
Mean_Frequency_Body_Acceleration_X = V266, ## fBodyAcc-mean()-X
Mean_Frequency_Body_Acceleration_Y = V267, ## fBodyAcc-mean()-Y
Mean_Frequency_Body_Acceleration_Z = V268, ## fBodyAcc-mean()-Z
Standard_Deviation_Frequency_Body_Acceleration_X = V269, ## fBodyAcc-std()-X
Standard_Deviation_Frequency_Body_Acceleration_Y = V270, ## fBodyAcc-std()-Y
Standard_Deviation_Frequency_Body_Acceleration_Z = V271, ## fBodyAcc-std()-Z
##Weighted_Average_Frequency_Body_Acceleration_X = V294, ## fBodyAcc-meanFreq()-X
##Weighted_Average_Frequency_Body_Acceleration_Y = V295, ## fBodyAcc-meanFreq()-Y
##Weighted_Average_Frequency_Body_Acceleration_Z = V296, ## fBodyAcc-meanFreq()-Z
Mean_Frequency_Body_Acceleration_Jerk_X = V345, ## fBodyAccJerk-mean()-X
Mean_Frequency_Body_Acceleration_Jerk_Y = V346, ## fBodyAccJerk-mean()-Y
Mean_Frequency_Body_Acceleration_Jerk_Z = V347, ## fBodyAccJerk-mean()-Z
Standard_Deviation_Frequency_Body_Acceleration_Jerk_X = V348, ## fBodyAccJerk-std()-X
Standard_Deviation_Frequency_Body_Acceleration_Jerk_Y = V349, ## fBodyAccJerk-std()-Y
Standard_Deviation_Frequency_Body_Acceleration_Jerk_Z = V350, ## fBodyAccJerk-std()-Z
##Weighted_Average_Frequency_Body_Acceleration_Jerk_X = V373, ## fBodyAccJerk-meanFreq()-X
##Weighted_Average_Frequency_Body_Acceleration_Jerk_Y = V374, ## fBodyAccJerk-meanFreq()-Y
##Weighted_Average_Frequency_Body_Acceleration_Jerk_Z = V375, ## fBodyAccJerk-meanFreq()-Z
Mean_Frequency_Body_Angular_Velocity_X = V424, ## fBodyGyro-mean()-X
Mean_Frequency_Body_Angular_Velocity_Y = V425, ## fBodyGyro-mean()-Y
Mean_Frequency_Body_Angular_Velocity_Z = V426, ## fBodyGyro-mean()-Z
Standard_Deviation_Frequency_Body_Angular_Velocity_X = V427, ## fBodyGyro-std()-X
Standard_Deviation_Frequency_Body_Angular_Velocity_Y = V428, ## fBodyGyro-std()-Y
Standard_Deviation_Frequency_Body_Angular_Velocity_Z = V429, ## fBodyGyro-std()-Z
##Weighted_Average_Frequency_Body_Angular_Velocity_X = V452, ## fBodyGyro-meanFreq()-X
##Weighted_Average_Frequency_Body_Angular_Velocity_Y = V453, ## fBodyGyro-meanFreq()-Y
##Weighted_Average_Frequency_Body_Angular_Velocity_Z = V454, ## fBodyGyro-meanFreq()-Z
Mean_Frequency_Body_Acceleration_Magnitude = V503, ## fBodyAccMag-mean()
Standard_Deviation_Frequency_Body_Acceleration_Magnitude = V504, ## fBodyAccMag-std()
##Weighted_Average_Frequency_Body_Acceleration_Magnitude = V513, ## fBodyAccMag-meanFreq()
Mean_Frequency_Body_Acceleration_Jerk_Magnitude = V516, ## fBodyBodyAccJerkMag-mean()
Standard_Deviation_Frequency_Body_Acceleration_Jerk_Magnitude = V517, ## fBodyBodyAccJerkMag-std()
##Weighted_Average_Frequency_Body_Acceleration_Jerk_Magnitude = V526, ## fBodyBodyAccJerkMag-meanFreq()
Mean_Frequency_Body_Angular_Velocity_Magnitude = V529, ## fBodyBodyGyroMag-mean()
Standard_Deviation_Frequency_Body_Angular_Velocity_Magnitude = V530, ## fBodyBodyGyroMag-std()
##Weighted_Average_Frequency_Body_Angular_Velocity_Magnitude = V539, ## fBodyBodyGyroMag-meanFreq()
Mean_Frequency_Body_Angular_Velocity_Magnitude = V542, ## fBodyBodyGyroJerkMag-mean()
Standard_Deviation_Frequency_Body_Angular_Velocity_Jerk_Magnitude = V543 ## fBodyBodyGyroJerkMag-std()
##Weighted_Average_Frequency_Body_Angular_Velocity_Jerk_Magnitude = V552  ## fBodyBodyGyroJerkMag-meanFreq()
)

X_final <- X_with_names[68:129]

X_grouped <- group_by(X_final, activity, subject_id)

##Step 5
X_tidy <- summarise_each(X_grouped, funs(mean))

##Output
X_tidy
