#download file (files have been included in this repository)
#temp <- tempfile()
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
#data <- unzip(temp)

#create test data table, with descriptive variable names
features <- read.table("./UCI HAR Dataset/features.txt")
Test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subjectID")
Test_x <-read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features[1:561, 2])
Test_y <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activity")
Test_x_mean_std <- Test_x[, grep("mean|std", names(Test_x))]
Test_all <- data.frame(Test_subjects, Test_y, Test_x_mean_std)

#create train data table, with descriptive variable names
Train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subjectID")
Train_x <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features[1:561, 2])
Train_y <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity")
Train_x_mean_std <- Train_x[, grep("mean|std", names(Train_x))]
Train_all <-data.frame(Train_subjects, Train_y, Train_x_mean_std)

#join Train and Test data table
all_data <- rbind(Test_all, Train_all)

#create descriptive activity names
all_data$activity[all_data$activity == 1] <- "walking"
all_data$activity[all_data$activity == 2] <- "walking_upstairs"
all_data$activity[all_data$activity == 3] <- "walking_downstairs"
all_data$activity[all_data$activity == 4] <- "sitting"
all_data$activity[all_data$activity == 5] <- "standing"
all_data$activity[all_data$activity == 6] <- "laying"

#create second data set with the same columns as the all_data data frame
#pull out unique user IDs and activities
all_data_summary <- all_data[0,]
uniqueSubjects <- unique(all_data$subjectID)
uniqueActivities <- unique(all_data$activity)
#use a for loop to calculate the averages of every variable for each activity and each subject
for (subject in uniqueSubjects) {
	for (activity in uniqueActivities) {
		tempSubset <- all_data[(all_data$subjectID == subject & all_data$activity == activity),]
		means <- colMeans(tempSubset[,c(3:81)])
#create a new row for each user activity and the means
		newrow = c(tempSubset[1,1:2], means)
#rbind the new row to the data frame
		all_data_summary <- rbind(all_data_summary, data.frame(as.list(newrow), stringsAsFactors=FALSE))
	}
}
