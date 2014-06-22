# Generate tidy data set for activity analysis

# Pull in the names of the features and activities
features = read.table('features.txt', col.names = c('ID', 'FeatureName'))
activities = read.table('activity_labels.txt', col.names = c('activityID', 'ActivityName'))

# Test data
test = read.table('test/X_test.txt', col.names = features$FeatureName)
test$activityID = read.table('test/Y_test.txt')$V1
test$subjectID = read.table('test/subject_test.txt')$V1

# Training data
train = read.table('train/X_train.txt', col.names = features$FeatureName)
train$activityID = read.table('train/Y_train.txt')$V1
train$subjectID = read.table('train/subject_train.txt')$V1

## Combine the data
combined = rbind(test, train)

# Extract only mean and std deviation columns, plus activity/subject IDs
meanstdcolumns = grep('-mean\\(\\)|-std\\(\\)', features$FeatureName)
extracted = combined[,c(meanstdcolumns, 562, 563)]

# Pull in activity names by activityID
merged = merge(extracted, activities)

# Group by activity name and subject ID and write out
grouped = aggregate(merged[2:67], list(merged$ActivityName, merged$subjectID), mean)
colnames(grouped)[1] = 'ActivityName'
colnames(grouped)[2] = 'SubjectID'
write.table(grouped, 'results.txt', row.names = FALSE)

