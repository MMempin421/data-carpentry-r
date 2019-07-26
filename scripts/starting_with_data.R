library(tidyverse)

interviews <- read_csv("data/SAFI_clean.csv", na = "NULL")
interviews                      # Tibble (data frames) shows only part of the data

view(interviews)                # To look at actual data in R     

dim(interviews)                 # dimensions of data frame, first column number of rows, second column is number of columns

nrow(interviews)
ncol(interviews)

dim(interviews)[1]              # Another way to get number of rows
dim(interviews)[-2]             # Another way to get number of rows

dim(interviews)[1] == nrow(interviews)

head(interviews)

head(as.data.frame(interviews)) # as.data. frame - to ensure data isn't a tibble anymore and is a real data frame. Head gives first few entries of data

tail(as.data.frame(interviews))

names(interviews)                     # Tells you what columns are called

str(interviews)                       # Explore structure of data, what columns you have, what they're called and data type

summary(interviews)                   # Summary of each column


interviews[1,1]                        # [] for subsetting, first row and column number
interviews[1,6]
interviews[, 1]                        # take all the rows for column 1
interviews[1]                          # if just use one index it gives first column which is counter intuiative given column is the second subset

1:3                                    # to create sequence of numbers from 1 to 3

interviews[1:3, 7]                     # first 3 rows from column 7
interviews[3, ]                        # all of row 3 
interviews[1:6, ]                      # exact same thing head function does

interviews[, -1]                       # remove first column

interviews_no_id <- interviews[, -1]   # create new vector without id
interviews_no_id

# Exercise
# 1
interviews_100 <- interviews[100, ]
interviews_100

# 2
nrow(interviews)                       # as above = 131
n_rows <- nrow(interviews)             # create a vector
n_rows

interviews_last <- interviews[n_rows,]
interviews_last

tail(interviews)
tail(interviews, n = 1)

# 3
interviews_middle <- interviews[n_rows/2,]
interviews_middle

interviews_middle <- ceiling(n_rows/2)
interviews[interviews_middle, ]

# 4
interviews_head <- interviews[-(7:n_rows), ]            # discard all rows after first 6 rows (head)
interviews_head


floor_type <- factor(c("earth", "cement", "cement", "earth"))
floor_type

levels(floor_type)                                      # sorted alphabetically

nlevels(floor_type)                                     # number of levels

# Reordering
floor_type <- factor(c("earth", "cement", "cement", "earth"), 
                     levels = c("earth", "cement"))
floor_type                                              # if want levels in specific order and not sorted by R

levels(floor_type)
levels(floor_type)[2]                                   # just look at second level
levels(floor_type)[2] <- "brick"                        # don't want cement as second factor, want brick
levels(floor_type)[2]
levels(floor_type)
floor_type

as.character(floor_type)

year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))    # factors are numbers
year_fct

as.numeric(year_fct)                                   # try to convert to numbers for the four different years in data
as.character(year_fct)                                 # character vector of year
as.numeric(as.character(year_fct))

levels(year_fct)[year_fct]                             # indirectly converted factor into character

as.numeric(levels(year_fct))[year_fct] 

year_nmb <- as.numeric(levels(year_fct))[year_fct] 
table(year_nmb)
table(year_fct)
summary(year_fct)


