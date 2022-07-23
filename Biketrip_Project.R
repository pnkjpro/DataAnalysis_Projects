##--------------------Divvy Tripdata from April 2019 to March 2020-------------

#-----------------------installing required packages----------------------
install.packages("tidyverse") #for data import and wrangling
install.packages("lubridate") #for date function
install.packages("ggplot2")   #for visualisation

#-----------------------loading library-----------------------------------
library(tidyverse)
library(lubridate)
library(scales)
library(ggplot2)

#----------------------------importing data-------------------------------
q2_2019=read_csv('RStudio/Case1/csv/Divvy_Trips_2019_Q2.csv')
q3_2019=read_csv('RStudio/Case1/csv/Divvy_Trips_2019_Q3.csv')
q4_2019=read_csv('RStudio/Case1/csv/Divvy_Trips_2019_Q4.csv')
q1_2020=read_csv('RStudio/Case1/csv/Divvy_Trips_2020_Q1.csv')

#-----------checking for inconsistent name and no. of varibales-------------
#checking whether no. of variables/columns from all dataframe are same or not
#cheking whether name from all dataframe's variable/columns are consistent or not
colnames(q2_2019)
colnames(q3_2019)
colnames(q4_2019)
colnames(q1_2020)

ncol(q2_2019)
ncol(q3_2019)
ncol(q4_2019)
ncol(q1_2020)

glimpse(q2_2019)
glimpse(q1_2020)
#inconsitent names are founded in q2_2019, q3_2019, q4_2019 with q1_2020


#---------Renaming variables/columns to make consistent with q1_2020------------
q2_2019=rename(q2_2019,
               ride_id = "01 - Rental Details Rental ID",
               rideable_type = "01 - Rental Details Bike ID",
               started_at = "01 - Rental Details Local Start Time",
               ended_at = "01 - Rental Details Local End Time",  
               start_station_name = "03 - Rental Start Station Name",
               start_station_id = "03 - Rental Start Station ID",
               end_station_name = "02 - Rental End Station Name",
               end_station_id = "02 - Rental End Station ID",
               member_casual = "User Type"
)
colnames(q2_2019)

q3_2019=rename(q3_2019,
               ride_id = "trip_id",
               rideable_type = "bikeid",
               started_at = "start_time",
               ended_at = "end_time",
               start_station_name = "from_station_name",
               start_station_id = "from_station_id",
               end_station_name = "to_station_name",
               end_station_id = "to_station_id",
               member_casual = "usertype"
)
colnames(q3_2019)

q4_2019=rename(q4_2019,
               ride_id = "trip_id",
               rideable_type = "bikeid",
               started_at = "start_time",
               ended_at = "end_time",
               start_station_name = "from_station_name",
               start_station_id = "from_station_id",
               end_station_name = "to_station_name",
               end_station_id = "to_station_id",
               member_casual = "usertype"
)
colnames(q4_2019)

#-------------------------checking inconsistent datatype------------------------

str(q2_2019)
str(q3_2019)
str(q4_2019)
str(q1_2020)

#-------------------------changing datatypes of variables----------------------

q2_2019=mutate(q2_2019,
               ride_id=as.character(ride_id),
               rideable_type=as.character(rideable_type))
q3_2019=mutate(q3_2019,
               ride_id=as.character(ride_id),
               rideable_type=as.character(rideable_type))
q4_2019=mutate(q4_2019,
               ride_id=as.character(ride_id),
               rideable_type=as.character(rideable_type))

str(q2_2019)
str(q3_2019)
str(q4_2019)

#--------------------------Stack each quarter into one big dataframe------------
alltrip = bind_rows(q2_2019,q3_2019,q4_2019,q1_2020)
colnames(alltrip)

#------------------------dropping odd columns-----------------------------------
alltrip = alltrip %>%  
  select(-c("01 - Rental Details Duration In Seconds Uncapped", "Member Gender",
            "05 - Member Details Member Birthday Year",
            "tripduration", "gender", "birthyear",
            "start_lat", "start_lng", "end_lat", "end_lng"))

#--------------reassign with desired value via recode --------------------------
table(alltrip$member_casual)

alltrip =  alltrip %>% 
  mutate(member_casual = recode(member_casual,
                                "Subscriber" = "member",
                                "Customer" = "casual"))

#---------------------------calculating ride duration---------------------------
alltrip$ride_length=difftime(
  as.POSIXct(alltrip$ended_at, format="%Y-%m-%d %H:%M:%S"),
  as.POSIXct(alltrip$started_at, format="%Y-%m-%d %H:%M:%S"),
  unit="secs"
)

