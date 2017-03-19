# CodeBook

## Raw Data

The raw data was obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones .
Please see the README.txt and features\_info.txt in the downloaded data for detailed information about the data set.

## Tidy Data

The raw data can be cleaned up with the `run_analysis.R` script contained in this repository.
See the [README.md](README.md) for more information.
The script creates 2 variables (both also exported as .txt), data\_clean and data\_grp\_summary: 

### data\_clean

A dataframe consisting of 68 variables:

* subject: The identifier of the subject
* activity: a factor containing 1 of 6 activities the subject was doing.
    * WALKING
    * WALKING\_UPSTAIRS
    * WALKING\_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING

The other 66 variables are the numeric mean and stddev measurements - normalized and bounded within [-1,1] - of the following variables in the original dataset:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag 

Please refer to the original documentation of this dataset for more details [HERE](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### data\_grp\_summary

A dataframe with the same variables as `data_clean`, but summarized by averaging variables by each subject and activity.
