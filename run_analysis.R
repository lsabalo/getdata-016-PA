# Returns a data frame with all files in a single data set
mergedata <- function() {
    
    # features.txt has a description of each column
    features <- read.table("UCI HAR Dataset/features.txt")

    # Extract the number of the columns we were requested (mean and std)
    columns <- grep("[mM]ean|[sS]td", features[,2])

    xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
    ytest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activityid")
    xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
    ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activityid")    
    
    # Pull only columns we are interested on
    xtest <- xtest[, columns]
    xtrain <- xtrain[, columns]
    
    # Assig names to columns
    names(xtest) <- tolower(gsub("[(|)|,|-]", "", features[columns, 2]))
    names(xtrain) <- tolower(gsub("[(|)|,|-]", "", features[columns, 2]))

    # activity_labels.txt has the name of each activity
    activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt", sep=" ", col.names = c("activityid", "activity"))
    
    # Merge of the activity recored with its label
    ytestlabeled <- merge(ytest, activitylabels, by="activityid", sort=FALSE, all.x=TRUE)
    ytrainlabeled <- merge(ytrain, activitylabels, by="activityid", sort=FALSE, all.x=TRUE)

    subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "personid")
    subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "personid")
    
    test <- cbind(subjecttest[1], ytestlabeled[2], xtest)
    train <- cbind(subjecttrain[1], ytrainlabeled[2], xtrain)
    
    rbind(test, train)
}

avgdata <- function(x) {
    tmp <- aggregate(. ~ personid + activity, data, mean)
    tmp[order(tmp$activity, tmp$personid), ]
}