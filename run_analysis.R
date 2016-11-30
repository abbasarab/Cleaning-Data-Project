library(dplyr)
library(plyr)

feature_names <- read.csv("C://Users/Abbas/Desktop/data/features.txt",
                          header = FALSE,
                          sep = "",
                          colClasses = "character",
                          check.names = FALSE)
test_data <- read.csv("C://Users/Abbas/Desktop/data/test/X_test.txt",
                      header = FALSE,
                      sep = "",
                      col.names = feature_names[,2])
test_label <- read.csv("C://Users/Abbas/Desktop/data/test/y_test.txt", 
                       header = FALSE,
                       sep = "",
                       col.names = "activity")
subject_test <- read.csv("C://Users/Abbas/Desktop/data/test/subject_test.txt",
                          header = FALSE,
                          sep = "",
                          col.names = "subjectID")
test_data <- cbind(test_data, test_label, subject_test)
train_data <- read.csv("C://Users/Abbas/Desktop/data/train/X_train.txt",
                       header = FALSE,
                       sep = "",
                       col.names = feature_names[,2])
train_label <- read.csv("C://Users/ANA12/Desktop/data/train/y_train.txt",
                        header = FALSE,
                        sep = "",
                        col.names = "activity")
subject_train <- read.csv("C://Users/Abbas/Desktop/data/train/subject_train.txt",
                          header = FALSE,
                          sep = "",
                          col.names = "subjectID")
train_data <- cbind(train_data, train_label, subject_train)

my_data <- rbind(test_data, train_data)
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

my_data <- my_data %>%
  tbl_df() %>%
  group_by(subjectID, activity) %>%
  summarize_each(funs(mean))

colnames(my_data) <- c(names(my_data)[1:2], 
                       sapply("mean_", paste, names(my_data)[-(1:2)], collapse = ""))
