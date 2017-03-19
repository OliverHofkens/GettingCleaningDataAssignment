# Getting and Cleaning Data Course Project

This is my submission for the Coursera + Johns Hopkins University Data Science Course 3 - Getting and Cleaning Data.

## Usage

The script `run_analysis.R` expects [this data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) in a folder called 'data', cleans it, and summarizes it. It creates 2 variables `data_clean` and `data_grp_summary`, for more info see [the codebook](CodeBook.md).

## Detailed steps

* The script reads the necessary data from the `data/` directory, which should be the original raw data from UCI.
* It appends the test data to the training data.
* It extracts only the variables containing mean() or std() measurements.
* It names all columns to the appropriate variable name.
* It fills in the 'activity' names as a factor, instead of the original ID.
* It creates a second dataframe with all variables averaged, grouped by subject and activity (`data_grp_summary` variable).
* It outputs both dataframes as txt tables.
