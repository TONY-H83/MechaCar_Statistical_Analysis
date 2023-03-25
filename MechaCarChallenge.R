#Import dplyr library
library()
library(dplyr)

#Read in csv file
MechaCar <- read.csv(file='MechaCar_mpg.csv', check.names=F, stringsAsFactors = F)

#Perform linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar)

#Determine the p-value and the r-squared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar))

#Read in csv file
SuspCoil <- read.csv(file="Suspension_Coil.csv", check.names=F, stringsAsFactors = F)

#Write an RScript that creates a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation
#of the suspension coil’s PSI column
total_summary <- SuspCoil %>% summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

#Write an RScript that creates a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation
#of the suspension coil’s PSI column.
lot_summary <- SuspCoil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

#T Test all lots
t.test(SuspCoil$PSI, mu=1500)

#T Test for lot 1
t.test(subset(SuspCoil, Manufacturing_Lot=="Lot1")$PSI, mu=1500) 

#T Test for lot 2
t.test(subset(SuspCoil, Manufacturing_Lot=="Lot2")$PSI, mu=1500)

#T test for lot 3
t.test(subset(SuspCoil, Manufacturing_Lot=="Lot3")$PSI, mu=1500)
