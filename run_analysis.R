## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Install required packages
if (!require("data.table")) {
  install.packages("data.table")
}
require("data.table")

if (!require("reshape2")) {
  install.packages("reshape2")
}
require("reshape2")

# Load: activity_labels and features names
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Q2: Extracts only the measurements on the mean and standard deviation for each measurement.
extract_meanStd <- grepl("mean|std", features)

# Load test&train data (X_test, y_test data, subject_test, X_train, y_train, subject_train)
##Test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
names(X_test) = features
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
##Train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
names(X_train) = features
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Load test and train labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("activity", "activity_Name")
names(subject_test) = "subject"
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("activity", "activity_Name")
names(subject_train) = "subject"

# Bind data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Extract only the measurements on the mean and standard deviation for each measurement.
X_train = X_train[,extract_meanStd]
X_test = X_test[,extract_meanStd]

# Merge data
data = rbind(test_data, train_data)
ids   = c("subject", "activity", "activity_Name")
datas = setdiff(colnames(data), ids)
melts      = melt(data, id = ids, measure.vars = datas)

# Last step -> Create & write tidy as CSV
tidy = dcast(melts, subject + activity_Name ~ variable, mean)
write.table(tidy, file = "./tidy.txt", row.name=FALSE)
