install.packages("dplyr")
library("dplyr")
sum(is.na(Food_Delivery_Times))
Food_Delivery_Times$Courier_Experience_yrs[is.na(Food_Delivery_Times$Courier_Experience_yrs)]<-mean(Food_Delivery_Times$Courier_Experience_yrs,na.rm=TRUE)
Food_Delivery_Times$Weather[is.na(Food_Delivery_Times$Weather)]<-mode(Food_Delivery_Times$Weather)
Food_Delivery_Times$Time_of_Day[is.na(Food_Delivery_Times$Time_of_Day)]<-mode(Food_Delivery_Times$Time_of_Day)
Food_Delivery_Times$Traffic_Level[is.na(Food_Delivery_Times$Traffic_Level)]<-mode(Food_Delivery_Times$Traffic_Level)
boxplot(Food_Delivery_Times[,7:9])
outlier=boxplot(Food_Delivery_Times$Delivery_Time_min)$out
print(outlier)
Food_Delivery_Times[which(Food_Delivery_Times$Delivery_Time_min %in% outlier),]
dd<-Food_Delivery_Times[-which(Food_Delivery_Times$Delivery_Time_min %in% outlier),]
print(dd)
boxplot(dd$Delivery_Time_min)
Food_Delivery_Times<-dd
boxplot(Food_Delivery_Times[,7:9])
Food_Delivery_Times$Speed_kmph <- Food_Delivery_Times$Distance_km / (Food_Delivery_Times$Delivery_Time_min / 60)
boxplot(Food_Delivery_Times[,7:10])
outlier<-boxplot(Food_Delivery_Times$Speed_kmph)$out
print(outlier)
Food_Delivery_Times[which(Food_Delivery_Times$Speed_kmph %in% outlier),]
dd<-Food_Delivery_Times[-which(Food_Delivery_Times$Speed_kmph %in% outlier),]
print(dd)
Food_Delivery_Times<-dd
boxplot(Food_Delivery_Times[,7:10])
