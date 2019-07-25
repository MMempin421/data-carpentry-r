print("Hello, world")

# Load required packages

install.packages(tidyverse)

area_hectares <- 1.0

area_hectares

area_acres <- 2.47 * area_hectares  # convert to acres

area_hectares <- 2.5                # land area in hectares

area_acres                          # print


length <- 4
width <- 6
area <- length * width
area

# b <- sqrt(x = a)

round(3.14159, digits = 2)

no_members <- c(3, 7, 10, 6)
no_members
length(no_members)
class(no_members)
str(no_members)

# Data types
respondent_wall_type <- c("muddaub", "burntbricks", "sunbricks")
respondent_wall_type
length(respondent_wall_type)
class(respondent_wall_type)
str(respondent_wall_type)

possessions <- c("bicycle", "radio", "television")
possessions <- c(possessions, "mobile_phone")       #add another element to vector
possessions
possessions <- c("car", possessions)
possessions


num_char <- c(1,2,3, "a")

num_logical <- c(1,2,3, FALSE)

char_logical <- c("a","b","c", TRUE)

tricky <- c(1,2,3, "4")

combined_logical <- c(num_logical, char_logical)


# Subsetting

respondent_wall_type[2]
respondent_wall_type[c(3, 2)]

more_respondent_wall_type <- respondent_wall_type[c(1,2,3,2,1,3)]
more_respondent_wall_type

# Conditional subsetting

no_members[c(TRUE, FALSE, TRUE, TRUE)]
no_members[no_members > 5]
no_members > 5

no_members[no_members < 3 | no_members > 5]

no_members[no_members >= 7 & no_members == 3]    # == is a logical (equal to)

possessions[possessions == "car" | possessions == "bicycle"] # returns both car and bicycle

possessions %in% c("car", "bicycle")

possessions[possessions %in% c("car", "bicycle")]
