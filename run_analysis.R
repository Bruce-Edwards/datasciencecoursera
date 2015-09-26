# Loading of packages needed for the analysis/Step 1
library(dplyr)
library(tidyr)

# creation of test variables/Step 2
x_test <- tbl_df(read.table("UCI HAR Dataset/test/X_test.txt"))
y_test <- tbl_df(read.table("UCI HAR Dataset/test/Y_test.txt"))
subject_test <- tbl_df(read.table("UCI HAR Dataset/test/subject_test.txt"))

# creation of train variables/Step 2
x_train <- tbl_df(read.table("UCI HAR Dataset/train/X_train.txt"))
y_train <- tbl_df(read.table("UCI HAR Dataset/train/Y_train.txt"))
subject_train <- tbl_df(read.table("UCI HAR Dataset/train/subject_train.txt"))

# formatting of dataset/Step 3 and Step 4
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
var_label <- read.table("UCI HAR Dataset/features.txt")
colnames(x_test) <- var_label$V2
colnames(x_train) <- var_label$V2
y_test <- rename(y_test, Activity = V1)
y_train <- rename(y_train, Activity = V1)
subject_test <- rename(subject_test, Subject_ID = V1)
subject_train <- rename(subject_train, Subject_ID = V1)

# merging of all sub-datasets in one global dataset/ Step 5
test <- tbl_df(cbind(y_test, x_test))
test <- tbl_df(cbind(subject_test,test))
train <- tbl_df(cbind(y_train, x_train))
train <- tbl_df(cbind(subject_train,train))
total <- tbl_df(rbind(train, test))
subset <- tbl_df(total[, grep("Subject_ID|Activity|mean|std", names(total))])

# variable names redefinition/ Step 6
label1 <- names(subset)
label2 <- sub("Acc","Accelerometer", label1)
label3 <- sub("mean","Mean", label2)
label4 <- sub("std", "StandardDeviation", label3)
label5 <- gsub("-","", label4)
label6 <- sub("Gyro","Gyroscope", label5)
label7 <- sub("\\(\\)","", label6)
label8 <- sub("Mag","Magnitude", label7)
label9 <- sub("tBody","TimeBody", label8)
label10 <- sub("f","Frequency", label9)
label11 <- sub("tGravity","TimeGravity", label10)
colnames(subset) <- label11

# removal of temporary variable to make space/ Step 7
rm("x_test")
rm("y_test")
rm("x_train")
rm("y_train")
rm("subject_test")
rm("subject_train")
rm("train")
rm("test")
rm("total")

# Replacement of activity codes by labels/Step 8
mutate(subset, Activity = activity$V2[Activity])

# Creation of the end result and export of the tidy data in a text file/Step 9 
result <- select(tbl_df(aggregate(subset,list(subset$Subject, subset$Activity), mean)),
                 -contains("Group"))

# Export of the tidy data/ Step 10
write.table(result, file="GetDataProject.txt", row.name=FALSE)

