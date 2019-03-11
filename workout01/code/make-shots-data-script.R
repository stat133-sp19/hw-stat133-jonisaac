#Title: Making Shots Data
#importing the data and constructing the data frame
#inputs : PLayer data csv's
#output : player data tiguodalat's and shots-data.csv

library(ggplot2)
library(dplyr)

classes_vec <- c('character', 'character', 'factor', 'integer', 'integer', 'integer', 'character', 'factor', 'factor', 'integer', 'character', 'integer', 'integer')
col_names_vec <- c("team_name" ,"game_date" , "season" ,"period", "minutes_remaining", "seconds_remaining", "shot_made_flag" , "action_type", "shot_type", "shot_distance" , "opponent" ,"iguodala" , "y"   )
iguodala <- read.csv("../data/andre-iguodala.csv", colClasses = classes_vec, header = T)
green <- read.csv("../data/draymond-green.csv", colClasses = classes_vec, header = T)
durant <-  read.csv("../data/kevin-durant.csv", colClasses = classes_vec, header = T)
thompson <-  read.csv("../data/klay-thompson.csv", colClasses = classes_vec, header = T)
curry <-  read.csv("../data/stephen-curry.csv", colClasses = classes_vec, header = T)

iguodala <- mutate(iguodala, minute = 12*period - minutes_remaining)
iguodala <- mutate(iguodala, player = 'Andre Iguodala')
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- "shot_no"

green <- mutate(green, minute = 12*period - minutes_remaining)
green <- mutate(green, player = 'Draymond Green')
green$shot_made_flag[green$shot_made_flag == 'y'] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag == 'n'] <- "shot_no"

durant <- mutate(durant, minute = 12*period - minutes_remaining)
durant <- mutate(durant, player = 'Kevin Durant')
durant$shot_made_flag[durant$shot_made_flag == 'y'] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == 'n'] <- "shot_no"

thompson <- mutate(thompson, minute = 12*period - minutes_remaining)
thompson <- mutate(thompson, player = 'Klay Thompson')
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- "shot_no"

curry <- mutate(curry, minute = 12*period - minutes_remaining)
curry <- mutate(curry, player = 'Stephen Curry')
curry$shot_made_flag[curry$shot_made_flag == 'y'] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == 'n'] <- "shot_no"

sink('../output/andre-iguodala-shots-summary.txt')
summary(iguodala)
sink()

sink('../output/draymond-green-shots-summary.txt')
summary(green)
sink()

sink('../output/kevin-durant-shots-summary.txt')
summary(durant)
sink()

sink('../output/klay-thompson-shots-summary.txt')
summary(thompson)
sink()

sink('../output/stephen-curry-shots-summary.txt')
summary(curry)
sink()

shots <- rbind(iguodala, green, durant, thompson, curry, deparse.level = 1)

write.csv(shots, file = '../data/shots-data.csv')

sink('../output/shots-data-summary.txt')
summary(shots)
sink()















