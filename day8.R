
# ============= day 8  -- single curve only


library(tidyverse)
library(showtext)
library(paletteer)
library(ggtext)
library(magick)
library(imager)
library(ggfx)
library(ggfx)
library(ggforce)

font_add_google('Poppins','Poppins')
showtext_auto()


df = tibble(
  x= runif(1e3, 4, 5),
  y= runif(1e3, 4, 5),
  z = runif(1e3,4,5)
)

df %>% 
  ggplot(
    aes(x= x,
        y=y,
        col= x)
  )+
  geom_curve(aes(x = 4, 
                 y = 10, 
                 xend = 19, 
                 yend = 10,
                 size=4
                 ), 
             curvature = 1)+
  
  scale_color_viridis_c(option = 'C')+ # B
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))

