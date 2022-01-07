
# TEMPLATE

library(tidyverse)
library(showtext)
library(paletteer)
library(ggtext)
library(magick)
library(imager)
library(ggfx)
library(ggforce)

font_add_google('Poppins','Poppins')
showtext_auto()

df = data.frame(
  x = runif(10e3, min = 0, max=100),
  y= runif(10e3, min = 0, max=100),
  z= runif(10e3, min = 0, max=100)
)


df %>% 
  ggplot(
    aes(x=x,
        y=y,
        fill= z)
  )+
  geom_point()+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))






