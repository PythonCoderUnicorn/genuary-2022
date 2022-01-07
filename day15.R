
# ======= day 15 sand

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

# theme_void()+
# theme(legend.position = "none",
#       panel.background = element_rect(fill = "black"))

df = data.frame(
  x = runif(10e4, min = 0, max=100),
  y= runif(10e4, min = 0, max=100),
  z= runif(10e4, min = 0, max=100)
)


df %>% 
  ggplot(
    aes(x= x,
        y= y,
        col= z)
  )+
  geom_point(size= 0.25)+
  scale_color_gradient(low = '#c2ab93', high = '#75695b')+
  # scale_color_paletteer_c("ggthemes::Brown") +
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))










