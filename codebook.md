---
title: "Codebook"
author: "Nora Traughber"
date: "March 28, 2016"
---

## Project Description
Using the UCI HAR Dataset, I created a data frame that calculated the average of all variables related to mean or standard deviation for each of the six activities that test subject (of which there were 30) conducted.

## Notes on the original (raw) data
The source data, original README, and Codebook can be downloaded here: [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Collection of the raw data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

## Creating the tidy datafile

### Guide to create the tidy data file
Run the run_analysis script in R to download the original file, load the appropriate tables, and create a simplified data table with averages for each variable related to mean or standard deviation.

### Cleaning of the data
This script first joins user ids with study calculations (for both Test subjects and Train subjects), and assigns variable names to the study calculations based on a separate table (the features table).

Then, the script creates a new data table, and uses a for loop to run through each instance of a subject carrying out an activity and calculates the mean of the results of all other variables in the table for that instance.
## Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

#### Variables
subjectID indicates the test subject carrying out the activities. There were 30 subjects, some of which were in a Train group and others in a Test group in the raw data.

the activity variable refers to the activity the test subject was carrying out while measurements were conducted. There are 6 activities each test subject carried out:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

### Variables imported from the raw data
For each variable listed below, the run_analysis.R script creates a data table that calculates an **average** for each observation for each subject and each activity. The original variable names were preserved for ease of understanding.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
