library(dplyr)
library(tidyr)

interviews <- read_csv("data/SAFI_clean.csv", na = "NULL")
interviews

select(interviews, village, no_membrs, years_liv)                 # haven't had to put "" or define factors as previously, as already put data frame - interviews

filter(interviews, village == "God")                              # 2 equal signs

filter(interviews, village == "God", no_membrs > 6)   

select_cols <- select(interviews, village, no_membrs, years_liv)
god_data <- filter(select_cols, village == "God", no_membrs > 6)  # join together but can get messy so use pipes
god_data
 
# pipes - taking data from left and feeding into whatevers on the right 
interviews %>% 
  select(village, no_membrs, years_liv) %>% 
  filter(village == "God", no_membrs > 6)                        # same select function but dont need to put in first argument which is the data as we are providing it through the pipe

# Exercise
interviews %>%
  filter(memb_assoc == "yes") %>%                                # need to put filter first in this instance because if second it's not in the choices selected but usually best to put select first then filter
  select(affect_conflicts, liv_count, no_meals) 
  

interviews %>%
  mutate(people_per_room = no_membrs / rooms)

interviews_ppl_room <- interviews %>%                            # assign output so can view it properly
  mutate(people_per_room = no_membrs / rooms)

view(interviews_ppl_room)

interviews_ppl_room <- interviews %>% 
  filter(memb_assoc == "yes") %>%
  mutate(people_per_room = no_membrs / rooms)
view(interviews_ppl_room)


# Exercise
interviews_total_meals <- interviews %>%                         # need to consider your order
  mutate(total_meals = no_membrs * no_meals) %>%
  filter(total_meals > 20) %>%
  select(village, total_meals)
view(interviews_total_meals)

interviews_total_meals


interviews %>%
  group_by(village) %>%                                         # to treat village as its own group
  summarise(mean_no_membrs = mean(no_membrs))                   # create a variable (mean_no_membrs) and tell it how to compute that variable from some variable that exists


interviews %>%
  group_by(village, memb_assoc) %>%
  summarise(mean_no_membrs = mean(no_membrs))                   # can remove missing data

interviews %>%
  filter(!is.na(memb_assoc)) %>%                                # to take out all missing data, ! flips all the false to true and true to false
  group_by(village, memb_assoc) %>%
  summarise(mean_no_membrs = mean(no_membrs))  


interviews %>%
  filter(!is.na(memb_assoc)) %>%                               
  group_by(village, memb_assoc) %>%
  summarise(mean_no_membrs = mean(no_membrs), 
            min_membrs = min(no_membrs))                        # to create more than one summary, create new variable


interviews %>%
  filter(!is.na(memb_assoc)) %>%                               
  group_by(village, memb_assoc) %>%
  summarise(mean_no_membrs = mean(no_membrs), 
            min_membrs = min(no_membrs)) %>%
  arrange(min_membrs)                                          # to arrange from smalles to largest by min_membrs


interviews %>%
  filter(!is.na(memb_assoc)) %>%                               
  group_by(village, memb_assoc) %>%
  summarise(mean_no_membrs = mean(no_membrs), 
            min_membrs = min(no_membrs)) %>%
  arrange(desc(min_membrs))                                   # desc, descending order


interviews %>%
  count(village)

interviews %>%
  count(village, sort = TRUE)


# Exercise

interviews %>%
  group_by(village) %>%
  summarise(mean_no_membrs = mean(no_membrs), 
            min_membrs = min(no_membrs), 
            max_membrs = max(no_membrs), 
            n = n())                                         # to include number of observations

?n                                                           # to get help


interviews_spread <- interviews %>%
  mutate(wall_type_logical = TRUE) %>%
  spread(key = respondent_wall_type, 
         value = wall_type_logical, fill = FALSE)           # key, what the new column should be; fill, fill all entries in the row that have no data to go in as false

interviews_spread
view(interviews_spread)                                     # can see last 4 columns of the different wall types


interviews_gather <- interviews_spread %>%
  gather(key = "respondent_wall_type", 
         value = "wall_type_logical", 
         burntbricks:sunbricks)                             # burntbricks:sunbricks - to chose which columns should be gathered together, saves you from typing them all out

view(interviews_gather)                                     # taken 4 columns and stacked on top of each other, now need to clean it up


interviews_gather <- interviews_spread %>%
  gather(key = "respondent_wall_type", value = "wall_type_logical", burntbricks:sunbricks) %>%
  filter(wall_type_logical) %>%
  select(-wall_type_logical)

view(interviews_gather)                                     # extra column at end gone and back to 131 rows, got rid of excess rows we introduced



