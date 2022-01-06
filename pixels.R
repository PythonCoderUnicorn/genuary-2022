
# code by dominic @dojobo on Twitter


library(tidyverse)
library(modelr)
library(pals)

grid_size <- 100
threshold <- 38
sgrid <- tibble(x=seq(1, grid_size), y=seq(1, grid_size))
sgrid <- data_grid(sgrid, x, y)
sgrid

sgrid2 <- sgrid %>% 
  mutate(y2 = runif(grid_size^2, -0.75*threshold, threshold)) %>% 
  mutate(drop = runif(grid_size^2, 0, 1)) %>% 
  mutate(drop=if_else(y<=threshold/2, drop*2, drop))

sgrid2 <- sgrid2 %>% 
  mutate(y=if_else(y<=threshold & drop > .5, as.integer(round(y2)), y)) 


plot <- ggplot(sgrid2, 
               aes(x=x, 
                   y=y, 
                   fill=y, 
                   color=y)
               ) +
  geom_point(alpha=0.9, shape="square") +
  theme(legend.title=element_blank(), 
        legend.position="none"
        ) +
  scale_fill_gradient2(low=ocean.deep(3)[1], 
                       mid=ocean.deep(3)[2], 
                       high=ocean.deep(3)[3]) +
  scale_color_gradient2(low=ocean.deep(3)[1], 
                        mid=ocean.deep(3)[2], 
                        high=ocean.deep(3)[3])


plot +
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))
