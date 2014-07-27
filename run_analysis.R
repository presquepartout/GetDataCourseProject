## This script analyzes data collected from a wearable computing device. 

## Read in the list of feature names: 

rawFeatures <- read.table("./features.txt"
                          , header = FALSE
                          , stringsAsFactors = FALSE
                          , sep=" ")

## Check that the read in data frame has two columns, 
## an index 1:561 and a character column of feature names. 

str(rawFeatures)

## Find the features which are means and standard deviations.
## Save their indices in a vector. 

findMean <- grep("-mean()", rawFeatures$V2, fixed = TRUE, value =FALSE)
findStd <- grep("-std()", rawFeatures$V2, fixed = TRUE, value = FALSE)
longVector <- append(findMean, findStd)
colFeatures <- sort(longVector)

## Read in the test data and subset to the mean and standard deviation
## columns. Because the data is large, get rid of the big data frames
## when no longer needed. 

rawXtest <- read.table("./test/X_test.txt", header=FALSE)
subXtest <- rawXtest[, colFeatures]

rm(rawXtest)

rawXtrain <- read.table("./train/X_train.txt", header=FALSE)
subXtrain <- rawXtrain[, colFeatures]

rm(rawXtrain)

## Create row vector of feature names: 

nameVector <- sapply(colFeatures, function(i) rawFeatures$V2[i])

## Create a vector of new, more descriptive feature names: 

moveNames <- sub("tBodyAcc", "move", nameVector)
moveNames <- sub("fBodyAcc", "fmove", moveNames)
moveNames <- sub("tGravityAcc", "gravity", moveNames)
moveNames <- sub("tBodyGyro", "rotation", moveNames)
moveNames <- sub("fBodyGyro", "frotation", moveNames)
moveNames <- sub("fBodyBody", "fbody", moveNames)
moveNames <- sub("fbodyGyroMag", "fnormbodyrotation", moveNames)
moveNames <- sub("fbodyAccJerkMag", "fnormjerk", moveNames)
moveNames <- sub("fbodyGyroJerkMag", "fnormangularjerk", moveNames)
moveNames <- sub("moveJerk", "jerk", moveNames)
moveNames <- sub("\\-mean\\(\\)", "", moveNames)
moveNames <- sub("Jerk", "jerk", moveNames)
moveNames <- sub("(\\w+)\\-(X|Y|Z)", "\\2\\1", moveNames)
moveNames <- sub("(\\w+)\\-(X|Y|Z)(std)", "\\2\\3\\1", moveNames)
moveNames <- sub("(\\w+)\\-(std)", "\\2\\1", moveNames)
moveNames <- sub("X", "x", moveNames)
moveNames <- sub("Y", "y", moveNames)
moveNames <- sub("Z", "z", moveNames)
moveNames <- sub("(x|y|z|xstd|ystd|zstd)f", "f\\1", moveNames)
moveNames <- sub("(x|y|z)std", "std\\1", moveNames)
moveNames <- sub("stdf", "fstd", moveNames)

## Give the new names to the data sets. 

names(subXtest) <- moveNames
names(subXtrain) <- moveNames

## Read in the four additional vectors to be added: 
## Subjects and Activity for test, Subjects and Activity for train.

## first for test: 
testSubjects <- read.table("./test/subject_test.txt")
names(testSubjects) <- "subjects"

testActivities <- read.table("./test/y_test.txt")
names(testActivities) <- "activities"
activityFactors <- factor(testActivities$activities, labels = c("walk", "walkupstairs"
                                                     , "walkdownstairs"
                                                     , "sit"
                                                     , "stand"
                                                     , "liedown")
                                                     , ordered = TRUE)
testActWords <- as.character(activityFactors)

subXtest <- cbind(testSubjects, testActWords, subXtest)
names(subXtest)[2] <- "activity"

## then for train: 
trainSubjects <- read.table("./train/subject_train.txt")
names(trainSubjects) <- "subjects"

trainActivities <- read.table("./train/y_train.txt")
names(trainActivities) <- "activities"
trainactivityFactors <- factor(trainActivities$activities, labels = c("walk", "walkupstairs"
                                                                , "walkdownstairs"
                                                                , "sit"
                                                                , "stand"
                                                                , "liedown")
                                                                , ordered = TRUE)
trainActWords <- as.character(trainactivityFactors)

subXtrain <- cbind(trainSubjects, trainActWords, subXtrain)
names(subXtrain)[2] <- "activity"

## Merge the two datasets into one big (unsorted) data set:

bigData <- rbind(subXtrain, subXtest)

## Make column of subject indexes:

subjectFrame <- integer()
for (i in 1:30) {
          adder <- c(rep(i, 6))
          subjectFrame <- c(subjectFrame, adder)
}

## Compute means of data per subject, per activity: 

tidyFrame <- numeric() 

for (i in 3:68) {
      actmeans <- numeric()
      for (j in 1:30) {
            workingSet <- bigData[bigData$subjects == j,]
            result <- tapply(workingSet[,i], workingSet$activity, mean)
            actmeans <- c(actmeans, as.vector(result))
      }
      tidyFrame <- cbind(tidyFrame,as.vector(actmeans))
}

## Make column of activities: 

activityFrame <- character()
for (i in 1:30) {
  more_on <- c("liedown", "sit", "stand", "walk", "walkdownstairs", "walkupstairs")
  activityFrame <- c(activityFrame, more_on)
}

## Combine columns: 
tidy <- as.data.frame(tidyFrame)
tidy <- cbind(activityFrame, tidy)
tidy <- cbind(subjectFrame, tidy)

## Give final column names: 

names(tidy) <- names(bigData)
## I had to recover some lost work on the names and fix names of bigData.

## write to file: 
write.table(tidy, file = "tidy.csv", sep =",", row.names=FALSE, col.names=TRUE)

## end
