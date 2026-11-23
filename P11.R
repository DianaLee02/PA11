# Name: Diana Lee
# Course: COP2073C
# Assignment: Module 11 Programming Assignment
# Date: November 22, 2026

# Load required packages
library(tidyverse)
library(modelr)

# Create a tibble with cyl and wt from mtcars
cars_tbl <- as_tibble(mtcars) %>%
  select(cyl, wt)

# Fit a linear model predicting wt from cyl
wt_model <- lm(wt ~ cyl, data = cars_tbl)

# Generate a data grid from cyl and add model predictions
grid_preds <- cars_tbl %>%
  data_grid(cyl) %>%
  add_predictions(wt_model)

# Plot observed weights alongside predicted group values
ggplot(cars_tbl, aes(x = cyl, y = wt)) +
  geom_point() +
  geom_point(
    data = grid_preds,
    aes(y = pred),
    color = "red",
    size = 4
  )

# Analysis:
# Treating cyl as a numeric predictor in lm(wt ~ cyl) fits a straight
# line across cylinder counts, where predicted weight increases steadily
# as the number of cylinders rises from 4 to 6 to 8. Comparing the red
# predicted points to the observed black points shows the upward trend
# in vehicle weight, though individual cars within each cylinder group
# still vary around the predicted values.