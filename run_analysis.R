library(dplyr)

# Read metadata
activity_labels <- read.table('data/activity_labels.txt', col.names = c('id', 'activity'))
features <- read.table('data/features.txt', col.names = c('id', 'feature'))

# Read actual data
subject_test <- read.table('data/test/subject_test.txt')
x_test <- read.table('data/test/X_test.txt')
y_test <- read.table('data/test/Y_test.txt', colClasses = c("factor"))

subject_train <- read.table('data/train/subject_train.txt')
x_train <- read.table('data/train/x_train.txt')
y_train <- read.table('data/train/y_train.txt', colClasses = c("factor"))

# Merge test and training data and clean up unused variables
subject <- rbind(subject_train, subject_test)
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
rm(subject_train, subject_test, x_train, x_test, y_train, y_test)

# Get mean and stddev measurements, and rename the columns and activities
features_wanted <- grepl('(mean\\(\\)|std\\(\\))', features$feature)
x <- x[,features_wanted]
colnames(x) <- features$feature[features_wanted]

colnames(subject) <- c('subject')

colnames(y) <- c('activity')
levels(y$activity) <- activity_labels$activity

# Merge it all together and clean up the unused variables
data_clean <- data.frame(subject, y, x)
rm(features, subject, x ,y)

# Create 2nd data set with avg grouped by subject+activity
data_grp_summary <- group_by(data, subject, activity) %>% summarise_all(mean)

write.table(data_clean, "data_clean.txt", row.names = FALSE)
write.table(data_grp_summary, "data_grp_summary.txt", row.names = FALSE)
