if(!is.null(dev.list())) dev.off()
cat("\014") 
rm(list=ls())
setwd("C:/Users/Leslie Aleman/Documents/Co-Term Research")

library(tidyverse)
library(dplyr)
library(readxl)
library(glmnet)
library(reshape2)
library(ggplot2)
library(rpart)

dataset <- read.csv("FuelDescriptors.csv", header = TRUE)
attach(dataset)

#str(Class)
#summary(Class)
#dim(Boston) # dimensions of the dataset
#names(Boston) # column names
#str(Boston) # str function shows the structure of the dataset
#nrow(Boston) # function shows the number of rows
#ncol(Boston) # function shows the number of columns
#summary(Boston) # summary() function shows the summary statistics
#fivenum(Auto$mpg)
#boxplot(Auto$mpg)

classes <- as.factor(Class)
#Types of compounds present
levels(classes)
#Number of classes present
nlevels(classes)
#Number of compounds present in each chemical class
summary(classes)

#labels = unique(Class)
#mytable <- table(classes)

ggplot(dataset, aes(x=classes)) +
  geom_bar(stat="count")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

hist(BP.K.,
     main="Histogram of boiling point values",
     xlab="Boiling point (K)")
#create Q-Q plot
qqnorm(BP.K., main='Normal')
qqline(BP.K.)
#perform shapiro-wilk test
shapiro.test(BP.K.)
#The p-value of the first test is not less than .05,
#which indicates that the data is normally distributed.

hist(Pcrit.Mpa.,
     main="Histogram of critical pressure values",
     xlab = "Critical pressure (Mpa")
qqnorm(Pcrit.Mpa., main='Normal')
qqline(Pcrit.Mpa.)
shapiro.test(Pcrit.Mpa.)

hist(Tcrit.K.,
    main="Histogram of critical temperature values",
    xlab="Critical temperature (K)")
qqnorm(Tcrit.K., main='Normal')
qqline(Tcrit.K.)
shapiro.test(Tcrit.K.)

hist(Molar_Hvap.kJ.mol.,
     main="Histogram of heat of vaporization values",
     xlab="Heat of vaporization (kJ/mol)")
qqnorm(Molar_Hvap.kJ.mol., main='Normal')
qqline(Molar_Hvap.kJ.mol.)
shapiro.test(Molar_Hvap.kJ.mol.)

hist(flashP.K.,
     main="Histogram of flash point values",
     xlab = "Flash point (K)")
qqnorm(flashP.K., main='Normal')
qqline(flashP.K.)
shapiro.test(flashP.K.)
