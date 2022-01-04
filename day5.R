
# ======== day 5

library(tidyverse)
library(showtext)
library(paletteer)
library(ggtext)
library(magick)
library(imager)
library(ggfx)

font_add_google('Poppins','Poppins')
showtext_auto()


df = data.frame(
  x = rnorm(115, mean = 6, sd=3),
  y= rnorm(115, mean = 6, sd=3)
)

df %>% 
  ggplot(
    aes(x= x,
        y=y)
  )+
  geom_polygon(fill='purple')+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))


# 



