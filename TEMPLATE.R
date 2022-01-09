
# TEMPLATE

library(tidyverse)
library(showtext)
library(paletteer)
library(ggtext)
library(magick)
library(imager)
library(ggfx)
library(ggforce)


df = data.frame(
  x = runif(10e3, min = 0, max=100),
  y= runif(10e3, min = 0, max=100),
  z= runif(10e3, min = 0, max=100)
)

df %>% 
  ggplot(
    aes(x=x,
        y=y,
        col= z)
  )+
  geom_point()+
  scale_color_viridis_c(option = 'B')+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))




