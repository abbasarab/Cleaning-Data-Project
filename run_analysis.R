#loading the required libraries for this analysis, dplyr package is included to perform select
# and group_by operations and plyr package is included to perform mapvalues.
##############################################################################################
library(dplyr)
library(plyr)
##############################################################################################
#reading feature labels as characters from features.txt file
##############################################################################################
feature_names <- read.csv("features.txt",
                          header = FALSE,
                          sep = "",
                          colClasses = "character",
                          check.names = FALSE)
#############################################################################################
#this block of code does four following steps for both train and test data sets:
# 1) read test(train) dataset from X_test(train).txt file and assign column names as feature_names 
#    as already read in previous line of code.
# 2) read test(train) labels from y_test(train).txt file and names that columns as activity.
# 3) read subject ID from subject_test(train).txt file and names that column as subjectID.
# 4) cbind test(train) dataset with test(train) label and subject ID together to form a complete
#    data set for both train and test which includes the data for each of them and also dubject ID
#    and practice ID (which is walking, laying, etc.) 
#############################################################################################
test_data <- read.csv("test/X_test.txt",
                      header = FALSE,
                      sep = "",
                      col.names = feature_names[,2])
test_label <- read.csv("test/y_test.txt", 
                       header = FALSE,
                       sep = "",
                       col.names = "activity")
subject_test <- read.csv("test/subject_test.txt",
                          header = FALSE,
                          sep = "",
                          col.names = "subjectID")
test_data <- cbind(test_data, test_label, subject_test)
train_data <- read.csv("train/X_train.txt",
                       header = FALSE,
                       sep = "",
                       col.names = feature_names[,2])
train_label <- read.csv("train/y_train.txt",
                        header = FALSE,
                        sep = "",
                        col.names = "activity")
subject_train <- read.csv("train/subject_train.txt",
                          header = FALSE,
                          sep = "",
                          col.names = "subjectID")
train_data <- cbind(train_data, train_label, subject_train)
##########################################################################################
#The following command put train and test data set together row-wise (with rbind)
##########################################################################################
my_data <- rbind(test_data, train_data)
##########################################################################################
#I have decided that instruction meant to just include variables that have mean() and std()
#at the end of variable names.
#So, the foloowing block of code first choose columns that have these two strings in their label
#with "contains" and also it selects SubjectID and activity columns. After that I replace "..." in 
#middle of column labels and "." at the end of the labels using gsub ommand to make the labels tidier.
#And at the end I map activity descriptive names to their idenitifiers using mapvalues from plyr package.
###########################################################################################
my_data <- select(my_data, contains(".mean.."), 
                  contains(".std.."),
                  activity, subjectID)
colnames(my_data) <- gsub(pattern = "...", replacement = ".",
                          x = names(my_data), fixed = TRUE)
colnames(my_data) <- gsub(pattern = "..", replacement = "",
                          x = names(my_data), fixed = TRUE)

my_data$activity <- mapvalues(my_data$activity, from = c(1:6),
                              to = c("walking", "walking_upstrs", "walking_dwnstrs",
                                     "sitting", "standing", "laying"))
###########################################################################################
#This last block of code does the following:
# 1) using group_by method from dplyr package it groups the data for each unique subjectID/activity
#    combination and apply mean() function to take mean from each of those unique groups.The results 
#    will be stored in my_avg_data dataframe.
# 2) Only this remains is to rename the column labels to notify that values are average value of each
#    group. To adres this issue I just paste "mean_" to the begining of each label except userID and 
#    activity labels. I did this using sapply.
###########################################################################################
my_avg_data <- my_data %>%
  tbl_df() %>%
  group_by(subjectID, activity) %>%
  summarize_each(funs(mean))

colnames(my_avg_data) <- c(names(my_avg_data)[1:2], 
                       sapply("mean_", paste, names(my_avg_data)[-(1:2)]))
##########################################################################################
write.table(my_avg_data, "C://Users/Abbas/Desktop/data/my_final_dataset.txt",
            sep = " ",
            eol = "\r\n",
            col.names = TRUE, 
            row.names = FALSE)
