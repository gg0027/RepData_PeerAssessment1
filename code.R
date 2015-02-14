# upzip and read csv data

setwd("~/RepData_PeerAssessment1")
unzip(zipfile = "activity.zip")
data <- read.csv(file = "activity.csv")

# What is mean total number of steps taken per day?

## Calculate the total number of steps taken per day
library(dplyr)
daily<- data %>% group_by(date) %>% summarise(sum(steps))
dailysteps <- daily[[2]]

# Make a histogram of the total number of steps taken each day
hist(x = dailysteps,breaks = 10)

# Calculate and report the mean and median of the total number of steps taken per day
mean(dailysteps,na.rm=T)
median(dailysteps,na.rm=T)

# What is the average daily activity pattern?
# Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)
# Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?
library(ggplot2)
daily_activity <- data %>% group_by(interval) %>% summarise(sum(steps,na.rm=T))
qplot(x = daily_activity$interval,y = daily_activity[[2]],geom = "line")

daily_activity[which.max(daily_activity[[2]]),]

