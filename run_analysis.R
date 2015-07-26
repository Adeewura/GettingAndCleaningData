testxfile <- read.table("./UCI HAR Dataset/test/X_test.txt") ## Reading X_test file
testyfile<- read.table("./UCI HAR Dataset/test/y_test.txt") ## Reading y_test file
testsubfile <- read.table("./UCI HAR Dataset/test/subject_test.txt") ## Reading subject_test file

features <- read.table("./UCI HAR Dataset/features.txt") ##reading features file
featurestrans <- t(features) ## transposing the features file
feature <- featurestrans[2, ] ## Extracting only the needed row

colnames(testxfile) <- feature ## Re-naming the columns 
colnames(testsubfile) <- "Subject" ##Re-naming columns
colnames(testyfile) <- "Activity" ##Re-naming columns

testfiles <- cbind(testsubfile, testxfile, testyfile) ##creating one file for test

trainxfile <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainyfile <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainsubfile <- read.table("./UCI HAR Dataset/train/subject_train.txt")

colnames(trainxfile) <- feature
colnames(trainsubfile) <- "Subject"
colnames(trainyfile) <- "Activity"

trainfiles <- cbind(trainsubfile, trainxfile, trainyfile) ##creating single train file

testtrain <- rbind(testfiles, trainfiles) ##creating one file for test and train files

grep("mean\\(\\)",feature) ##finding which column names contain 'mean'
grep("std\\(\\)",feature) ##finding which column names contain 'std'

meanstd <- testtrain[ ,c(1:7,42:47,82:87,122:127,162:167,202:203,215:216,228:229,241:242,254:255,267:272,346:351,425:430,504:505,517:518,530:531,543:544,563)] ##subsetting columns containing mean and std

values <- c("walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying")
meanstdname <- meanstd
meanstdname$Action <- values[meanstdname$Activity] ##Using descriptive activity names for activities

aggregatemean <- aggregate(x = meanstdname[c(2:67)], by = meanstdname[c("Action", "Subject")], FUN=mean) ## Calculating averages by subject and Activity

write.table(x=aggregatemean, file="Adeewuradata.txt", row.name=FALSE) ##Writing final data