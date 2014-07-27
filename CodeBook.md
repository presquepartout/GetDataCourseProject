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

- To each of the raw data sets, training and test, only the features that are means and standard deviations are selected. This is a subset of 66 variables out of 561.
- To each data set, two columns will be added for subjects and activities. 
- The data will be merged into a single data set. 
- The 66 variable names will be changed to follow tidy data set guidelines. 
- The activity column will be changed to descriptive factors to follow data set guidelines. 
- A second tidy data set will be created that has the averages of each variable per subject, per activity. 

The results of the analysis are in the file tidyset.txt. 

## Activity Names/Factor Levels

The activity ids 1:6 were converted to factors as follows: 

| id        | level           | 
| :-------: |:--------------------:| 
| 1      | walk | 
| 2      | walkupstairs   |   
| 3 | walkdownstairs   |
| 4     | sit | 
| 5      | stand   |   
| 6 | liedown      |

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

### List of Variable Names

| id        | Name           | Description |
| :----: |:--------------------|:-------------------------------------------| 
|1|xmove| linear acceleration in x direction, time measurement|
|2|ymove| linear acceleration in y direction, time measurement|
|3|zmove| linear acceleration in z direction, time measurement|
|4|stdxmove|standard deviation of linear acceleration in x direction, time measurement|
|5|stdymove|standard deviation of linear acceleration in y direction, time measurement|
|6|stdzmove|standard deviation of linear acceleration in z direction, time measurement|
|7|xgravity|acceleration due to gravity, x direction, mean time measurement |
|8|ygravity|acceleration due to gravity, y direction, mean time measurement |
|9|zgravity|acceleration due to gravity, z direction, mean time measurement |
|10|stdxgravity|standard deviation of acceleration due to gravity, x direction, time measurement |
|11|stdygravity|standard deviation of acceleration due to gravity, y direction, time measurement |
|12|stdzgravity|standard deviation of acceleration due to gravity, z direction, time measurement |
|13|xjerk|x direction jerk, time measurement |
|14|yjerk|y direction jerk, time measurement |
|15|zjerk|z direction jerk, time measurement |
|16|stdxjerk|standard deviation of x direction jerk, time measurement |
|17|stdyjerk|standard deviation of y direction jerk, time measurement |
|18|stdzjerk|standard deviation of z direction jerk, time measurement |
|19|xrotation|rotation, x direction, time measurement|
|20|yrotation|rotation, y direction, time measurement|
|21|zrotation|rotation, z direction, time measurement|
|22|stdxrotation|standard deviation of rotation, x direction, time measurement|
|23|stdyrotation|standard deviation of rotation, y direction, time measurement|
|24|stdzrotation|standard deviation of rotation, z direction, time measurement|
|25|xrotationjerk|rotational jerk, x direction, time measurement|
|26|yrotationjerk|rotational jerk, y direction, time measurement|
|27|zrotationjerk|rotational jerk, z direction, time measurement|
|28|stdxrotationjerk|standard deviation of rotational jerk, x direction, time measurement|
|29|stdyrotationjerk|standard deviation of rotational jerk, y direction, time measurement|
|30|stdzrotationjerk|standard deviation of rotational jerk, z direction, time measurement|
|31|movenorm|
|32|stdmovenorm|
|33|gravitynorm|
|34|stdgravitynorm|
|35|jerknorm|
|36|stdjerknorm|
|37|rotationnorm|
|38|stdrotationnorm|
|39|rotationjerknorm|
|40|stdrotationjerknorm|
|41|fxmove|
|42|fymove|
|43|fzmove|
|44|fstdxmove|standard deviation of linear acceleration, x direction, frequency transfer|
|45|fstdymove|standard deviation of linear acceleration, y direction, frequency transfer|
|46|fstdzmove|standard deviation of linear acceleration, z direction, frequency transfer|
|47|fxjerk|x direction jerk, frequency transfer|
|48|fyjerk|y direction jerk, frequency transfer|
|49|fzjerk|z direction jerk, frequency transfer|
|50|fstdxjerk|standard deviation of x direction jerk, frequency transfer|
|51|fstdyjerk|standard deviation of y direction jerk, frequency transfer|
|52|fstdzjerk|standard deviation of z direction jerk, frequency transfer|
|53|fxrotation|
|54|fyrotation|
|55|fzrotation|
|56|fstdxrotation|standard deviation of x rotation, frequency transfer|
|57|fstdyrotation|standard deviation of y rotation, frequency transfer|
|58|fstdzrotation|standard deviation of z rotation, frequency transfer|
|59|fmovenorm|magnitude of linear acceleration, frequency transfer|
|60|fstdmovenorm|standard deviation of magnitude of linear acceleration, frequency transfer|
|61|fnormjerk|magnitude of jerk, frequency transfer|
|62|fstdnormjerk|standard deviation of magnitude of jerk, frequency transfer|
|63|fnormbodyrotation| magnitude of body rotation, frequency transfer|
|64|fstdnormbodyrotation|standard deviation of magnitude of body rotation, frequency transfer|
|65|fnormangularjerk| magnitude of jerk rotation, frequency transfer|
|66|fstdnormangularjerk|standard deviation of magnitude of jerk rotation, frequency transfer|

