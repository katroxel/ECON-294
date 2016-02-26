install.packages("ggplot")
library(ggplot2)

#1#
#a#
scatter <- ggplot(diamonds, aes(x*y*z, price, 
                                colour=clarity, size = carat)) +
  geom_point(alpha = 1/4) +
  scale_x_log10() +
  scale_y_log10() +
  scale_size(range = c(4, 10)) +
  guides(colour = guide_legend(override.aes = list(size = 5, alpha = 1)))
scatter


#b#
histogram <- ggplot(diamonds, aes(carat, ..density.., fill = clarity)) +
  geom_histogram(binwidth=.2)
histogram + facet_grid(cut ~ .)


#c#
violin <- ggplot(diamonds, aes(cut, price)) +
  geom_violin(size=.85) +
  geom_jitter(alpha=1/43, size=3)
violin




#2#
#a#
library(foreign)
org_example <- read.dta("http://people.ucsc.edu/~aspearot/Econ_217/org_example.dta")
require(dplyr)
trunc <- org_example %>% 
  group_by(year, month) %>%
  summarise(
    Median.RW = median(rw, na.rm = T),
    rw_1qrt = quantile(rw, .25, na.rm = T),
    rw_3qrt = quantile(rw, .75, na.rm = T),
    rw_1dc = quantile(rw, .1, na.rm = T),
    rw_9dc = quantile(rw, .9, na.rm = T)
  ) %>%
  mutate(
    date = paste(year, month, "01", sep = "-"),
    date = as.Date(date, format = "%Y-%m-%d")
  )

ggplot(trunc, aes(date, Median.RW)) +
  geom_ribbon(aes(ymin=rw_1dc, ymax=rw_9dc), fill="gray80", alpha=2/3) +
  geom_ribbon(aes(ymin=rw_1qrt, ymax=rw_3qrt), fill="gray30", alpha=1/3) +
  geom_line(aes(y=Median.RW)) +
  coord_cartesian(xlim = c(1985, 2015)) +
  coord_cartesian(ylim = c(-2, 52))




#b#
trunc2 <- org_example %>% 
  group_by(year, month, educ) %>%
  summarise(
    Median.RW = median(rw, na.rm = T)
  ) %>%
  mutate(
    date = paste(year, month, "01", sep = "-"),
    date = as.Date(date, format = "%Y-%m-%d")
  )



ggplot(trunc2, aes(date, Median.RW, colour=educ)) +
  geom_line(size=.8) +
  coord_cartesian(xlim = c(1985, 2015)) +
  coord_cartesian(ylim = c(5, 35))

