## Code Book

This code book describes all the variables and summaries calculated, along with units, and any other relevant information.

### Details

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### Description of files

* `features.txt`: List of all features.
* `activity_labels.txt`: Links the class labels with their activity name.
* `X_train.txt`: Training set.
* `subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* `y_train.txt`: Training labels.
* `X_test.txt`: Test set.
* `subject_test.txt`: 2947 rows. Each row identifies the subject who performed the activity for each window sample. Its range is from 2 to 24.
* `y_test.txt`: Test labels.

### Notes: 

1. The packages data.table and reshape2 are required
2. We load the related data using read.table
3. Using grpl we extract the measurements on the mean and standard deviation for each measurement
4. We load the test and train labels and then we bind the data using cbind
5. We merge the data and write the tidy file as CSV