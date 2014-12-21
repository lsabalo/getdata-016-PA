Course Project - Getting and Cleaning Data 
==========================================

The script contains 2 functions based on the project requirements.

mergedata function
------------------

This function reads data from "UCI HAR Dataset" and merges it in a data frame that's returned by the function. It assumes that "UCI HAR Dataset" has been download and uncompressed in the working directory.
This function reads the following files from the dataset provided:

* UCI HAR Dataset/activity_labels.txt
* UCI HAR Dataset/features.txt
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/y_test.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/y_train.txt
* UCI HAR Dataset/train/subject_train.txt

### How to use this function

    > data <- mergedata()
    > str(data)
    'data.frame':    10299 obs. of  88 variables:
    $ personid                         : int  2 2 2 2 2 2 2 2 2 2 ...
    $ activity                         : Factor w/ 6 levels "LAYING","SITTING",..: 3 3 3 3 3 3 3 3 3 3 ...
    $ tbodyaccmeanx                    : num  0.257 0.286 0.275 0.27 0.275 ...
    ...


avgdata function
----------------

This functions returns a data frame with the average of each variable for each activity and each subject. It receives a data frame created by mergedata function as argument.

### How to use this function

    > avg <- avgdata(data) # Where data is a data frame created using mergedata  
    > str(avg)  
    'data.frame':    40 obs. of  88 variables:  
    $ personid                         : int  10 12 13 15 16 17 19 21 4 7 ...  
    $ activity                         : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 2 2 ...  
    $ tbodyaccmeanx                    : num  0.276 0.274 0.275 0.277 0.278 ...  
    ...
 