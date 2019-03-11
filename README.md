# Getting-and-Cleaning-Data-Assignment
This is the project for the Getting and Cleaning Data course. The final result is shown in the file tidyresults.txt. The R script in "run_analysis.R" run according to the following steps:
 * Download and unzip the dataset
 * Check if folder does not exists creat it in working directory
 * Read activity and feature 
 * Read both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
 * Merges the training and the test sets to create one data set
 * Converts the activity and subject columns into factors
 * Creates a tidy dataset that consists of the average value of  subject and activity variables.
