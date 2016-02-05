#0#
print("Kevin Troxell")
print(1307858)
print("katroxel@ucsc.edu")

#1#
library(foreign)
df.ex <- read.dta("http://people.ucsc.edu/~aspearot/Econ_217_Data/org_example.dta")

class(df.ex)


#2#
require(dplyr)
df.ex.2 <- df.ex %>%
  dplyr::filter(
    year == 2013 & month == 12
  )
print(nrow(df.ex.2))

df.ex.2 <- df.ex %>%
  dplyr::filter(
    year == 2013 & (month == 7 | month == 8 | month == 9)
  )
print(nrow(df.ex.2))


#3#
df.ex.3 <- df.ex %>% 
  arrange(year, month)

df.ex.4a<- df.ex %>% 
  select(year, month, minsamp, hrlonglk, age)

df.ex.4b <- df.ex %>%
  select(year, month, starts_with("i"))

print(distinct(select(df.ex, state)))


#4#
stndz <- function(x){
  (x - mean(x, na.rm = T))  /  sd(x, na.rm = T)
}

nrmlz <- function(x){
  (x - min(x, na.rm = T)) / (max(x, na.rm = T) - min(x,na.rm = T))
}


df.ex.5a <- df.ex %>%
  mutate(
  rw.stndz = stndz(rw), rw.nrmlz = nrmlz(rw))

df.ex.5b <- df.ex %>%
  group_by(year, month) %>%
  mutate(
    rw.stndz = stndz(rw), rw.nrmlz = nrmlz(rw), count=n())

#6#
df.ex.6 <- df.ex %>% 
  group_by(year, month, state) %>%
  summarise(
   rw_min = min(rw, na.rm = T),
   rw_1Qnt = quantile(rw, .25, na.rm = T),
   rw_mean = mean(rw, na.rm = T),
   rw_median = median(rw, na.rm = T),
   rw_3Qnt = quantile(rw, .75, na.rm = T),
   rw_max = max(rw, na.rm = T),
   rw_count = n()
  )

print(df.ex.6 %>% ungroup() %>% arrange(desc(rw_mean)) %>% 
        select(year, month, state) %>% head(1))


  
#7#
df.ex.7 <- df.ex %>%
  arrange(year, month, as.character(state))
