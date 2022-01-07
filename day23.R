

# ========= day 23 -- abstract vegetation?

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
  x = runif(1000, min = 0, max=100),
  y= runif(1000, min = 0, max=100),
  z= runif(1000, min = 0, max=100)
)

df %>% 
  ggplot(
    aes(x=x,
        y=y,
        col= z)
  )+
  geom_circle( aes(x0= 3,y0= 7, r= 12, size= 5),alpha= 0.5)+
  geom_circle( aes(x0= 6,y0= 10, r= 15, size= 5),alpha= 0.5)+
  geom_circle( aes(x0=1,y0= 5, r= 10, size= 5), alpha= 0.5)+

  
  scale_color_paletteer_c("gameofthrones::wildfire")+ # greens !
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))

#  always have a hard time with col & fill





