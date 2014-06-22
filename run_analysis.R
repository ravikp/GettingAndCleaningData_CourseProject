setwd("c:/users/ravikup/projects/cp/")

load_subject_data <- function(dataset_type){
    if(dataset_type %in% c("train","test")){
      current_working_directory = getwd()
      subject_file_name = paste("subject_", dataset_type, ".txt", sep="")
      subject_file = file.path(current_working_directory, "Dataset", dataset_type, subject_file_name)
      subject_df = read.csv(subject_file, col.names=c("subject_id"), colClasses=c("numeric"), header=FALSE)
      return(subject_df)
    }
    else
      stop(paste("cannot find dataset_type:",dataset_type,". Recognized dataset_types can be either test or train", sep=""))
}

load_activities <- function(){
  activities = read.csv("./Dataset/activity_labels.txt", sep=" ", col.names=c("id", "name"), header=FALSE, colClasses = c("numeric", "factor"))  
}

load_activity_data <- function(dataset_type){
  if(dataset_type %in% c("train","test")){
    current_working_directory = getwd()
    activity_file_name = paste("y_", dataset_type, ".txt", sep="")
    activity_file = file.path(current_working_directory, "Dataset", dataset_type, activity_file_name)
    activity_df = read.csv(activity_file, col.names=c("activity_id"), colClasses=c("numeric"), header=FALSE)
    return(activity_df)
  }
  else
    stop(paste("cannot find dataset_type:",dataset_type,". Recognized dataset_types can be either test or train", sep=""))
}

load_features <- function(){
  features = read.csv("./Dataset/features.txt", sep=" ", col.names=c("id", "name"), header=FALSE, colClasses = c("numeric", "character"))
  features$name;  
}

load_feature_data <- function(dataset_type){
  if(dataset_type %in% c("train","test")){
    col_names = load_features()
    col_datatypes = rep("numeric", length(features))

    current_working_directory = getwd()
    feature_file_name = paste("x_", dataset_type, ".txt", sep="")
    feature_file = file.path(current_working_directory, "Dataset", dataset_type, feature_file_name)
    feature_df = read.csv(feature_file, header=FALSE, sep="", blank.lines.skip=TRUE, colClasses = col_datatypes)
    colnames(feature_df) = col_names
    
    return(feature_df)
  }
  else
    stop(paste("cannot find dataset_type:",dataset_type,". Recognized dataset_types can be either test or train", sep=""))
}

create_complete_model <- function(output_model = FALSE){
	current_working_directory = getwd()
	output_path = file.path(current_working_directory, "output")
	if(!file.exists(output_path)){dir.create(output_path)}
	merged_output_file = file.path(output_path, "all_observations.csv")

	train_subject 	= load_subject_data("train")
	test_subject 	= load_subject_data("test")
	subject 		= rbind(train_subject, test_subject)
	
	train_activity 	= load_activity_data("train")
	test_activity 	= load_activity_data("test")
	activity 		= rbind(train_activity, test_activity)
	
	train_feature 	= load_feature_data("train")
	test_feature 	= load_feature_data("test")
	feature 		= rbind(train_feature, test_feature)

	all_observations = cbind(subject, activity, feature)

	if(output_model) write.csv(all_observations, file=merged_output_file, row.names=FALSE)

	return(all_observations)
}

model_with_mean_and_stddev <- function(output_model = FALSE, output_complete_model = FALSE) {
  current_working_directory = getwd()
  output_path = file.path(current_working_directory, "output")
  if(!file.exists(output_path)){dir.create(output_path)}
  merged_output_file = file.path(output_path, "observations_with_mean_and_stddev.csv")

  complete_model = create_complete_model(output_complete_model)
  columns = colnames(complete_model)
  pattern = "(subject|activity)|(-(std|mean)[()](-(X|Y|Z))?)"
  
  columns_with_mean_and_stddev = columns[grep(pattern, ignore.case=TRUE, columns)]
  x = complete_model[, columns_with_mean_and_stddev]

  if(output_model) write.csv(x, file = merged_output_file, row.names=FALSE)

  return(x)
}