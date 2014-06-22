setwd("c:/users/ravikup/projects/cp/")

load_features <- function(){
  features = read.csv("./Dataset/features.txt", sep=" ", col.names=c("id", "name"), header=FALSE, colClasses = c("numeric", "character"))
  features$name;  
}

load_activities <- function(){
  activities = read.csv("./Dataset/activity_labels.txt", sep=" ", col.names=c("id", "name"), header=FALSE, colClasses = c("numeric", "factor"))  
}

load_subject_data <- function(dataset_type){
    if(dataset_type %in% c("train","test")){
      current_working_directory = getwd()
      subject_file_name = paste("subject_", dataset_type, ".txt", sep="")
      subject_file = file.path(current_working_directory, "Dataset", dataset_type, subject_file_name)
      subject_df = read.csv(subject_file, col.names=c("subject_id"), colClasses=c("numeric"))
      return(subject_df)
    }
    else
      stop(paste("cannot find dataset_type:",dataset_type,". Recognized dataset_types can be either test or train", sep=""))
}

x = load_subject_data("train")

