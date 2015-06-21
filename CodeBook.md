#CodeBook for tidy dataset
##produced by the R script run_analysis.R

The run_analysis.R script performs the following:
 * Load packages **dplyr** and **tidyr**.
 * Load the test and train data using **read.table**.  
 * Combine the test and train data using **rbind**.  
 * Use **cbind** to combine the data with the subject IDs and activity IDs.
 * Convert the resulting data.frame to a **tbl_df** for easier processing
 * **Select** only the mean and std deviation columns (plus subject_id and activity_id).
 * Use **inner_join** to add activity names
 * Use **mutate** to change the column names to descriptive names
 * Group by activity and subject using **group_by**
 * Use **summarise_each** to get means for the grouping
 * Output the result
 
Variables
 * X_test, y_test, subject_test                        To hold the test data
 * X_train, y_train, subject_train                     To hold the train data
 * X_all, y_all, subject_all                           The combined data (rbind)
 * X_table                                             The combined data (cbind) 
 * X_df                                                Converted to tbl_df
 * X_select                                            Select only the columns we want
 * activities, activities_df                           Activities loaded, converted to tbl_df
 * X_with_activities                                   Activities added to main dataset
 * X_with_names, X_final, X_grouped                    Data mutated, put into final form and grouped
 * X_tidy                                              Tidy data set
 
* The result set is grouped by activity and subject_id and all aggregate functions are the mean.
* X, Y, Z refer to spatial coordinates.
* Example using item 3: the mean of the mean time for acceleration due to body movement in the X direction.
* Example using item 14: the mean of the standard deviation of time for acceleration due to gravity in the Z direction. 

 [1] "subject_id"                                                       
 [2] "activity"                                                         
 [3] "Mean_Time_Body_Acceleration_X"                                    
 [4] "Mean_Time_Body_Acceleration_Y"                                    
 [5] "Mean_Time_Body_Acceleration_Z"                                    
 [6] "Standard_Deviation_Time_Body_Acceleration_X"                      
 [7] "Standard_Deviation_Time_Body_Acceleration_Y"                      
 [8] "Standard_Deviation_Time_Body_Acceleration_Z"                      
 [9] "Mean_Time_Gravity_Acceleration_X"                                 
[10] "Mean_Time_Gravity_Acceleration_Y"                                 
[11] "Mean_Time_Gravity_Acceleration_Z"                                 
[12] "Standard_Deviation_Time_Gravity_Acceleration_X"                   
[13] "Standard_Deviation_Time_Gravity_Acceleration_Y"                   
[14] "Standard_Deviation_Time_Gravity_Acceleration_Z"                   
[15] "Mean_Time_Body_Acceleration_Jerk_X"                               
[16] "Mean_Time_Body_Acceleration_Jerk_Y"                               
[17] "Mean_Time_Body_Acceleration_Jerk_Z"                               
[18] "Standard_Deviation_Time_Body_Acceleration_Jerk_X"                 
[19] "Standard_Deviation_Time_Body_Acceleration_Jerk_Y"                 
[20] "Standard_Deviation_Time_Body_Acceleration_Jerk_Z"                 
[21] "Mean_Time_Body_Angular_Velocity_X"                                
[22] "Standard_Deviation_Time_Body_Angular_Velocity_X"                  
[23] "Mean_Time_Body_Angular_Velocity_Jerk_X"                           
[24] "Mean_Time_Body_Angular_Velocity_Jerk_Y"                           
[25] "Mean_Time_Body_Angular_Velocity_Jerk_Z"                           
[26] "Standard_Deviation_Time_Body_Angular_Velocity_Jerk_X"             
[27] "Standard_Deviation_Time_Body_Angular_Velocity_Jerk_Y"             
[28] "Standard_Deviation_Time_Body_Angular_Velocity_Jerk_Z"             
[29] "Mean_Time_Body_Acceleration_Magnitude"                            
[30] "Standard_Deviation_Time_Body_Acceleration_Magnitude"              
[31] "Mean_Time_Gravity_Acceleration_Magnitude"                         
[32] "Standard_Deviation_Time_Gravity_Acceleration_Magnitude"           
[33] "Standard_Deviation_Time_Body_Acceleration_Jerk_Magnitude"         
[34] "Mean_Time_Body_Angular_Velocity_Magnitude"                        
[35] "Standard_Deviation_Time_Body_Angular_Velocity_Magnitude"          
[36] "Mean_Time_Body_Angular_Velocity_Jerk_Magnitude"                   
[37] "Standard_Deviation_Time_Body_Angular_Velocity_Jerk_Magnitude"     
[38] "Mean_Frequency_Body_Acceleration_X"                               
[39] "Mean_Frequency_Body_Acceleration_Y"                               
[40] "Mean_Frequency_Body_Acceleration_Z"                               
[41] "Standard_Deviation_Frequency_Body_Acceleration_X"                 
[42] "Standard_Deviation_Frequency_Body_Acceleration_Y"                 
[43] "Standard_Deviation_Frequency_Body_Acceleration_Z"                 
[44] "Mean_Frequency_Body_Acceleration_Jerk_X"                          
[45] "Mean_Frequency_Body_Acceleration_Jerk_Y"                          
[46] "Mean_Frequency_Body_Acceleration_Jerk_Z"                          
[47] "Standard_Deviation_Frequency_Body_Acceleration_Jerk_X"            
[48] "Standard_Deviation_Frequency_Body_Acceleration_Jerk_Y"            
[49] "Standard_Deviation_Frequency_Body_Acceleration_Jerk_Z"            
[50] "Mean_Frequency_Body_Angular_Velocity_X"                           
[51] "Mean_Frequency_Body_Angular_Velocity_Y"                           
[52] "Mean_Frequency_Body_Angular_Velocity_Z"                           
[53] "Standard_Deviation_Frequency_Body_Angular_Velocity_X"             
[54] "Standard_Deviation_Frequency_Body_Angular_Velocity_Y"             
[55] "Standard_Deviation_Frequency_Body_Angular_Velocity_Z"             
[56] "Mean_Frequency_Body_Acceleration_Magnitude"                       
[57] "Standard_Deviation_Frequency_Body_Acceleration_Magnitude"         
[58] "Mean_Frequency_Body_Acceleration_Jerk_Magnitude"                  
[59] "Standard_Deviation_Frequency_Body_Acceleration_Jerk_Magnitude"    
[60] "Mean_Frequency_Body_Angular_Velocity_Magnitude"                   
[61] "Standard_Deviation_Frequency_Body_Angular_Velocity_Magnitude"     
[62] "Standard_Deviation_Frequency_Body_Angular_Velocity_Jerk_Magnitude"
