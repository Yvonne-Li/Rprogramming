#You should create one R script called run_analysis.R that does the following
#Merges the training and the test sets to create one data set.
#install.packages("reshape2")
#install.packages("plyr")
library(reshape2)
library(plyr)

filename <- "getdata_dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}
x_train = read.table("UCI HAR Dataset/train/X_train.txt")
y_train = read.table("UCI HAR Dataset/train/Y_train.txt")
x_test = read.table("UCI HAR Dataset/test/X_test.txt")
y_test = read.table("UCI HAR Dataset/test/Y_test.txt")
sub_train = read.table("UCI HAR Dataset/train/subject_train.txt")
sub_test = read.table("UCI HAR Dataset/test/subject_test.txt")

x_data = rbind(x_train,x_test)
y_data = rbind(y_train,y_test)
sub_data = rbind(sub_train,sub_test)

all_Data = cbind(x_data,y_data,sub_data)
colnames(all_Data) =  c("subject","activity")

all_Data$activity <- factor(all_Data$activity, levels = activityLabels[,1], labels = activityLabels[,2])
all_Data$subject <- as.factor(all_Data$subject)

all_Data.melted <- melt(all_Data, id = c("subject", "activity"))
all_Data.mean <- dcast(all_Data.melted, subject + activity ~ variable, mean)

write.table(all_Data.mean, "tidy.txt", row.names = FALSE, quote = FALSE)

#Extracts only the measurements on the mean and standard deviation for each measurement.
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names.
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.