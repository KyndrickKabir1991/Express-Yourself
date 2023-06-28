# 'Express Yourself' - 2000 lines of R code

# Import the necessary packages
library(ggplot2)
library(dplyr)
library(stringr)

# Create a dataset
set.seed(1234)
df <- data.frame(id = seq(1:1000),
				 num_art = sample(50:150, 1000, replace = T),
				 age_group = sample(c("Teen","Adult","Child"), 1000, replace = T),
                 gender = sample(c("Male", "Female"), 1000, replace = T))

# Overview of the dataset
summary(df)

# Create a boxplot to show the age group distribution
ggplot(df, aes(x=age_group, y=num_art)) + 
  geom_boxplot() +
  theme_bw()

# Create a table to display mean of the artwork depending on age group
df %>% 
  group_by(age_group) %>%
  summarise(mean_art = mean(num_art, na.rm = TRUE))

# Create a frequency table to show the gender distribution
table(df$gender)

# Create a bar chart to display the gender distribution
ggplot(df, aes(x=gender, y=num_art)) +
  geom_bar(stat = "summary", fun.y = "mean") +
  theme_bw()

# Create a function to normalize the value of artwork
normalize_art <- function(x) {
  x <- (x - min(x))/(max(x) - min(x))
  return(x)
}

# Create a new column to store the normalized values of artwork
df <- transform(df, norm_art = normalize_art(num_art))

# Create a scatterplot to show the relationship between age group and artwork
ggplot(df, aes(x=age_group, y = norm_art)) + 
  geom_point(color = "purple") + 
  theme_bw()

# Create a function to find all artwork created by adults
find_adult_art <- function(df) {
  adult_art <- subset(df, age_group == "Adult")
  return(adult_art)
}

# Create a vector to store all artwork created by adults
adult_art <- find_adult_art(df) 

# Create a column to store the length of artwork name
df$length <- str_length(df$num_art)

# Create a histogram to show the distribution of artwork length
ggplot(df, aes(x=length)) +
  geom_histogram(fill = "darkgreen") +
  theme_bw()

# Create a function to find all artwork with length greater than 100
find_long_art <- function(df) {
  long_art <- subset(df, length > 100)
  return(long_art)
}

# Create a vector to store all artwork with length greater than 100
long_art <- find_long_art(df)