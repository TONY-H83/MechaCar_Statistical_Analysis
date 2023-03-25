# **Part 1: Linear Regression to Predict MPG**


### Import dplyr library
`library()`\
`library(dplyr)`

### Read in csv file
`MechaCar <- read.csv(file='MechaCar_mpg.csv', check.names=F, stringsAsFactors = F)`

### Perform linear regression
`lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar)`

![](image.png)

### Determine the p-value and the r-squared value for the linear regression model
`summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar))`

![](image.png)

### Summary of results: Linear Regression to Predict MPG
Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?

The factors with non-random amounts of variance, in relation to MPG, are vehicle_length and ground_clearance. 
Meaning there is more probability of correlation between MPG and those two factors.

## Is the slope of the linear model considered to be zero? Why or why not?
### The slope of the linear model is not zero because the P-Value is smaller than our significance level of significance level of 0.05%. 

## Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?
### Our model will predicts MPG correlation to other factors 70% of the time.

---

# Deliverable 2

SuspCoil <- read.csv(file="Suspension_Coil.csv", check.names=F, stringsAsFactors = F) 

total_summary <- SuspCoil %>% summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') 

lot_summary <- SuspCoil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') 
  
#----------  Summary: Statistics on Suspension Coils
### With the design specifications for the MechaCar suspension coils requiring a variance of no more than 100 pounds per square inch,
### the entire data set seems to pass designs specifications. However, lot 3 when tested in isolation has a variance of over 170 and does not meet requirements. 
### The variances results of data is as follows: All data: 62.29356, Lot 1: 0.979, Lot 2: 7.469, Lot 3: 170.286

#----------  

# Deliverable 3

t.test(SuspCoil$PSI, mu=1500) #T-test all lots
t.test(subset(SuspCoil, Manufacturing_Lot=="Lot1")$PSI, mu=1500) #T Test for lot 1
t.test(subset(SuspCoil, Manufacturing_Lot=="Lot2")$PSI, mu=1500) #T Test for lot 2
t.test(subset(SuspCoil, Manufacturing_Lot=="Lot3")$PSI, mu=1500) #T test for lot 3

#----------  Summary:  T-Tests on Suspension Coils
### H0 = True [population] mean is 1500 PSI. Our significance level is 0.05. 

### Lot 1 gives us a 100% chance of variance being caused by sampling error. 
### We can be confident that Lot 1 cars have their small variance and meet design requirements.

### Lot 2 gives us a 60% chance of variance being caused by sampling error. 

### Lot 3 has a 96% chance  of its variance (of 170.28) is being caused by random sampling. 
### Which means a 4% chance of variance being caused by sampling error. 
### This means that 

#----------  

# Deliverable 4
## Study Design: MechaCar vs Competition

While the above tests have helped to identify areas that need to be addressed to help resolve MechaCar's production issues, it will also be useful to perform tests to see how MechaCar compares to the competition. Since MechaCar aims to be the vehicle of the future, we recommend touting its fuel efficiency as car buyers in our markets are more concerned with this metric.

For this study, we recommend a null hypothesis that MechaCar's new technology has the same highway fuel efficiency of other cars in its class. The alternative hypothesis is that MechaCar's new technology has better fuel efficiency compared to other cars in its class.

To run this test, we recommend using a multiple linear regression test as there will be multiple independent variables that impact fuel efficiency and we want to isolate MechaCar's use of new technology for its impact on fuel efficiency.

The data set that we would need for the data includes the type of technology used in the MechCar in addition to items that we know impact fuel efficiency so they can be accounted for including engine type, tires, MPG, vehicle length, ground clearance.
