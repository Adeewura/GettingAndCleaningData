# GettingAndCleaningData
## An explanation of the script follows in the lines below:

###For the scripts to work, you need to download and unzip the project file (i.e the UCI HAR Dataset file) into your working directory.
####What follows next are the scripts and a description of how they are related. The first step is to read all the files in the test and train sub-files of the dataset minus the ones in the inertia sub-file. I start with the test sub-file
#####testxfile <- read.table("./UCI HAR Dataset/test/X_test.txt") ## Reading X_test file
#####testyfile<- read.table("./UCI HAR Dataset/test/y_test.txt") ## Reading y_test file
#####testsubfile <- read.table("./UCI HAR Dataset/test/subject_test.txt") ## Reading subject_test file
  ######Now I move up into the main UCI HAR Dataset folder to read the features.txt file which contains the corresponding column names for the data in the test file I just read
#####features <- read.table("./UCI HAR Dataset/features.txt") ##reading features file
  ######(The file is read and the contents are in two columns and 561 rows. I need to transpose it)
#####featurestrans <- t(features) ## transposing the features file
  ######(The transposing is necessary so that I can use the rbind command to place the names into the respective columns)
#####feature <- featurestrans[2, ] ## Sub-setting only the needed row
  ######(There are 2 rows but I need only the rows with the names hence the sub-setting)
#####colnames(testxfile) <- feature ## Re-naming the columns
  ######Applying the names from the features.txt file as the column header to make it descriptive
#####colnames(testsubfile) <- "Subject" ##Re-naming columns
  ######Giving the testsubfile the descriptive name: Subject
#####colnames(testyfile) <- "Activity" ##Re-naming columns
  ######Giving the testyfile the descriptive name: Activity
#####testfiles <- cbind(testsubfile, testxfile, testyfile) ##creating one file for test
  ######Concatenating all the contents from the test file with their descriptive headings together
####For the train sub-file, the explaination for the steps is exactly the same as with the test sub-files as explained above
#####trainxfile <- read.table("./UCI HAR Dataset/train/X_train.txt")
#####trainyfile <- read.table("./UCI HAR Dataset/train/y_train.txt")
#####trainsubfile <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#####colnames(trainxfile) <- feature
#####colnames(trainsubfile) <- "Subject"
#####colnames(trainyfile) <- "Activity"

#####trainfiles <- cbind(trainsubfile, trainxfile, trainyfile) ##creating single train file
  ######In this step, I am creating a complete data set which contains all the individuals who participated in the training portion of the experiment 

#####testtrain <- rbind(testfiles, trainfiles) ##creating one file for test and train files
  ######In this step, I am creating a complete data set which contains all the 30 individuals who participated in the experiment. Hence I am concatenating the test and train complete files

######Now I am using the grep function to find the columns which contain the mean and standard deviations(std) of various measurements. Columns like that contains content such as ” fBodyAcc-meanFreq()-X” are not included in the search because as seen in the codebook, these are weighted average of the frequency components to obtain a mean frequency and not the mean of activities carried out which is the aim of this experiment.
#####grep("mean\\(\\)",feature) ##finding which column names contain 'mean'
#####grep("std\\(\\)",feature) ##finding which column names contain 'std'
######Note that when using the grep function, I used the original feature.txt data. The column numbers would therefore be off by 1 because I concatenated the subject file to the beginning of the data. I took this into account when sub-setting the required data. 
#####meanstd <- testtrain[ ,c(1:7,42:47,82:87,122:127,162:167,202:203,215:216,228:229,241:242,254:255,267:272,346:351,425:430,504:505,517:518,530:531,543:544,563)] ##subsetting columns containing mean and std
  ######Here I am sub-setting the columns that have contain the mean and std.
#####values <- c("walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying")
  ######I am creating labels with which to label the activity column with descriptive labels
#####meanstdname <- meanstd
  ######Here I am creating a dataset that is exactly the same as the complete dataset I have in case I need the dataset to cross check or do some other analysis later
#####meanstdname$Action <- values[meanstdname$Activity] ##Using descriptive activity names for activities
  ######In this step I am creating a new column named “Action” which contains the descriptive label for the Activity Column. This column therefore is replacing the Activity column in use. I am however not just replacing the column, I am leaving it there so that I can visually inspect to be sure all the rows were properly replaced.
#####aggregatemean <- aggregate(x = meanstdname[c(2:67)], by = meanstdname[c("Action", "Subject")], FUN=mean) ## Calculating averages by subject and Activity
  ######This step then goes on to calculate the mean of the mean and std columns by the type of activity and the subject who carried out the activity.
#####write.table(x=aggregatemean, file="Adeewuradata.txt", row.name=FALSE) ##Writing final data
  ######The final data in the step above is being written in this step so that it can be submitted or used later
