rm(list = ls())
library(datasets)
data(mtcars)
head(mtcars)

tapply(mtcars$mpg, mtcars$cyl, mean)

avg_hp<-tapply(mtcars$hp, mtcars$cyl, mean)
avg_hp[3] - avg_hp[1]
debug(ls)
