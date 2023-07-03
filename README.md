## Project Folder Contents

- `README.md`
- `run_analysis.R`: An R script that cleans the provided data and transforms it into tidy data.
- `data_set.csv`: Tidy dataset containing combined data from the test and train sets, with measurements on mean and standard deviation.
- `average_table_by_groups.csv`: Tidy dataset with the average of each variable for each activity and subject.
- `README.txt`
- `CodeBook.md`: Code book providing information about the variables in `data_set.csv`.
- `features_info.txt`: Information about the variables used in the feature vector.
- `features.txt`: List of all features.
- `activity_labels.txt`: Mapping of class labels to their corresponding activity names.

## Train and Test Data Files

The following files are available for both the train and test data, with equivalent descriptions:

- `train/X_train.txt`: Training set.
- `train/y_train.txt`: Training labels.
- `test/X_test.txt`: Test set.
- `test/y_test.txt`: Test labels.
- `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample, with subject IDs ranging from 1 to 30.
- `train/Inertial Signals/total_acc_x_train.txt`: Acceleration signal from the smartphone accelerometer's X axis in standard gravity units 'g'. Each row represents a 128-element vector. Similar files exist for the Y and Z axes: `total_acc_y_train.txt` and `total_acc_z_train.txt`.
- `train/Inertial Signals/body_acc_x_train.txt`: Body acceleration signal obtained by subtracting the gravity from the total acceleration.
- `train/Inertial Signals/body_gyro_x_train.txt`: Angular velocity vector measured by the gyroscope for each window sample, in radians/second.

## Note

To successfully run the `run_analysis.R` script, ensure that you have downloaded the required packages as mentioned in the instructions or README file.

## The 'run_analysis' Script

The `run_analysis` script performs the following steps:

1. Reads the training and test data.
2. Combines the two data tables.
3. Replaces the subject and action columns with more descriptive variables.
4. Creates a new dataset containing the average of each variable for each activity and subject.
5. Saves both the combined dataset and the average dataset as CSV files.

