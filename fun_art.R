
# ======== day 4

library(tidyverse)
library(showtext)
library(paletteer)
library(ggtext)
library(magick)
library(imager)
library(ggfx)

font_add_google('Poppins','Poppins')
showtext_auto()


df = tibble(
  x= runif(1e3, 4, 5),
  y= runif(1e3, 4, 5)
)

df %>% 
  ggplot(
    aes(x= x,
        y=y,
        col= x)
  )+
  geom_spoke(aes(angle= x*8, radius= x/2))+
  # geom_segment(aes(xend= -81, yend=7))+ # (3 40) (30 4) (10 4)
  # geom_pointrange(aes(ymin=1, ymax=300))+
  # geom_point()+
  # geom_line()+
  # geom_hex()+
  # geom_curve(aes(xend=1, yend=54))+ # planet curve
  # geom_crossbar(ymin=4, ymax=40)+
  # geom_path()+
  scale_color_viridis_c(option = 'B')+
  # geom_hex(col='#44145c', fill='seagreen',size=1.5, alpha=0.9)+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))










