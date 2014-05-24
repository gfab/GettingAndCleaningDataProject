# read features.txt and clean up column names
features<-read.table("UCI HAR Dataset/features.txt")[,2]
features<-gsub('\\(|\\)|\\-|\\,', "", features, perl=TRUE)
features<-gsub("BodyBody", "Body", features, perl=TRUE)
# generate list of columns to keep (those representing a mean or std)
keep<-grep("mean|std", ignore.case=TRUE, features)

# read training/test measurements, bind together, and label columns
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
X<-rbind(X_train[,keep], X_test[,keep], deparse.level=0)
colnames(X)<-features[keep]

# read activity for training/test data, bind together, and label column
activity_train<-read.table("UCI HAR Dataset/train/y_train.txt",
    colClasses="factor")
activity_test<-read.table("UCI HAR Dataset/test/y_test.txt",
    colClasses="factor")
activity<-rbind(activity_train, activity_test, deparse.level=0)
colnames(activity)<-"activity"

# use meaningful names for activity levels (second column, in order)
labels<-read.table("UCI HAR Dataset/activity_labels.txt")[,2]
levels(activity$activity)<-labels

# read subjects for training/test data, bind together, and label column
subjects_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
subjects_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
subjects<-rbind(subjects_train, subjects_test, deparse.level=0)
colnames(subjects)<-"subject"

# merge subjects, activity, and measurement columns together
ALL<-cbind(subjects, activity, X)

# create new tidy data frame with averages by subject and activity
TIDY<-aggregate(. ~ subject + activity, ALL,
    function(x) c(mean=mean(x)))

# write tidy data frame to a file
write.table(TIDY, file="tidy.txt")