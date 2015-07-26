# This is the code Book for the Analysed data
## Included in this code book is a description of the variables, the data, and the various transformation steps that I performed to clean up the data and analyse it.

###The downloaded data contained various documents. The documents used in creating the dataset for the analysis are:
#### train/X_train.txt: which contains the Training set data.
#### train/y_train.txt: which contains information about what type of activity was done
#### train/subject_train.txt: which specifies which subject carried out the activity
#### test/X_test.txt: which contains the Test set data.
#### test/y_test.txt: which contains information about what type of activity was done
#### test/subject_test.txt: which specifies which subject carried out the activity
#### features.txt: List of all features that were measured. More about the features is described below
#### activity_labels.txt: Links the class labels in the ‘y_test’ file and ‘y_train file’ with their activity name.
###In total, 30 people took part in this experiment. Note that 30% of them were in the test arm (test file) and 70% were in the train arm (train file) of the experiment.
#### features_info.txt: Shows information about the variables used on the feature vector and the information is shown below:
##### The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
##### Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
##### Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
##### These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
###### tBodyAcc-XYZ
###### tGravityAcc-XYZ
###### tBodyAccJerk-XYZ
###### tBodyGyro-XYZ
###### tBodyGyroJerk-XYZ
###### tBodyAccMag
###### tGravityAccMag
###### tBodyAccJerkMag
###### tBodyGyroMag
###### tBodyGyroJerkMag
###### fBodyAcc-XYZ
###### fBodyAccJerk-XYZ
###### fBodyGyro-XYZ
###### fBodyAccMag
###### fBodyAccJerkMag
###### fBodyGyroMag
###### fBodyGyroJerkMag
#####The set of variables that were estimated from these signals are:
###### mean(): Mean value
###### std(): Standard deviation
###### mad(): Median absolute deviation 
###### max(): Largest value in array
###### min(): Smallest value in array
###### sma(): Signal magnitude area
###### energy(): Energy measure. Sum of the squares divided by the number of values. 
###### iqr(): Interquartile range 
###### entropy(): Signal entropy
###### arCoeff(): Autorregresion coefficients with Burg order equal to 4
###### correlation(): correlation coefficient between two signals
###### maxInds(): index of the frequency component with largest magnitude
###### meanFreq(): Weighted average of the frequency components to obtain a mean frequency
###### skewness(): skewness of the frequency domain signal 
###### kurtosis(): kurtosis of the frequency domain signal 
###### bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
###### angle(): Angle between to vectors.
#####Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
###### gravityMean
###### tBodyAccMean
###### tBodyAccJerkMean
###### tBodyGyroMean
###### tBodyGyroJerkMean
###Analysis
#### The goal of this analysis was to get the mean of the various features by activity and subject.
#####The first step was to read all the 8 documents described above in the downloaded file into R. R version 3.2.1 (2015-06-18) running on a Windows vista platform was used for all the analysis. The read.table function was used to read all the files.
##### I started by reading the ‘test/X_test.txt’, the ‘test/y_test.txt’ and the ‘test/subject_test.txt’ files.
##### I then read the ‘features.txt’ file into R. The contents are in two columns and 561 rows. I then transpose it so that it can be in the oreder I need for it to be used as column headers. Since the data contains 2 rows, I subset to get only the row I need.
##### I then rename the ‘test/X_test’ data using this transposed and sub-setted data. I also re-name the column of the ‘test/y_test’ data to Activities and the ‘test/subject_test’ data to Subject.
##### After re-naming, I concatenate the data together to get one data set for the individuals in the test arm
#### I followed the same steps as described above for the ‘train/X_train’, the ‘train/y_train’ and the ‘train/subject_train’ data.
#### Now that I have the test and train arm data in one dataset each, I create one dataset containing all 30 participants by concatenating the data from the 2 separate files together.
#### I then find which columns contain the mean and std of various measurements using the grep command. Columns that contains content such as ” fBodyAcc-meanFreq()-X” are not included in the search because they are weighted average of the frequency components to obtain a mean frequency and not the mean of activities carried.
#### Armed with this information, I create a subset from the complete dataset of the subject column, the activity column and the columns that contain the mean and std of the measurements.
#### I re-name the data Activity column in the new column ‘Action’ I created with their descriptive names
#### The last step I carried out in the analysis is to calculate the averages of the various features by subject and Activity
#### I then write out into a dataset the results of the analysis.
#### The 66 features included in the analysis are: 
1.		tBodyAcc-mean()-X
2.		tBodyAcc-mean()-Y
3.		tBodyAcc-mean()-Z
4.		tBodyAcc-std()-X
5.		tBodyAcc-std()-Y
6.		tBodyAcc-std()-Z
7.		tGravityAcc-mean()-X
8.		tGravityAcc-mean()-Y
9.		tGravityAcc-mean()-Z
10.		tGravityAcc-std()-X
11.		tGravityAcc-std()-Y
12.		tGravityAcc-std()-Z
13.		tBodyAccJerk-mean()-X
14.		tBodyAccJerk-mean()-Y
15.		tBodyAccJerk-mean()-Z
16.		tBodyAccJerk-std()-X
17.		tBodyAccJerk-std()-Y
18.		tBodyAccJerk-std()-Z
19.		tBodyGyro-mean()-X
20.		tBodyGyro-mean()-Y
21.		tBodyGyro-mean()-Z
22.		tBodyGyro-std()-X
23.		tBodyGyro-std()-Y
24.		tBodyGyro-std()-Z
25.		tBodyGyroJerk-mean()-X
26.		tBodyGyroJerk-mean()-Y
27.		tBodyGyroJerk-mean()-Z
28.		tBodyGyroJerk-std()-X
29.		tBodyGyroJerk-std()-Y
30.		tBodyGyroJerk-std()-Z
31.		tBodyAccMag-mean()
32.		tBodyAccMag-std()
33.		tGravityAccMag-mean()
34.		tGravityAccMag-std()
35.		tBodyAccJerkMag-mean()
36.		tBodyAccJerkMag-std()
37.		tBodyGyroMag-mean()
38.		tBodyGyroMag-std()
39.		tBodyGyroJerkMag-mean()
40.		tBodyGyroJerkMag-std()
41.		fBodyAcc-mean()-X
42.		fBodyAcc-mean()-Y
43.		fBodyAcc-mean()-Z
44.		fBodyAcc-std()-X
45.		fBodyAcc-std()-Y
46.		fBodyAcc-std()-Z
47.		fBodyAccJerk-mean()-X
48.		fBodyAccJerk-mean()-Y
49.		fBodyAccJerk-mean()-Z
50.		fBodyAccJerk-std()-X
51.		fBodyAccJerk-std()-Y
52.		fBodyAccJerk-std()-Z
53.		fBodyGyro-mean()-X
54.		fBodyGyro-mean()-Y
55.		fBodyGyro-mean()-Z
56.		fBodyGyro-std()-X
57.		fBodyGyro-std()-Y
58.		fBodyGyro-std()-Z
59.		fBodyAccMag-mean()
60.		fBodyAccMag-std()
61.		fBodyBodyAccJerkMag-mean()
62.		fBodyBodyAccJerkMag-std()
63.		fBodyBodyGyroMag-mean()
64.		fBodyBodyGyroMag-std()
65.		fBodyBodyGyroJerkMag-mean()
66.		fBodyBodyGyroJerkMag-std()
