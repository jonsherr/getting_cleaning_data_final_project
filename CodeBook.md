#Codebook for fulldata.txt

##Original files

Below lists the original files provided in the data set - 
   
**Original codebooks**
<br> README.txt </br>
features_info.txt

**Processed data**
<br>features.txt - original header names for processed data (561 total variables)</br>
activity_labels.txt - links the y files numeric  with the activity labels (6 total)
<br>train/X_train.txt - X file contains data for 561 processed variables in training set (7352 obs) </br>
train/y_train.txt - y file identifies which activity was done for each observation (7352 obs)
<br> test/X_test.txt - X file contains data for 561 processed variables in tst set (2947 obs) </br>
test/y_train.txt - y file identifies which activity was done for each observation (2947 obs)

**Raw or pre-processed data**
<br> subject_train.txt - each row identifies subject in training set (7352 obs) </br>
subject_test.txt - each row identifies subject in test set (2947 obs)
<br> Inertial Signals - these folders contain raw data files used to calculate processed data files </br>
   
##Research methodology
The experiments in this data set were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

Researchers captured 3-axial linear acceleration (X-axis, Y-axis, and Z-axis) and angular velocity measurements from the embedded accelerometer and gyroscope in the smartphone. Pre-processing took raw data and created additional measurements for body acceleration, gravity acceleration, and jerk (the rate of change or first derivative of acceleration) across three axis. Researchers also calculated the magnitude or length across measurements. Researchers pre-processed raw data from the accelerometer and gyroscope using a time domain signals or a Fast Fourier Transform (FFT). Means, standard deviations and other statistical calculations are recorded for each set of observations. 561 total variables recorded in the data.

For more specifies on the pre-processing methodology, please see the 'README.txt' file provided in the original data set.

For more specifices on the 561 variables provided, please see the 'features_info.txt' file provided in the original data set.

##Variable names

The variable names shown below highlight the new naming methodology and compare the new variable names to the old variable names provided in the original analysis. Format below - 
   
   old name / new name - variable description

To see a full breakout of the old compared to new header names, see 'columnnamesref.txt' file.

**User added**
<br> /subjectno - subject number in study (1-30) (from 'subject_ file) </br>
/activityno - categorical variable identifying which activity subject is doing (from y_ files)
<br> /activityname - activity name corresponding to activityno (from activity_label file) </br>
                                                     
**t set - time domain series estimates (from X_ files)**
<br> tBodyAcc/taccelerometer - body acceleration for XYZ axis </br>
tGravityAcc/tgravity - gravity impact on body acceleration for XYZ axis
<br> tBodyAccJerk/taccelerometerjerk - jerk = first derivative/rate of change of bodyacceleeration </br>
tBodyGyro/tgyroscope - measurement from body gyroscope for XYZ axis
<br> tBodyGyroJerk/tgyroscopejerk - first derivative (rate of change) of tgyroscope for XYZ axis </br>
tBodyAccMag/taccelerometermagnitude - magnitude of taccelerometer
<br> tGravityAccMag/tgravitymagnitude - magnitude of tgravityaccelerometer </br>
tBodyAccJerkMag/taccelerometerjerkmagnitude - magnitude of taccelerometerjerk
<br> tBodyGyroMag/tgyroscopemagnitude - magnitude of tgyroscope </br>
tBodyGyroJerkMag/tgyroscopejerkmagnitude - magnitude of tgyroscopejerk
                                                  
Measurements will then end with the following suffixs (not all measurements have all suffixes) - 
<br> mean -mean with no direction - magnitude only </br>
meanX -mean for X-axis
<br> meanY -mean for Y-axis </br>
meanZ -mean for Z-axis
<br> std -standard deviation with no direction - magnitude only </br>
stdX -standard deviation for X-axis
<br> stdY -standard deviation for Y-axis </br>
stdZ -standard deviation for Z-axis
                                                     
**f set - fourier set estimates (from X_ files)**
<br> fBodyAcc/facceleration - body acceleration for XYZ axis </br>
fBodyAccJerk/faccelerationjerk - jerk = first derivative/rate of change of bodyacceleeration
<br> fBodyGyro/fgyroscope - measurement from gyroscope for XYZ axis </br>
fBodyAccMag/faccelerationmagnitude - magnitude or length of fbodyacceleration
<br> fBodyBodyAccJerkMag/faccelerationjerkmagnitude - magnitude or length of fbodyaccelerationjerk </br>
fBodyBodyGyroMag/fgyroscopemagnitude - magnitude or length of fbodygyroscope
<br> fBodyBodyGyroJerkMag/fgyroscopejerkmagnitude - magnitude or length of fbodygyroscopejerk </br>
                                            
Measurements will then end with the following suffixs (not all measurements have all suffixes) - 
<br> mean -mean with no direction - magnitude only </br>
meanX -mean for X-axis
<br> meanY -mean for Y-axis </br>
meanZ -mean for Z-axis
<br> std -standard deviation with no direction - magnitude only </br>
stdX -standard deviation for X-axis
<br> stdY -standard deviation for Y-axis </br>
stdZ -standard deviation for Z-axis
                                                  