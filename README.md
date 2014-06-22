Getting and Cleaning Data Course Project
========================================

h6. How to run the program
# Checkout the code to a directory
# Open R studio
# Set working directory of the R Studio as the directory where the code is checked out.
# Source the run_analysis.R file by executing the command source("./run_analysis.R")

h6. How to verify the course project
# To verify the first question:- to merge all datasets
## execute the following command in R studio: model1 = create_complete_model()
## if we execute the above function with optional argument output_model = TRUE then the output is generated in output directory with file name 'all_observations.csv'
## str(model1, list.len=999), dim(model1) will give you number of rows, columns, fields of the merged dataset.
# To verify the second question:- To extract mean and standard deviation fields
## execute the following command in R studio: model2 = model_with_mean_and_stddev()
## if we execute the above command with output_model = TRUE argument, then the output is generated in the output directory with file name 'observations_with_mean_and_stddev.csv'
### str(model2), dim(model2) will give number of rows, columns, fields of the dataset that contains only mean and standard deviation fields.
