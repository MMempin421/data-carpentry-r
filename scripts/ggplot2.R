library(ggplot2)

Interviews_plotting <- readRDS("~/Desktop/Data Carpentry with R/data-carpentry-r/data/Interviews_plotting.rds")

## ggplot(data = <DATA>, mapping = aes(<MAPPINGS>)) + <GEOM_FUNCTION> ()

ggplot(data = Interviews_plotting, aes(x = no_membrs, y = number_items))

ggplot(data = Interviews_plotting, aes(x = no_membrs, y = number_items)) + 
  geom_point()                                                                    # add to actually add/plot data


ggplot(data = Interviews_plotting, aes(x = no_membrs, y = number_items)) + 
  geom_point(alpha = 0.4)                                                         # the more higher the number the more solid the point is


ggplot(data = Interviews_plotting, aes(x = no_membrs, y = number_items)) + 
  geom_jitter(alpha = 0.4)                                                        # adding randomness to data so not on top of eachother 


ggplot(data = Interviews_plotting, aes(x = no_membrs, y = number_items)) + 
  geom_jitter(alpha = 0.4, color = "blue")                                        # add some color


ggplot(data = Interviews_plotting, aes(x = no_membrs, y = number_items)) + 
  geom_jitter(alpha = 0.4, aes(color = village))   

ggplot(data = Interviews_plotting, aes(x = no_membrs, y = number_items, color = village)) +     # another way to do it
  geom_jitter(alpha = 0.4)   


# Exercise

ggplot(data = Interviews_plotting, aes(x = village, y = rooms)) + geom_jitter(aes(color = respondent_wall_type))





