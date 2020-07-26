# 1 DATA PREPARATION
# 1.1 Loading required packages
packages <- c("data.table", "dplyr", "reshape2", "tibble")
sapply(packages, require, character.only = TRUE)

# 1.2 Download dataset
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("./data")) {dir.create("./data")}
download.file(fileurl, destfile = "./UCI HAR Dataset.zip", method = "curl")

# 1.3- Unzip the file
unzip(zipfile = "./UCI HAR Dataset.zip", exdir = "./data")

# 2 READ DATA
# 2.1 Read features.txt and activity_label.txt
features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("N","Functions"))
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("Code", "Activity"))

# 2.2 Read training data
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$Functions)
yTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names = "Code")

# 2.3 Read test data
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$Functions)
yTest <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names = "Code")

# 3 ANSWER OF POINT 1: Merges the training and the test sets to create one data set.
subject <- rbind(subjectTrain, subjectTest)
X <- rbind(xTrain,xTest)
Y <- rbind(yTrain,yTest)
dataSet <- cbind(subject, X, Y)

# 4 ANSWER OF POINT 2: Extracts only the measurements on the mean and standard deviation for each measurement.
onlyMeanStd <- dataSet %>% select(Subject, Code, contains("std"), contains("Mean"))

# 5 ANSWER OF POINT 3: Uses descriptive activity names to name the activities in the data set.
onlyMeanStd$Code <- activitylabels[onlyMeanStd$Code, 2]

# 6 ANSWER OF POINT 4: Appropriately labels the data set with descriptive variable names.
# 6.1 Review labels
names(onlyMeanStd)
## [1] "Subject"               
## [2] "Code"                
## [3] "tBodyAcc.std...X"          
## [4] "tBodyAcc.std...Y"          
## [5] "tBodyAcc.std...Z"          
## [6] "tGravityAcc.std...X"         
## [7] "tGravityAcc.std...Y"         
## [8] "tGravityAcc.std...Z"         
## [9] "tBodyAccJerk.std...X"        
## [10] "tBodyAccJerk.std...Y"        
## [11] "tBodyAccJerk.std...Z"        
## [12] "tBodyGyro.std...X"          
## [13] "tBodyGyro.std...Y"          
## [14] "tBodyGyro.std...Z"          
## [15] "tBodyGyroJerk.std...X"        
## [16] "tBodyGyroJerk.std...Y"        
## [17] "tBodyGyroJerk.std...Z"        
## [18] "tBodyAccMag.std.."          
## [19] "tGravityAccMag.std.."        
## [20] "tBodyAccJerkMag.std.."        
## [21] "tBodyGyroMag.std.."         
## [22] "tBodyGyroJerkMag.std.."       
## [23] "fBodyAcc.std...X"          
## [24] "fBodyAcc.std...Y"          
## [25] "fBodyAcc.std...Z"          
## [26] "fBodyAccJerk.std...X"        
## [27] "fBodyAccJerk.std...Y"        
## [28] "fBodyAccJerk.std...Z"        
## [29] "fBodyGyro.std...X"          
## [30] "fBodyGyro.std...Y"          
## [31] "fBodyGyro.std...Z"          
## [32] "fBodyAccMag.std.."          
## [33] "fBodyBodyAccJerkMag.std.."      
## [34] "fBodyBodyGyroMag.std.."       
## [35] "fBodyBodyGyroJerkMag.std.."     
## [36] "tBodyAcc.mean...X"          
## [37] "tBodyAcc.mean...Y"          
## [38] "tBodyAcc.mean...Z"          
## [39] "tGravityAcc.mean...X"        
## [40] "tGravityAcc.mean...Y"        
## [41] "tGravityAcc.mean...Z"        
## [42] "tBodyAccJerk.mean...X"        
## [43] "tBodyAccJerk.mean...Y"        
## [44] "tBodyAccJerk.mean...Z"        
## [45] "tBodyGyro.mean...X"         
## [46] "tBodyGyro.mean...Y"         
## [47] "tBodyGyro.mean...Z"         
## [48] "tBodyGyroJerk.mean...X"       
## [49] "tBodyGyroJerk.mean...Y"       
## [50] "tBodyGyroJerk.mean...Z"       
## [51] "tBodyAccMag.mean.."         
## [52] "tGravityAccMag.mean.."        
## [53] "tBodyAccJerkMag.mean.."       
## [54] "tBodyGyroMag.mean.."         
## [55] "tBodyGyroJerkMag.mean.."       
## [56] "fBodyAcc.mean...X"          
## [57] "fBodyAcc.mean...Y"          
## [58] "fBodyAcc.mean...Z"          
## [59] "fBodyAcc.meanFreq...X"        
## [60] "fBodyAcc.meanFreq...Y"        
## [61] "fBodyAcc.meanFreq...Z"        
## [62] "fBodyAccJerk.mean...X"        
## [63] "fBodyAccJerk.mean...Y"        
## [64] "fBodyAccJerk.mean...Z"        
## [65] "fBodyAccJerk.meanFreq...X"      
## [66] "fBodyAccJerk.meanFreq...Y"      
## [67] "fBodyAccJerk.meanFreq...Z"      
## [68] "fBodyGyro.mean...X"         
## [69] "fBodyGyro.mean...Y"         
## [70] "fBodyGyro.mean...Z"         
## [71] "fBodyGyro.meanFreq...X"       
## [72] "fBodyGyro.meanFreq...Y"       
## [73] "fBodyGyro.meanFreq...Z"       
## [74] "fBodyAccMag.mean.."         
## [75] "fBodyAccMag.meanFreq.."       
## [76] "fBodyBodyAccJerkMag.mean.."     
## [77] "fBodyBodyAccJerkMag.meanFreq.."   
## [78] "fBodyBodyGyroMag.mean.."       
## [79] "fBodyBodyGyroMag.meanFreq.."     
## [80] "fBodyBodyGyroJerkMag.mean.."     
## [81] "fBodyBodyGyroJerkMag.meanFreq.."   
## [82] "angle.tBodyAccMean.gravity."     
## [83] "angle.tBodyAccJerkMean..gravityMean."
## [84] "angle.tBodyGyroMean.gravityMean."  
## [85] "angle.tBodyGyroJerkMean.gravityMean."
## [86] "angle.X.gravityMean."        
## [87] "angle.Y.gravityMean."        
## [88] "angle.Z.gravityMean."

