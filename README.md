# Getting and Cleaning Data Project #
## Project Summary ##
The goal of this project is to load, process, and clean up a data set using techniques learned via the video lectures, quizzes, and independent learning.  The ultimate output of this project is documentation and a tidy data set.  Specifically, the github repository for this project contains the following files:<br/>
- README.md: a description of the project<br/>
- codebook.md: a description of the data set used and the resulting tidy data set<br/>
- run_analysis.R: an R script that processes the raw data and creates the appropriate tidy data output<br/>
- tidy.txt: the tidy data set that is created by run_analysis.R
- picture.pdf: a diagram showing how the data are assembled into a data frame that is used to generate the tidy data set<br/>

## Data ##
Data for this project come from the University of California, Irvine Machine Learning Repository.  This repository was created to facilitate the study of Human Activity Recognition using smartphone data.

I created a codebook that describes the variables used for this project.  This codebook is in the github repository at https://github.com/gfab/GettingAndCleaningDataProject/blob/master/codebook.md.

A complete description of the data can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

I downloaded the data set on May 18, 2014 at 6:04pm EDT.

### Citation: ###
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## Input/Output ##
The results of this analysis can be reproduced by loading the original dataset and running the analysis script as described below.  In order for this to work properly the original dataset must be loaded and unpacked.  This may be done by downloading the zip file located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  Once downloaded the file must be unzipped, which will create a folder called "UCI HAR Dataset."  The analysis script will run properly as long as this data folder is in the folder from which the script is run.

The analysis script will create a file called "tidy.txt" which contains a tidy data set containing the average values per subject/activity combination.  This file may be read into a variable called **tidy** in R using the R command **tidy<-read.table("tidy.txt")**.

The output tidy data file is [here](https://github.com/gfab/GettingAndCleaningDataProject/blob/master/tidy.txt).  

## Analysis Script ##
There is a single analysis script, run_analysis.R, that reads the data, performs data transformation, and creates the output file containing the tidy data set.  The script is [here](https://github.com/gfab/GettingAndCleaningDataProject/blob/master/run_analysis.R).

The data set is composed of several data files spread across several folders.  Following are the pertinent input files and folder structure used in the analysis.  Folder names are  **bold** and data files are  *italic*.

**UCI HAR Dataset**<br/>
&nbsp;&nbsp;&nbsp;&nbsp;*activity_labels.txt*<br/>
&nbsp;&nbsp;&nbsp;&nbsp;*features.txt*<br/>
&nbsp;&nbsp;&nbsp;&nbsp;**test** <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*X_test.txt*<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*y_test.txt*<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*subject_test.txt*<br/>
&nbsp;&nbsp;&nbsp;&nbsp;**train** <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*X_train.txt*<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*y_train.txt*<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*subject_train.txt*<br/>

The analysis script uses the appropriate relative pathnames to reference the data files.  However, for brevity,  only the base file names are referenced in the description below.

The overall goals in creating the tidy data set are as follows:<br/>
1. combine the various pieces of the data set into a data frame<br/>
2. filter out measurements except those that relate to a mean or standard deviation of a measurement<br/>
3. label activity values with descriptive names (instead of numeric values use in raw data)<br/>
4. use descriptive column names for the various measurements<br/>
5. create a tidy data set that contains average values for each combination of subject and activity<br/>

Following are decisions I made when performing the analysis and creating the tidy data set:
- I included all measurements that are a mean or standard deviation computation from any source data measurement.  For example, I included the "angle" means and not just the base mean computations on the accelerometer and gyroscope measurements.  This will allow users of this dataset maximum flexibility in deciding which means and standard deviations to analyse.  See the codebook for more details.<br/>
- column names were derived from the features names by 1) stripping out "()-," characters and 2) getting rid of the typo in names containing "BodyBody" (this string is replaced by "Body")

Raw data measurements from the smartphone are contained in the *X_train.txt* and *X_test.txt* files.  *features.txt* contains column numbers and names for the data in the *X_train.txt* and *X_test.txt* files.  *y_train.txt* and *y_test.txt* contain the activity number for each row of the corresponding *X_train.txt* and *X_test.txt* measurement.  *activity_labels.txt* maps activity number to activity name.  *subject_train.txt* and *subject_text.txt* indicate what subject provided each row of measurements in *X_train.txt* and *X_test.txt*.  Subject numbers range from 1-30.

Following is a picture that illustrates how the initial data frame is created from the data in these files: https://github.com/gfab/GettingAndCleaningDataProject/blob/master/picture.pdf.

The flow of the script is as follows:<br/>
1. read in the list of feature names, strip out invalid characters and remove the duplicate "Body" text<br/>
2. generate a list of features to keep by searching for "mean" or "std" in the feature names (ignoring case)<br/>
3. read in X_train and X_test data, bind together the rows (only the columns to be kept), and assign corresponding feature names as column names in this data frame<br/>
4. read the activity values from y_train and y_test, bind these rows together, and set the column name to "activity"<br/>
5. read the activity labels from the second column of *activity.txt* and then assign those as the labels for the "activity" column, which is a factor variable<br/>
6. read the subject values from subject_train and subject_test, bind these rows together, and set the column name to "subject"<br/>
7. bind together the subject, activity, and measurement data frame columns - this is the initial data frame<br/>
8. create a data frame of tidy data by using the aggregate function to compute averages of the measurement columns, by subject and activity<br/>
9. write the tidy data frame to a file called *tidy.txt* using the **write.table** function<br/>
