---
title: "README.md"
output: html_document
---

The analysis follows the following steps

First get the merged dataset

1. gets the feature names from features.txt file
2. updates the names so that they are lowercase and with a simplier character set
3. reads data from the test datasets
4. adds columns for the test subject and activity
5. reads data from the train datasets
6. adds columns for the train subject and activity
7. unions the test and train datasets together
8. updates the activity column to use factor labels rather than numbers

At this point, we have the merged dataset.  To get the summarized dataset:

1. group by subject and activity
2. get the mean for each of the feature columns

