
# ===== day 3 ==== space

library(tidyverse)
library(showtext)
library(paletteer)
library(ggtext)
library(magick)
library(imager)
library(ggfx)

font_add_google('Poppins','Poppins')
showtext_auto()



random_points <- tibble(x = 1:1000,
                        y = sample(1:1000))

## Example 8: ggplot of randomized points====
random_points %>%
  ggplot(aes(x=x, y=y))+
  geom_point(size= 0.3,
             color = sample(paletteer_c("gameofthrones::stark",5) , # RColorBrewer::brewer.pal(5,"PRGn") gameofthrones::white_walkers
                            nrow(random_points), 
                            replace = TRUE)
             )+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))
  




## Example 8: ggplot of randomized points with randomized colors====
random_points %>%
  ggplot(aes(x=x, y=y))+
  geom_point(color = sample(paletteer_c("ggthemes::Blue-Teal",5) , # RColorBrewer::brewer.pal(5,"PRGn") gameofthrones::white_walkers
                            nrow(random_points), 
                            replace = TRUE),
             size= runif(1000, 0.2, 1.5)#--- my add -- bubbles !
  )+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))




