#---------------------extract time from datetime--------------------------------
alltrip$date = format(as.POSIXct(alltrip$started_at, format="%Y-%m-%d %H:%M:%S"), "%d-%m-%Y")
alltrip$month = format(as.POSIXct(alltrip$started_at, format="%Y-%m-%d %H:%M:%S"), "%m")
alltrip$day = format(as.POSIXct(alltrip$started_at, format="%Y-%m-%d %H:%M:%S"), "%d")
alltrip$year = format(as.POSIXct(alltrip$started_at, format="%Y-%m-%d %H:%M:%S"), "%Y")
#alltrip$day_of_week = format(as.POSIXct(alltrip$started_at, format="%Y-%m-%d %H:%M:%S"), "%A", week_start = 1)
alltrip$day_of_week = wday(dmy(alltrip$date), label=TRUE, abbr=FALSE, week_start=1)

#----------------------converting ride duration as numeric dataype--------------
alltrip$ride_length <- as.numeric(as.character(alltrip$ride_length))
str(alltrip)

#---------------------storing filtered data into a new dataframe----------------
alltrip_v2=alltrip[!(alltrip$start_station_name=="HQ QR" | alltrip$ride_length<0),]
#storing filtered data of alltrip and filteration must be done [,] before comma

#----------------------Analysis begins here-------------------------------------
summary(alltrip_v2$ride_length) #min, Q1, mean, median, Q3, max

#average ride duration by member type
aggregate(alltrip_v2$ride_length ~alltrip_v2$member_casual, FUN=mean) 
aggregate(alltrip_v2$ride_length ~alltrip_v2$member_casual, FUN=median)
aggregate(alltrip_v2$ride_length ~alltrip_v2$member_casual, FUN=max)
aggregate(alltrip_v2$ride_length ~alltrip_v2$member_casual, FUN=min)

aggregate(alltrip_v2$ride_length 
          ~alltrip_v2$member_casual + alltrip_v2$day_of_week, FUN=mean)


avg_trip=alltrip_v2 %>% 
  group_by(member_casual,day_of_week) %>% #it groups weekdays by member type
  summarise(number_of_rides = n(), #calculates the no. of rides
            average_duration = mean(ride_length)) %>% #calulates the average duration.
  arrange(member_casual, day_of_week)  #it sorts

#--------------------------Visualizing average ride duration-------------------

#-------------------Viz1 for average ride duration---
viz_v1 = ggplot(data=avg_trip)+
  geom_col(mapping=aes(
               x=day_of_week,y=average_duration,fill=member_casual),color="yellow",
           position="dodge")+ #it separates the member type
  coord_cartesian(xlim=c(NA,7),ylim=c(NA,4000))
  #coord_flip( xlim = c(3, 7),ylim = c(800,4000)) #it flips axis and limits range
  
#Changing plot Title and axis title name
viz_v1   = viz_v1+
  labs(title="Average Ride Duration of Each Member Type", 
       x="WeekDays", y="Average Ride Duration in Seconds")

#changing size of plot title and axis titles and axis text
viz_v1=viz_v1+
  theme(axis.text.x = element_text(size = 5))+ 
  theme(axis.text.y = element_text(size = 6))+ 
  theme(axis.title = element_text(size = 7))+
  theme(plot.title = element_text(size = 9))+
  theme(legend.position = "top")
  

#changing legend and its label name  
viz_v1 = viz_v1 +
  scale_fill_discrete(name="Member Type", labels=c("Casual","Subscriber"))

viz_v1

#exporting viz
ggsave("viz_1.png", width=1366, height=768, unit="px")


#---------------viz2 for number of rides---

viz_v2 = ggplot(data=avg_trip)+
  geom_col(mapping=aes(
    x=day_of_week,y=number_of_rides,fill=member_casual),color="yellow",
    position="dodge") #it separates the member type
#Changing plot Title and axis title name
viz_v2   = viz_v2+
  labs(title="Number of Rides of Each Member Type", 
       x="WeekDays", y="Number of Rides in Millions")

#exapanding limits and changing its unit to make it more readeable
viz_v2   = viz_v2+
  expand_limits(x = c(0, NA), y = c(0, NA)) +
  scale_y_continuous(labels = unit_format(unit = "M", scale = 1e-5)) #load library(scales)

#changing size of plot title and axis titles and axis text
viz_v2=viz_v2+
  theme(axis.text.x = element_text(size = 5))+ 
  theme(axis.text.y = element_text(size = 6))+ 
  theme(axis.title = element_text(size = 7))+
  theme(plot.title = element_text(size = 9))+
  theme(legend.position = "top")


#changing legend and its label name  
viz_v2 = viz_v2 +
  scale_fill_discrete(name="Member Type", labels=c("Casual","Subscriber"))

viz_v2

ggsave("viz_2.png", width=1366, height=720, unit="px")

#https://statisticsglobe.com/change-font-size-of-ggplot2-plot-in-r-axis-text-main-title-legend
#helpful link to know more about ggplot2 theme 
