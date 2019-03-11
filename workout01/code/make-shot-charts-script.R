#Title: Make Shot Charts
#description: assemple data into charts
#inputs: shots-data.csv
#outputs: player-shot-chart.jpg's, 

library(ggplot2)
library(dplyr)
library(jpeg)
library(grid)
image_file <- '../images/nba-court.jpg'

court_image <- rasterGrob(
  readJPEG(image_file), 
  width = unit(1, 'npc'),
  height = unit(1, 'npc'))

shots <- read.csv('../data/shots-data.csv', stringsAsFactors = FALSE)

#str(shots)

iguodala <- shots[shots$player == 'Andre Iguodala', ]
green <- shots[shots$player == 'Draymond Green', ]
durant <- shots[shots$player == 'Kevin Durant', ]
thompson <- shots[shots$player == 'Klay Thompson', ]
curry <- shots[shots$player == 'Stephen Curry', ]

iguodala_scatterplot <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)')

#iguodala_scatterplot

green_scatterplot <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)')

#green_scatterplot

durant_scatterplot <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)')

#durant_scatterplot

thompson_scatterplot <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)')

#thompson_scatterplot

curry_scatterplot <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)')

#curry_scatterplot

pdf(file = '../images/andre-iguodala-shot-chart.pdf')
iguodala_scatterplot
dev.off()

pdf(file = '../images/draymond-green-shot-chart.pdf')
green_scatterplot
dev.off()

pdf(file = '../images/kevin-durant-shot-chart.pdf')
durant_scatterplot
dev.off()

pdf(file = '../images/klay-thompson-shot-chart.pdf')
thompson_scatterplot
dev.off()

pdf(file = '../images/stephen-curry-shot-chart.pdf')
curry_scatterplot
dev.off()

shot_chart <- group_by(shots, player) %>%
  ggplot() +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  facet_wrap(~player)+
  ggtitle('Shot Chart: GSW (2016 season)')
  
  pdf(file = '../images/shot-charts.pdf', width = 8, height = 7)
  shot_chart
  dev.off()
  
  png(file = '../images/shot-charts.png', width = 8, height = 7, units = 'in', res = 200)
  shot_chart
  dev.off()
  










