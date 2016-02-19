print("Kevin Troxell")
print(1307858)
print("katroxel@ucsc.edu")



#1#
setwd("/Users/ktrox39/Documents/Winter 2016/econ294_2015/data")
flights <- read.csv("https://github.com/EconomiCurtis/econ294_2015/blob/master/data/airports.csv", as.is = FALSE)
airports <- read.csv("airports.csv", as.is = FALSE)
planes <- read.csv("planes.csv", as.is = FALSE)
weather <- read.csv("weather.csv", as.is = FALSE)

##2##
flights$date <- as.Date(flights$date)
weather$date <- as.Date(weather$date)

###3###
library(dplyr)

flights.2a <- flights %>% filter(dest=="SFO" | dest=="OAK")
print(nrow(flights.2a))

flights.2b <- flights %>% filter(dep_delay>=60) 
print(nrow(flights.2b))

flights.2c <- flights %>% filter(arr_delay>=dep_delay*2 & dep_delay>0)
print(nrow(flights.2c))


####4####
flights %>% select(ends_with("y"))
flights %>% select(contains("_"))
flights %>% select(matches("delay"))



#####5#####
print(flights %>% arrange(-dep_delay) %>% select(plane) %>% head(5))
print(flights %>% arrange(arr_delay - dep_delay) %>% select(plane) %>% head(5))


######6######
flights <- flights %>% mutate(mph = dist/(time/60))
flights <- flights %>% mutate(delta = dep_delay - arr_delay)
print(flights %>% arrange(-mph) %>% select(plane) %>% head(5))
print(flights %>% arrange(-delta) %>% select(plane) %>% head(5))
print(flights %>% arrange(delta) %>% select(plane) %>% head(5))




#######7#######
flights.7a <- flights %>% group_by(carrier) %>% 
  summarise(
    delta_min = min(delta, na.rm = T),
    delta_1qt = quantile(delta, .25, na.rm = T),
    delta_mean = mean(delta, na.rm = T),
    delta_3qt = quantile(delta, .75, na.rm = T),
    delta_median = median(delta, na.rm = T),
    delta_90 = quantile(delta, .90, na.rm = T),
    delta_max = max(delta, na.rm = T),
    n_cancelled = sum(cancelled),
    n_total = n(),
    n_percentage = n_cancelled/n_total
)
print(flights.7a <- flights.7a %>% arrange(-n_percentage))



print(day_delay <- filter( summarize(
  group_by( filter(flights, !is.na(dep_delay) ), date ), delay = mean(dep_delay), n = n()),n > 10 ))


print("This code gives us the average flight delay and number of flights per day")





########8########
print(day_delay %>% mutate(delay_diff = delay - lag(delay)) %>% 
  arrange(-delay_diff) %>% select(date) %>% head(5))


#########9#########
dest_delay <- filter( summarize(
  group_by( filter(flights, !is.na(arr_delay) ), dest ), delay = mean(arr_delay), n = n()),n > 10 )
#a#
library(dplyr)
airports <- airports %>% select(dest = iata, name = airport)
print(dest_delay %>% left_join(airports, 
            by = "dest") %>% arrange(-delay) %>%  select(dest) %>% head(5))


#b#
check9b <- dest_delay %>% inner_join(airports,  by = "dest")
print("No. Left join has 114 obs while inner join has 112")

#c#
check9c <- dest_delay %>% right_join(airports, by = "dest")
print("There are NAs because you are merging many destinations with only a few cities.")

#d#
check9d <- dest_delay %>% full_join(airports, by = "dest")
print("There are NAs because you do a left and right join")



##########10##########















