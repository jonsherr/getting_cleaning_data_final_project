#Section 1####################################################################

##See README file for more information about this script and the new header names for the data set

##Merges the training and the test sets to create one data set
##Extracts only the measurements on the mean and standard deviation for each measurement
##Uses descriptive activity names to name the activities in the data set

##Load packages needed to execute code
library(data.table)
library(plyr)
library(dplyr)

##Save working directory name (working directory should end with /UCI HAR Dataset)
dirname <- getwd()

##Load features.txt, contains the header names, the create colselect to load/select only mean/std columns

colname <- fread("features.txt",drop=1)
colselect <- grep("mean\\(\\)|std\\(\\)",colname$V2) 
colname <- colname[colselect]
colnum <- length(colname)

##Load activity_labels.txt, contains the 6 activity names

activityname <- fread("activity_labels.txt")
activityname <- rename(activityname, activityno = V1, activityname = V2)

##Load/format test set
###Set directory to test folder
dirnametest <- paste0(dirname,"/test")
setwd(dirnametest)

###Load test set data file using select to choose columns with mean/std measures only
testdata <- fread("X_test.txt",select = colselect)

###Rename column headers using colname from features.txt
for(i in 1:colnum) {
   newvar <- as.character(colname[i,])
   names(testdata)[i] <- newvar
}

###Load additional data (subject, activity, activity name) and combine with test set data file
subject <- fread("subject_test.txt")
subject <- rename(subject, subjectno = V1) 

activity <- fread("Y_test.txt")
activity <- rename(activity, activityno = V1)

###Add column to include activity name based on activity number per observation 
activity <- join(activity, activityname, type = "left")

testdata <- cbind(subject, activity, testdata)

##Load/format training set
###Set directory to test folder
dirnametrain <- paste0(dirname,"/train")
setwd(dirnametrain)

###Load test set data file
traindata <- fread("X_train.txt",select = colselect)

###Rename column headers using features.txt
for(i in 1:colnum) {
   newvar <- as.character(colname[i,])
   names(traindata)[i] <- newvar
}

###Load additional data (subject, activity, activity name) and combine with test set data file
###Add column to include activity name based on activity number per observation
subject <- fread("subject_train.txt")
subject <- rename(subject, subjectno = V1) 

activity <- fread("Y_train.txt")
activity <- rename(activity, activityno = V1)

activity <- join(activity, activityname, type = "left")

traindata <- cbind(subject, activity, traindata)

###Merge training and test set into one database
fulldata <- rbind(testdata, traindata)
fulldata <- arrange(fulldata, subjectno)

#Section 2####################################################################
##Number 4 - Appropriately labels the data set with descriptive variable names

##user added columns

uset <- c("subjectno","activityno","activityname")

##Rename columns for the t set - time domain series estimates

###create set for column names (non-magnitude estimates)
tset <- c("taccelerometer","tgravity","taccelerometerjerk","tgyroscope","tgyroscopejerk")
tsetx <- NULL

for(i in 1:5){
   tsetx <- c(tsetx, paste0(tset[i],"meanX"))
   tsetx <- c(tsetx, paste0(tset[i],"meanY"))
   tsetx <- c(tsetx, paste0(tset[i],"meanZ"))
   tsetx <- c(tsetx, paste0(tset[i],"stdX"))
   tsetx <- c(tsetx, paste0(tset[i],"stdY"))
   tsetx <- c(tsetx, paste0(tset[i],"stdZ"))
}

###create set for column names (magnitude estimates)
tsetm <- c("taccelerometermagnitude",
           "tgravitymagnitude",
           "taccelerometerjerkmagnitude",
           "tgyroscopemagnitude",
           "tgyroscopejerkmagnitude")
tsetmx <- NULL

for(i in 1:5) {
   tsetmx <- c(tsetmx,paste0(tsetm[i],"mean"))
   tsetmx <- c(tsetmx,paste0(tsetm[i],"std"))
}

##rename column headers for the f set variables

fset <- c("faccelerometer",
          "faccelerometerjerk",
          "fgyroscope")
fsetx <- NULL

for(i in 1:3){
   fsetx <- c(fsetx, paste0(fset[i],"meanX"))
   fsetx <- c(fsetx, paste0(fset[i],"meanY"))
   fsetx <- c(fsetx, paste0(fset[i],"meanZ"))
   fsetx <- c(fsetx, paste0(fset[i],"stdX"))
   fsetx <- c(fsetx, paste0(fset[i],"stdY"))
   fsetx <- c(fsetx, paste0(fset[i],"stdZ"))
}

fsetm <- c("faccelerometermagnitude",
           "faccelerometerjerkmagnitude",
           "fgyroscopemagnitude",
           "fgyroscopejerkmagnitude")
fsetmx <- NULL

for(i in 1:4){
   fsetmx <- c(fsetmx, paste0(fsetm[i],"mean"))
   fsetmx <- c(fsetmx, paste0(fsetm[i],"std"))
}

###Combine strings to form descriptive column names vector

newcolname <- c(uset, tsetx, tsetmx, fsetx, fsetmx)

###Rename column names in full data set

names(fulldata)[1:69] <- newcolname

#Section 3####################################################################

##Number 5 - From the data set in step 4, creates a second, independent tidy data set
##Set with the average of each variable for each activity and each subject

##Create null data frame
avgdata <- data.frame(subjectno = as.numeric(),
                      activityno = as.numeric(),
                      activityname = as.character(),
                      varname = as.character(),
                      mean = as.numeric())

##subset full data set by subject, then activity, include mean columns only
meancolselect <- grep("mean",newcolname)
meancolselectname <- grep("mean",newcolname,value = TRUE) 
meancolnum <- length(meancolselect)

activityname <- fread("activity_labels.txt")
activityname <- rename(activityname, activityno = V1, activityname = V2)

for(i in 1:30) {
   meandata <- subset(fulldata, fulldata$subjectno == i)
   for(j in 1:6) {
      colvalue <- subset(meandata, meandata$activityno == j)
      for(k in 1:meancolnum){
         colvaluecol <- subset(colvalue, select = meancolselect[k])
         colmeans <- colMeans(colvaluecol) 
         coldata <- data.frame(subjectno = i, 
                               activityno = j,
                               activityname = activityname[[j,2]], 
                               varname = meancolselectname[k], 
                               mean = colmeans,
                               row.names = NULL)
         avgdata <- rbind(avgdata, coldata)
      }
   }
}

##Set workspace back to UCI HAR Dataset folder
setwd(dirname)

##Export final files (datafull and avgdata) to .txt
write.table(fulldata, file = "fulldata.txt",row.name = FALSE)
write.table(avgdata, file = "avgdata.txt",row.name = FALSE)

##Clear workspace
rm(list = c("activity",
  "activityname",
  "coldata",
  "colmeans",
  "colname",
  "colnum",
  "colselect",
  "colvalue",
  "colvaluecol",
  "dirname",
  "dirnametest",
  "dirnametrain",
  "fset",
  "fsetm",
  "fsetmx",
  "fsetx",
  "i",
  "j",
  "k",
  "meancolnum",
  "meancolselect",
  "meancolselectname",
  "meandata",
  "newcolname",
  "newvar",
  "subject",
  "testdata",
  "traindata",
  "tset",
  "tsetm",
  "tsetmx",
  "tsetx",
  "uset"))