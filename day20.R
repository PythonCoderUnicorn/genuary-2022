

# ========= day 20 --- sea of shapes


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
  x = runif(10, min = 0, max=100),
  y= runif(10, min = 0, max=100),
  z= runif(10, min = 0, max=100)
)

df %>% 
  ggplot(
    aes(x=x,
        y=y,
        col= z)
  )+
  geom_delaunay_tile() +
  geom_circle( aes(x0= 3, y0= 7, r=67, size= 7))+ # circle
  geom_curve( aes(xend= 10, yend= 13)) + # curved line
  geom_diagonal( aes(xend= 10, yend=9))+
  geom_ellipse( aes(x0= 13, y0= 15, a= 7, b= 10, angle=56, size=6))+
  geom_ellipse( aes(x0= 33, y0= 55, a= 21, b= 20, angle=56, size=6))+
  geom_hex( size= 5)+
  geom_line()+
  geom_mark_circle()+
  geom_mark_ellipse()+
  geom_rug()+
  
  scale_color_viridis_c(option = 'B')+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "#012a59")) # sea color 

#  aes(xmin= 4, xmax=10 ymin= 5, ymax=15)
# geom_arc(aes(x0= 5, y0= 8, r=16, size= 7, start= 2, end= 20))+
# geom_density( aes(y = 15))+




