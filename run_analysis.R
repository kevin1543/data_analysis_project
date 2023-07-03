library(stringr)

# get features / mean and standard deviation indices
features <- read.table("features.txt", col.names = c("feature_number","feature"), header = F)
mean_and_std_indices <- grep("mean()|std()|meanFreq()", features$feature)
feature_names <- sapply(mean_and_std_indices, function(x) {features[features$feature_number == x, 2]})
# remove parenthesis from column names and replace - by _
feature_names <- gsub("[()]","", feature_names)
feature_names <- gsub("-","_", feature_names)


# get test set with appropriate column names
subject_test <- read.table("test/subject_test.txt", col.names = c("subject"))
y_test <- read.table("test/y_test.txt", col.names = c("activity"))
x_test <- read.table("test/X_test.txt")[,mean_and_std_indices]
colnames(x_test) <- feature_names
data_test <- cbind(subject_test, y_test, x_test)

# get train set with appropriate column names
subject_train <- read.table("train/subject_train.txt", col.names = c("subject"))
x_train <- read.table("train/X_train.txt")[,mean_and_std_indices]
y_train <- read.table("train/y_train.txt", col.names = c("activity"))
colnames(x_train) <- feature_names
data_train <- cbind(subject_train, y_train, x_train)

# merge data
data_set <- rbind(data_train, data_test)

# rename activity using activity labels
activity_labels <- read.table("activity_labels.txt", col.names = c("activity_number", "activity_label"))
data_set$activity <- sapply(data_set$activity, function(x) {(activity_labels[activity_labels$activity_number == x,2])})

# rename the subject varaibles to be more clear
data_set$subject <- sapply(data_set$subject, function(x) paste0("volunteer_",x))

library(dplyr)
summriezed_table <- summarize(group_by(data_set,subject,activity),across(1:(ncol(data_set)-2), mean))
average_table_by_groups <- data.frame(summriezed_table)
colnames(average_table_by_groups) <- c("subject", "activity", sapply(feature_names, function(x) paste0("mean_of_", x)))

#save tables
write.table(data_set, "data_set.txt", row.names = F)
write.table(average_table_by_groups, "average_table_by_groups.txt", row.names = F)
write.csv(data_set, "data_set.csv", row.names = FALSE)
write.csv(average_table_by_groups, "average_table_by_groups.csv", row.names = FALSE)

