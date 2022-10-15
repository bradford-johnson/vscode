library(tidyverse)
library(ggplot2)

titlr <- function(p, title, x_axis, y_axis) {
  p + labs(title = title, x = x_axis, y = y_axis)
}

plot <- ggplot(mtcars, aes(x = mpg, y = wt)) +
  geom_point()

titlr(plot, "MPG and Weight", "MPG", "Weight")