if(!is.null(dev.list())) dev.off()
cat("\014") 
rm(list=ls())
setwd("C:/Users/Leslie Aleman/OneDrive/Documents/NEW S23")

library(tidyverse)
library(dplyr)
library(readxl)
library(glmnet)
library(reshape2)
library(ggplot2)
library(rpart)
library(scales)

dataset <- read.csv("FuelDescriptors.csv", header = TRUE)
attach(dataset)

summary(BP.K.)
hist(BP.K.,
     main="Histogram of boiling point values",
     xlab="Boiling point (K)")

#create Q-Q plot
qqnorm(BP.K., main='Normal Q-Q plot for boiling point')
qqline(BP.K.)

#perform shapiro-wilk test
shapiro.test(BP.K.)
#The p-value of the first test is not less than .05,
#which indicates that the data is normally distributed.

# FIND OUTLIERS
# Lower Inner Fence: Q1 – 1.5 x (IQR)
LIF = fivenum(BP.K.)[2] - (1.5*IQR(BP.K.))
# Upper Inner Fence: Q3 + 1.5 x (IQR)
UIF = fivenum(BP.K.)[4] + (1.5*IQR(BP.K.))
# Find number of outliers
length(BP.K.[which(BP.K. < LIF | BP.K. > UIF)]) #8
# Display non-outliers
non_outliers_BP = BP.K.[which(BP.K. > LIF & BP.K. < UIF)] #372
length(non_outliers_BP)
#--------------------------------------------------------------
summary(Pcrit.Mpa.)

hist(Pcrit.Mpa.,breaks=20,
     main="Histogram of critical pressure values",
     xlab = "Critical pressure (MPa)")
qqnorm(Pcrit.Mpa., main='Normal Q-Q plot for critical pressure')
qqline(Pcrit.Mpa.)
shapiro.test(Pcrit.Mpa.)
# FIND OUTLIERS
# Lower Inner Fence: Q1 – 1.5 x (IQR)
LIF = fivenum(Pcrit.Mpa.)[2] - (1.5*IQR(Pcrit.Mpa.))
# Upper Inner Fence: Q3 + 1.5 x (IQR)
UIF = fivenum(Pcrit.Mpa.)[4] + (1.5*IQR(Pcrit.Mpa.))
# Find number of outliers
length(Pcrit.Mpa.[which(Pcrit.Mpa. < LIF | Pcrit.Mpa. > UIF)]) #10
# Display non-outliers
non_outliers_Pcrit = Pcrit.Mpa.[which(Pcrit.Mpa. > LIF & Pcrit.Mpa. < UIF)] #370
length(non_outliers_Pcrit)
#---------------------------------------------------------------
summary(Tcrit.K.)
hist(Tcrit.K.,
     main="Histogram of critical temperature values",
     xlab="Critical temperature (K)")
qqnorm(Tcrit.K., main='Normal Q-Q plot for critical temperature')
qqline(Tcrit.K.)
shapiro.test(Tcrit.K.)

# FIND OUTLIERS
# Lower Inner Fence: Q1 – 1.5 x (IQR)
LIF = fivenum(Tcrit.K.)[2] - (1.5*IQR(Tcrit.K.))
# Upper Inner Fence: Q3 + 1.5 x (IQR)
UIF = fivenum(Tcrit.K.)[4] + (1.5*IQR(Tcrit.K.))
# Find number of outliers
length(Tcrit.K.[which(Tcrit.K. < LIF | Tcrit.K. > UIF)]) #5
# Display non-outliers
non_outliers_Tcrit = Tcrit.K.[which(Tcrit.K. > LIF & Tcrit.K. < UIF)]
length(non_outliers_Tcrit) #375
#----------------------------------------------------------------------------
summary(DensityCrit.kg.m3)
hist(DensityCrit.kg.m3,breaks=30,
     main="Histogram of critical density values",
     xlab="Critical density (kg/m^3)")
qqnorm(DensityCrit.kg.m3, main='Normal Q-Q plot for critical density')
qqline(DensityCrit.kg.m3)
shapiro.test(DensityCrit.kg.m3)

# FIND OUTLIERS
# Lower Inner Fence: Q1 – 1.5 x (IQR)
LIF = fivenum(DensityCrit.kg.m3)[2] - (1.5*IQR(DensityCrit.kg.m3))
# Upper Inner Fence: Q3 + 1.5 x (IQR)
UIF = fivenum(DensityCrit.kg.m3)[4] + (1.5*IQR(DensityCrit.kg.m3))
# Find number of outliers
length(DensityCrit.kg.m3[which(DensityCrit.kg.m3 < LIF | DensityCrit.kg.m3 > UIF)]) #8
# Display non-outliers
non_outliers_rho = DensityCrit.kg.m3[which(DensityCrit.kg.m3 > LIF & DensityCrit.kg.m3 < UIF)]
length(non_outliers_rho) #372
#----------------------------------------------------------------------------
summary(TP_ratio)
hist(TP_ratio,breaks = 50,
     main="Histogram of Tcrit/Pcrit values",
     xlab="Tcrit/Pcrit ratio (K/MPa)")
qqnorm(TP_ratio, main='Normal Q-Q plot for Tcrit/Pcrit')
qqline(TP_ratio)
shapiro.test(TP_ratio)

# FIND OUTLIERS
# Lower Inner Fence: Q1 – 1.5 x (IQR)
LIF = fivenum(TP_ratio)[2] - (1.5*IQR(TP_ratio))
# Upper Inner Fence: Q3 + 1.5 x (IQR)
UIF = fivenum(TP_ratio)[4] + (1.5*IQR(TP_ratio))
# Find number of outliers
length(TP_ratio[which(TP_ratio < LIF | TP_ratio > UIF)]) #22
# Display non-outliers
non_outliers_TP = TP_ratio[which(TP_ratio > LIF & TP_ratio < UIF)]
length(non_outliers_TP) #358

#---------------------------------------------------------------------------
classes <- as.factor(Class)
#Types of compounds present
levels(classes)
#Number of classes present
nlevels(classes)
#Number of compounds present in each chemical class
summary(classes)

#labels = unique(Class)
#mytable <- table(classes)

#plot count of classes
ggplot(dataset, aes(x=classes)) +
  geom_bar(stat="count")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# plot proportion of classes
ggplot(dataset,aes(x=classes))+
  geom_bar(aes(y=(..count..)/sum(..count..)))+scale_y_continuous(labels=percent_format())+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# table of proportions
myTable = table(classes)/sum(table(classes))*100
