#Codebook#
##Data set summary##
This assignment uses a data set containing various quantitative measurements from a Samsung smartphone.  The corpus of data for this analysis included a total of 10,299 observations of 563 variables each.  These observations are partitioned int 7352 training observations and 2947 test observations (in support of training and testing a classifier).  For this assignment all of the training and testing data are to be merged together into one data set.

Each observation identifies the specific subject, the activity he or she was performing, and the values of 561 measurements from the smartphone he or she carried.

I downloaded the data set on May 18, 2014 at 6:04pm EDT.

### Citation: ###
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
##Feature descriptions##
These data were collected from 30 volunteers, ages 19-48.  Six different activities were measured while wearing a smartphone on the waist: Walking, Walking Up Stairs, Walking Down Stairs, Sitting, Standing, and Laying.  Measurements were captured from the phone’s accelerometer and gyroscope (linear acceleration and angular velocity along all three orthogonal axes).  These raw sensor data were processed with various filtering and windowing techniques (for more details see the “README” file in the “UCI_HAR_Dataset.zip” file at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

After processing, measurements were produced to capture the following (XYZ indicates 3 signals, in X, Y, and Z directions; some measurements are provided in both Time and Frequency domains):
-	body and gravity acceleration, XYZ
-	body gyroscopic, XYZ
-	body acceleration and gyroscopic jerk, XYZ
-	body and gravity acceleration magnitude
-	body and gravity acceleration and gyroscopic jerk magnitudes

The following were estimated from these signals:
-	mean
-	standard deviation
-	median absolute deviation
-	maximum
-	minimum
-	signal magnitude area
-	energy
-	inter-quartile range
-	entropy
-	autoregression coefficients
-	correlation across XYZ
-	max frequency component
-	weighted average of frequency components
-	skewness
-	kurtosis
-	energy of frequency interval w/in bins of FFT of each window
-	angle between vectors (compares gravity mean to body acceleration and gyroscopic measurements)

**All of the values above are floating point numbers**.

The data are packaged in a zip file, and when unpacked one can find data specific to measurements in the corresponding **test** or **train** folder, while common data files are in the main folder.

The measurements above are contained in *X_train.txt* and *X_test.txt* files.  The activities corresponding to the rows of measurements are found in *y_train.txt* and *y_test.txt*.  **These activities are coded as numbers**.  The subjects corresponding to the rows of measurements are in *subject_test.txt* and *subject_train.txt*.  **These subject numbers range from 1 to 30**.  The feature names for the columns of measurments are found in *features.txt*.  The *activity_labels.txt* file maps the activity number to an activity name as follows:<br/>
1.    WALKING<br/>
2.    WALKING_UPSTAIRS<br/>
3.    WALKING_DOWNSTAIRS<br/>
4.    SITTING<br/>
5.    STANDING<br/>
6.    LAYING<br/>


##Data transformations##
Several transformations were made on the data as follows:<br/>
- the special characters "()-," were stripped out of feature names to prevent problems with R naming conventions.<br/>
- a typo in some feature names was corrected.  Specifically, some names include the string "BodyBody" so that was corrected to "Body".<br/>
- activity was encoded as an integer but the corresponding column was encoded as a factor variable and level names were set per the mapping in the *activity_labels.txt* file.<br/>
- only the measurements relating to a mean or standard deviation were included in our data set, so only variables containing "mean" or "std" (case independent) were retained.  This resulted in 86 measurements.<br/>
- when creating the tidy data set the measurements were collapsed by subject/activity pair, with the resulting value being computed as the average of the corresponding measurements.  Since there are 30 subjects and 6 activities, the resulting tidy data set includes 180 observations.<br/>

I found the resulting variable names (abbreviated, using mixed case) to be very readable so I did not perform further transformations (inserting "." or converting to all lower case).

Following are the measurement variables that were ultimately retained after the processing mentioned above, broken down by category.<br/>
###Time domain body acceleration mean & std###
"tBodyAccmeanX"<br/>
"tBodyAccmeanY"<br/>
"tBodyAccmeanZ"<br/>
"tBodyAccstdX"<br/>
"tBodyAccstdY"<br/>
"tBodyAccstdZ"<br/>
###Time domain gravity acceleration mean & std###
"tGravityAccmeanX"<br/>
"tGravityAccmeanY"<br/>
"tGravityAccmeanZ"<br/>
"tGravityAccstdX"<br/>
"tGravityAccstdY"<br/>
"tGravityAccstdZ"<br/>
###Time domain body jerk acceleration mean & std###
"tBodyAccJerkmeanX"<br/>
"tBodyAccJerkmeanY"<br/>
"tBodyAccJerkmeanZ"<br/>
"tBodyAccJerkstdX"<br/>
"tBodyAccJerkstdY"<br/>
"tBodyAccJerkstdZ"<br/>
###Time domain body gyroscope mean & std###
"tBodyGyromeanX"<br/>
"tBodyGyromeanY"<br/>
"tBodyGyromeanZ"<br/>
"tBodyGyrostdX"<br/>
"tBodyGyrostdY"<br/>
"tBodyGyrostdZ"<br/>
###Time domain body jerk gyroscope mean & std###
"tBodyGyroJerkmeanX"<br/>
"tBodyGyroJerkmeanY"<br/>
"tBodyGyroJerkmeanZ"<br/>
"tBodyGyroJerkstdX"<br/>
"tBodyGyroJerkstdY"<br/>
"tBodyGyroJerkstdZ"<br/>
###Time domain body and gravity acceleration magnitude mean & std###
"tBodyAccMagmean"<br/>
"tBodyAccMagstd"<br/>
"tGravityAccMagmean"<br/>
"tGravityAccMagstd"<br/>
###Time domain body jerk acceleration magnitude mean & std###
"tBodyAccJerkMagmean"<br/>
"tBodyAccJerkMagstd"<br/>
###Time domain body gyroscope magnitude mean & std###
"tBodyGyroMagmean"<br/>
"tBodyGyroMagstd"<br/>
###Time domain body jerk gyroscope magnitude mean & std###
"tBodyGyroJerkMagmean"<br/>
"tBodyGyroJerkMagstd"<br/>
###The are frequency domain values corresponding to the previous time domain categries###
"fBodyAccmeanX"<br/>
"fBodyAccmeanY"<br/>
"fBodyAccmeanZ"<br/>
"fBodyAccstdX"<br/>
"fBodyAccstdY"<br/>
"fBodyAccstdZ"<br/>
"fBodyAccmeanFreqX"<br/>
"fBodyAccmeanFreqY"<br/>
"fBodyAccmeanFreqZ"<br/>
"fBodyAccJerkmeanX"<br/>
"fBodyAccJerkmeanY"<br/>
"fBodyAccJerkmeanZ"<br/>
"fBodyAccJerkstdX"<br/>
"fBodyAccJerkstdY"<br/>
"fBodyAccJerkstdZ"<br/>
"fBodyAccJerkmeanFreqX"<br/>
"fBodyAccJerkmeanFreqY"<br/>
"fBodyAccJerkmeanFreqZ"<br/>
"fBodyGyromeanX"<br/>
"fBodyGyromeanY"<br/>
"fBodyGyromeanZ"<br/>
"fBodyGyrostdX"<br/>
"fBodyGyrostdY"<br/>
"fBodyGyrostdZ"<br/>
"fBodyGyromeanFreqX"<br/>
"fBodyGyromeanFreqY"<br/>
"fBodyGyromeanFreqZ"<br/>
"fBodyAccMagmean"<br/>
"fBodyAccMagstd"<br/>
"fBodyAccMagmeanFreq"<br/>
"fBodyAccJerkMagmean"<br/>
"fBodyAccJerkMagstd"<br/>
"fBodyAccJerkMagmeanFreq"<br/>
"fBodyGyroMagmean"<br/>
"fBodyGyroMagstd"<br/>
"fBodyGyroMagmeanFreq"<br/>
"fBodyGyroJerkMagmean"<br/>
"fBodyGyroJerkMagstd"<br/>
###Frequency domain body jerk gyro magnitude mean frequency###
"fBodyGyroJerkMagmeanFreq"<br/>
###Time domain angle measurements on body: acceleration & gyroscope gravity and jerk gravity means###
"angletBodyAccMeangravity"<br/>
"angletBodyAccJerkMeangravityMean"<br/>
"angletBodyGyroMeangravityMean"<br/>
"angletBodyGyroJerkMeangravityMean"<br/>
###Angle gravity mean measurements###
"angleXgravityMean"<br/>
"angleYgravityMean"<br/>
"angleZgravityMean"<br/>
