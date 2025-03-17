#################
##load packages##
#################

library(nycflights13)
library(tidyverse)

##see dataframes from packages
View(flights)

##check documentation
?flights

View(airlines)
?airlines

##merge data frames that share one column with the same name
flight_airlines<-flights%>%
  inner_join(airlines,by="carrier")

##merge data frames with multiple shared common columns
View(weather)
flights_weather<-flights%>%
  inner_join(weather, by=c("year","month","day","hour","origin"))

##merge data frames when columns have different names but same content
View(airports)
flights_airports<-flights%>%
  inner_join(airports,by=c("dest"="faa"))

##similar function in base R, merge()

flight_airlines2<-merge(flights,airlines, by="carrier")
View(flight_airlines2)

flights_weather2<-merge(flights,weather, by=c("year","month","day","hour","origin"))
View(flights_weather2)

##not sure if you notice, the merge() function takes longer to run. 
##use proc.time() to time how long your code takes to run

begin<-proc.time()
flight_airlines2<-merge(flights,airlines, by="carrier")
proc.time()-begin

begin<-proc.time()
flight_airlines<-flights%>%
  inner_join(airlines,by="carrier")
proc.time()-begin

