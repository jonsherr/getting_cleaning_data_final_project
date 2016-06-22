#Project README
This README file provides links to the original data and research methodology from UCI. The README file provides a simplified methodology discussion and more detailed discussion of the original files in the data set.

##Original data set link
Please download the data set from the UCI database and make sure your working directory is set to the main folder in the zip files.

Information on this data set can be found here -
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for this project can be found through the following link - 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Analysis for Project
Users will need to install the data.table, plyr and dplyr packages to run this analysis (library function is called at the beginning of run_analysis.R to help users).

I was asked to create a script (run_analysis) to combine, transform the original data provided. The code is broken into 3 sections and accomplishes the following:

**Section 1**
<br> 1. Merge training set and test set data to create one data set </br>
2. Extract measurments on the mean and standard deviation for each processed measurement.
<br> 3. Add a column for the descriptive activity name provided in activity_labels.txt </br>

**Section 2**
<br> 4. Rename the data set variables so they are more descriptive </br>

**Section 3**
<br> 5. Tidy data set that reports the average of each variable for each activity for each subject. </br>

run_activity.R included in this repo executes the above steps and returns two data frames -
<br> 1. fulldata - tidy data set with 10299 observations by subject and activity performed </br>
2. avg data - tidy data set 

The raw and pre-processed data files are not included in the repo. These files are stored in the original download link provided. To execute the code, download the files and set your working directory to the main folder (UCI HAR Dataset).

See Codebook.R for information on original files and variable names for produced data sets.