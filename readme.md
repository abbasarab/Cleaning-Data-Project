# Reading and Cleaning Data Project
Data for this project has come from an experiment in which 30 volenteers participated. 
Each of these participants did all of the following practices while wearing a smartphone on their waist:
Markup : *Walking
         *Walking Upstairs
         *Walking Downstairs
         *Sitting
         *Standing
         *Laying
Using the embedded accelerometer and gyroscope in the smartphone 3-axial linear acceleration and
3-axial angular velocity have been captured. 
After some pre-processing of signal, a vector of variables has been provided in both time domain and
frequency domain. The overall data was separated in two data sets: train dtaset containg 70% of 
data, and test data containing the remaining 30% of data. Each observation (each row of the dataset)
was performed by a specific participant. The pracice code that participant was performing and participant
ID for each observation was provided in two seperate files. Name of variables (column labels) was also
provided in a separate file. In order to analyze the data and fulfill the requirements of this project
following steps were taken:

# Reading the test and train data set and labeling the columns and merging them together
Using read.csv() command with sep = "", both datasets were read in two seperate dataframes. Name of measurements
were assigned as col.names while reading the test and train data sets. For each of 
test and train dataset participant ID and the practice the participant performaing for each observation 
were read to two sepearte columns named subjectID and activity respectively. Next step was to put together 
train and test datasets and their corresponding subjectID and activity, I accomplished this step using cbind() command.
Now that I hade two dataframe for test and train datasets, I had to merge them together to form a single dataframe.
I performed this task by using rbind() command. 

# Selecting the fetures that are mean and standard deviation values
Using select() command and contains() verb in dplyr package, I decided to choose the features that contain either 
"mean()" or "std()" in their labels. I have also selected subjectID and activity features along them.

# Making labels neater
While reading the feature labels into a vector, all special characters (non alphanumeric) were converted to dots.
I replaced these unintended dots with a single dot using gsub() command to make the feture labels neater. I have 
removed single dots at the end of the feature names.

# Mapping descriptive activity labels to their corresponding code
Note that activities in our current dataframe have been coded using an integer from 1 to 6, each of which corresponds
to one unique activeity listed before. Using mapvalues() command from plyr package, I replaced each code to its
corresponding activity label (e.g. Walking, Standing, etc.).

# Grouping the data by subjectID and activity and taking mean of each variable
Using group_by() and summarize commands from dplyr package I grouped the data for each unique subjectID/activity pair
and took mean of each variable and stord the result to a new dataframe.

# Modifying feture labels in the new dataframe
Remember that by grouping and applying a function to each column of our dataframe, their labels remains as before.
It means that values of our features are now average value for each subject and activity but the labels are still 
showing the original measured parameters. To resolve this confusion I have pasted "mean_" string to the beginning
of all feature labels except subjectID and activity labels.

# Writing the data to a txt file
I wrote the resulting data to a txt file using write.table() command. Feature labels are included so one must
specify header = TRUE when reading it. The values are seperated by a single space. 
