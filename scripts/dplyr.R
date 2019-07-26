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





