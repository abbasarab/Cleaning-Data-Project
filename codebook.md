### Explaining the data

Data provided for this project has been taken from an experiment in which 30 volenteers participated. Each of these
participants perfomed all of the activities provided in activity_label.txt file several times. Note that each 
activity in activity_label.txt file has assigned an integer code. Participants were wearing a smartphone on their 
waiste while performing these activities. Using built-in accelerometer and gyroscome in the smartphone, 3-axial linear
acceleration and 3-axial angular velocity at a constant rate of 50Hz were measured. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk
signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were
calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ,
fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate
frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

*tBodyAcc-XYZ
*tGravityAcc-XYZ
*tBodyAccJerk-XYZ
*tBodyGyro-XYZ
*tBodyGyroJerk-XYZ
*tBodyAccMag
*tGravityAccMag
*tBodyAccJerkMag
*tBodyGyroMag
*tBodyGyroJerkMag
*fBodyAcc-XYZ
*fBodyAccJerk-XYZ
*fBodyGyro-XYZ
*fBodyAccMag
*fBodyAccJerkMag
*fBodyGyroMag
*fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

*mean(): Mean value
*std(): Standard deviation
*mad(): Median absolute deviation 
*max(): Largest value in array
*min(): Smallest value in array
*sma(): Signal magnitude area
*energy(): Energy measure. Sum of the squares divided by the number of values. 
*iqr(): Interquartile range 
*entropy(): Signal entropy
*arCoeff(): Autorregresion coefficients with Burg order equal to 4
*correlation(): correlation coefficient between two signals
*maxInds(): index of the frequency component with largest magnitude
*meanFreq(): Weighted average of the frequency components to obtain a mean frequency
*skewness(): skewness of the frequency domain signal 
*kurtosis(): kurtosis of the frequency domain signal 
*bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
*angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


Data has been divided to two separate datasets; train data containing 70% of data and test data containgin the
remaining 30% of data. Each observation (row) of these datasets is indicating fetures measured by one participant 
performing one activity. The corresponding participant ID and activity code had been provided in extra txt files.