# 6.2 Labels to change
# Acc can be replaced with Accelerometer
# Gyro can be replaced with Gyroscope
# BodyBody can be replaced with Body
# Mag can be replaced with Magnitude
# Character f can be replaced with Frequency
# Character t can be replaced with Time

# 6.3 Labels change
names(onlyMeanStd)[2] <- "Activity"
names(onlyMeanStd) <- gsub("Acc", "Accelerometer", names(onlyMeanStd))
names(onlyMeanStd) <- gsub("BodyBody", "Body", names(onlyMeanStd))
names(onlyMeanStd) <- gsub("Mag", "Magnitude", names(onlyMeanStd))
names(onlyMeanStd) <- gsub("Gyro", "Gyroscope", names(onlyMeanStd))
names(onlyMeanStd) <- gsub("^t", "Time", names(onlyMeanStd))
names(onlyMeanStd) <- gsub("tBody", "TimeBody", names(onlyMeanStd))
names(onlyMeanStd) <- gsub("^f", "Frequency", names(onlyMeanStd))
names(onlyMeanStd) <- gsub("-mean()", "Mean", names(onlyMeanStd),ignore.case = TRUE)
names(onlyMeanStd) <- gsub("-std()", "STD", names(onlyMeanStd), ignore.case = TRUE)
names(onlyMeanStd) <- gsub("-freq()", "Frequency", names(onlyMeanStd), ignore.case = TRUE)
names(onlyMeanStd) <- gsub("angle", "Angle", names(onlyMeanStd))
names(onlyMeanStd) <- gsub("gravity", "Gravity", names(onlyMeanStd))

# 7 POINT 5 answer: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata <- onlyMeanStd %>% group_by(Subject, Activity) %>% summarise_all(funs(mean)) 
write.table(tidydata, "FinalData.txt", row.name = FALSE)
