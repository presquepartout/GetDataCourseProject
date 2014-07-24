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
