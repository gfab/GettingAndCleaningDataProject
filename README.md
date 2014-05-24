# Getting and Cleaning Data Project #
## Project Summary ##
The goal of this project is to load, process, and clean up a data set using techniques learned via the video lectures, quizzes, and independent learning.  The ultimate output of this project is documentation and a tidy data set.

## Data ##
Data for this project come from the University of California, Irvine Machine Learning Repository.  This repository was created to facilitate the study of Human Activity Recognition using smartphone data.

A complete description of the data can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

I downloaded the data set on May 18, 2014 at 6:04pm EDT.

### Citation: ###
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## Input/Output ##
The results of this analysis can be reproduced by loading the original dataset and running the analysis script as described below.  In order for this to work properly the original dataset must be loaded and unpacked.  This may be done by downloading the zip file located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  Once downloaded the file must be unzipped, which will create a folder called "UCI HAR Dataset."  The analysis script will run properly as long as this data folder is in the same directory as the script.

The analysis script will create a file called "tidy.txt" which contains a tidy data set containing the average values per subject/activity combination.  This file may be read into a variable called **tidy** in R using the R command **tidy<-read.table("tidy.txt")**.  

## Analysis Script ##
There is a single analysis script, run_analysis.R, that reads the data, performs data transformation, and creates the output file containing the tidy data set.

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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*subject_test.txt*<br/>

The analysis script uses the appropriate relative pathnames to reference the data files.  However, for brevity,  only the base file names are referenced in the description below.

