Code Book for Course Project
============================

This project processes data obtained from wearable computing devices. 
These devices measure a person's movements (accelerations, rotations, 
and so on) while the person does various activities. 

The code for this project selects specific features of interest from
the dataset, merges two large data files, and produces a table of 
summarized results: averages of data by subject and activity. 

### Description of Raw Data Files

The raw data is contained in two large files, a training set and a test set. The number of features is 561. Thirty percent of the observations are in the test set, and seventy percent in the training set.  

Additional files: 
- Subject numbers for each observation. The subjects are numbered from 1 through 30. 
- Activities performed for each observation. The activities are numbered from 1 through 6, as follows: 
      - 1 Walking
      - 2 Walking upstairs
      - 3 Walking downstairs
      - 4 Sitting
      - 5 Standing
      - 6 Lying down
- Feature labels, numbered from 1 to 561. 

The subject numbers and activities become columns in the merged dataset, as they correspond to observations. 
The feature labels are used to create the row of column headings in the merged dataset. 

## Analysis Plan

- To each of the raw data sets, training and test, two columns will be added for subjects and activities. 
- The data will be merged into a single data set. 
- The variable names will be changed to follow tidy data set guidelines. 
- The activity column will be changed to descriptive factors to follow data set guidelines. 
- A second tidy data set will be created that has the averages of each variable per subject, per activity. 

The results of the analysis are in the file tidyset.txt. 

## Activity Names/Factor Levels

1 - walk
2 - walkupstairs
3 - walkdownstairs
4 - sit
5 - stand
6 - liedown

## Variable Names

The raw data consists of electrical signals originally recorded by wearable computing devices. These signals are in response to test subject motions: linear moves, angular (rotational) moves, and impulse moves (jerks). The signals have been filtered to reduce noise, and time data have been Fourier transformed to the frequency domain. 

### Naming Categories

Two broad categories of data are time data and frequency data - all data is either time or frequency domain. 
Another two overall categories are means and standard deviations (std) - all data is either a mean or a standard deviation. Some variables are magnitudes calculated by euclidean norm. 

- if a variable name begins with f, it is frequency data; otherwise, it is time data
- if a variable is a standard deviation, it begins with std or fstd if it is a frequency; otherwise, it is a mean
- if a variable is a magnitude, its name contains "norm"
- linear acceleration variable names contain "move"
- angular velocity variable names contain "rotation"
- jerk movement variable names contain "jerk"
- gravity acceleration variables contain "gravity"
