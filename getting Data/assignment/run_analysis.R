
#gets the mean for each variable grouped by subject and activity
getAveragedData<-function(data) {
  m2<-merged %>% group_by(subject, activity)
  summarise_each(m2, funs(mean))
}

#gets the merged data
getMergedData<-function() {
  featureNames<-getFeatureNames()
  
  #variables we care about
  variables<-grep("(mean|std)", featureNames)
  
  x1<-read.table("data//test//X_test.txt", row.names=NULL, col.names=featureNames)
  x1<-x1[,variables]
  
  y1<-read.table("data//test//Y_test.txt", row.names=NULL)
  subject1<-read.table("data//test//subject_test.txt", row.names=NULL)
  x1[,"activity"]<-y1
  x1[,"subject"]<-subject1
  
  x2<-read.table("data//train/X_train.txt", row.names=NULL, col.names=featureNames)
  x2<-x2[,variables]
  y2<-read.table("data//train//Y_train.txt", row.names=NULL)
  subject2<-read.table("data//train//subject_train.txt", row.names=NULL)
  x2[,"activity"]<-y2
  x2[,"subject"]<-subject2
  
  unioned<-rbind(x1,x2)
  
  #add factors for the activity labels
  activityLabels<-read.table("data//activity_labels.txt", row.names=NULL)
  unioned[,"activity"]<-factor(unioned[,"activity"],levels=1:6, labels=activityLabels[,2])
  unioned
}

#Created formatted feature names 
getFeatureNames<-function() {
  header<-read.table("data//features.txt")
  #replace () with ""
  r1<-gsub("\\(\\)","", header[,2])
  #replace (stuff) with .stuff.
  r2<-gsub("[\\(\\)\\,]", ".", r2)
  #replace trailing . with ""
  r3<-gsub("\\.$", "", r2)
  r3<-gsub("\\.+", ".", r3)
  
  #replace - with _
  r4<-gsub("-","_", r3)
  tolower(r4)
}

#does the tasks specified in the assignment
run<-function() {
  data<-getMergedData();
  averaged<-getAveragedData(data);
  write.table(averaged,"step5.txt", row.names=FALSE)
}