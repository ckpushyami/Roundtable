setwd("/Users/pushyami/Desktop/roundtable.csv")
roundtable<-read.csv(file="roundtable.csv",header = TRUE)
df<-data.frame(roundtable)

#splitting columns
install.packages("stringr")
library(stringr)
head(roundtable)
df1<-as.data.frame(str_split_fixed(as.character(roundtable$x),",",2))
df1
colnames(df1)<-c("Name","Surname")
df1

#adding columns to original
df<-data.frame(roundtable,df1)
df
install.packages("dplyr")

#deleting old column x
library(dplyr)
df2<-select(df, -x)
df2
names(df2)

#Rearranging columns
df2[,c("Salutation","Name","Surname","Email")]

#printing in excel
library(openxlsx)
write.xlsx(df2, 'roundtableoutput.xlsx')
