# getting-and-cleaning-data-assignment
Assignment for week four of Getting and Cleaning Data

##contents of the repository
- R script that will load, and analyze the data from the UCI HAR Dataset
- Code book with an explanation of all variables and data transformations

## instructions for using the run-analysis.R file
1. clone the repository from github
2. set your working directory to the current directory (setwd)
3. Run the R script. It will:
     - download and read the source data
     - consolidate all the data into one data table
     - create a new data table that calculates the average for each variable in each observation of an activity for a subject
