# 1 DATA PREPARATION
# 1.1 Loading required packages
packages: required packages

# 1.2 Download dataset
fileurl: location of data files "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# 2 READ DATA
# 2.1 Read features.txt and activity_label.txt
features: Functions.
activitylabels: Activities labels.

# 2.2 Read training data
subjectTrain: Trining data set

# 2.3 Read test data
subjectTest: Test data set

# 3 Merges the training and the test sets to create one data set (for ANSWER OF POINT 1).
subject: row binded Training and Tests data sets
X: x test data.
Y: y test data.
dataSet: Column binded X & Y. 

# 4 Extracts only the measurements on the mean and standard deviation for each measurement (for ANSWER OF POINT 2)
onlyMeanStd: Means and STDs

# 5 Uses descriptive activity names to name the activities in the data set (for ANSWER OF POINT 3)
onlyMeanStd$Code: descriptive names

# 6 Appropriately labels the data set with descriptive variable names (for ANSWER OF POINT 4)
Acc can be replaced with Accelerometer.
Gyro can be replaced with Gyroscope.
BodyBody can be replaced with Body.
Mag can be replaced with Magnitude.
Character f can be replaced with Frequency.
Character t can be replaced with Time.

# 7 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject (for POINT 5 answer)
tidydata: processed data in memory.
FinalData.txt: file with processed data.
