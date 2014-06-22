Getting and Cleaning Data Course Project
========================================

### How to run the program
1. Checkout the code to a directory
2. Open R studio
3. Set working directory of the R Studio as the directory where the code is checked out.
4. Source the run_analysis.R file by executing the command source("./run_analysis.R")
5. For verification the output datasets were checked into the repository for verification.
6. Before running the program, if the files are already present in the output directory they get overridden.

### How to verify the course project
1. To verify the first question:- to merge all datasets
	* Execute the following command in R studio: model1 = create_complete_model()
	* If we execute the above function with optional argument output_model = TRUE then the output is generated in output directory with file name 'all_observations.csv' str(model1, list.len=999), dim(model1) will give you number of rows, columns, fields of the merged dataset.
2. To verify the second question:- To extract mean and standard deviation fields
	* Execute the following command in R studio: model2 = model_with_mean_and_stddev()
	* If we execute the above command with output_model = TRUE argument, then the output is generated in the output directory with file name 'observations_with_mean_and_stddev.csv' str(model2), dim(model2) will give number of rows, columns, fields of the dataset that contains only mean and standard deviation fields.
3. To verify the third question:- use descriptive activity names
	* Both the model1 and model2 variables created in the above commands contain column name 'activity'. Also the output is checked into the github repository in output directory.
	* Output directory contains all_observations.csv with 'activity' column indicating description.
