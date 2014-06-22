Coursera Getting and Cleaning Data Project
===========

## Summary

This file generates a tidy data set for the wearable sensor activity analysis data at [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

## Steps

1. Data from the Features and Activities files are read into vectors for later merging.
2. All data from the Test and Training directories are read in and merged with the activity and subject IDs in the same directory.
3. The Test and Training data are combined into a single dataset.
4. All columns that do not contain mean() or std() are thrown out.
5. The data is merged with the lookup tables from step #1.
6. The data is grouped by activity name and subject ID, and the mean is calculated for each observation type.
7. The result is written to 'results.txt' in the working directory.


