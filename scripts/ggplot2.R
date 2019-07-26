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


# Boxplots

ggplot(data = Interviews_plotting, aes(x = respondent_wall_type, y = rooms)) + geom_boxplot()


ggplot(data = Interviews_plotting, aes(x = respondent_wall_type, y = rooms)) + 
  geom_boxplot() + 
  geom_jitter(alpha = 0.5, color = "tomato")                                                   # alpha gives points less transparency


ggplot(data = Interviews_plotting, aes(x = respondent_wall_type, y = rooms)) + 
  geom_boxplot() + 
  geom_jitter(alpha = 0.5, color = "tomato", width = 0.2)  


ggplot(data = Interviews_plotting, aes(x = respondent_wall_type, y = rooms)) + 
  geom_boxplot(alpha = 0) +                                                                   # no fill in boxplot, alpha = 0
  geom_jitter(alpha = 0.5, color = "tomato", width = 0.2)  


ggplot(data = Interviews_plotting, aes(x = respondent_wall_type, y = rooms)) + 
  geom_jitter(alpha = 0.5, color = "tomato", width = 0.2) +
  geom_boxplot(alpha = 0)                                                                     # to put boxplots over data points, just reoder codes


# Exercise

ggplot(data = Interviews_plotting, aes(x = respondent_wall_type, y = rooms)) + 
  geom_violin(alpha = 0) +                                                                   
  geom_jitter(alpha = 0.5, color = "tomato", width = 0.2)  


ggplot(data = Interviews_plotting, aes(x = respondent_wall_type, y = liv_count)) + 
  geom_jitter(alpha = 0.5, color = "tomato", width = 0.2) +
  geom_boxplot(alpha = 0)      


ggplot(data = Interviews_plotting, aes(x = respondent_wall_type, y = liv_count, color = memb_assoc)) +    # mapping boxplot by memb_assoc
  geom_jitter(alpha = 0.5, width = 0.2) +
  geom_boxplot(alpha = 0)     


ggplot(data = Interviews_plotting, aes(x = respondent_wall_type, y = liv_count)) +    
  geom_jitter(alpha = 0.5, width = 0.2, aes(color = memb_assoc)) +
  geom_boxplot(alpha = 0) 


ggplot(data = Interviews_plotting, aes(x = respondent_wall_type, y = liv_count)) +    
  geom_jitter(alpha = 0.5, width = 0.2, aes(color = memb_assoc), height = 0.2) +                          # added height so doesnt obscure data because of jitters you've added
  geom_boxplot(alpha = 0) 


# Barplots

ggplot(Interviews_plotting, aes(x = respondent_wall_type)) + geom_bar()                                  # doesnt requrie y value to be specified in barplots


ggplot(Interviews_plotting, aes(x = respondent_wall_type)) + geom_bar(aes(fill = village))               # stacked is the default


ggplot(Interviews_plotting, aes(x = respondent_wall_type)) + geom_bar(aes(fill = village), position = "dodge")   # dodge put the plots side by side




