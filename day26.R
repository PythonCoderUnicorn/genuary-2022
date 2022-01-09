
# ========= day 26 - airport carpet

library(tidyverse)
library(showtext)
library(paletteer)
library(ggtext)
library(magick)
library(imager)
library(ggfx)
library(ggforce)
library(graphics)

# xleft, ybottom, xright, ytop, angle
rect = data.frame(
  x = 1:100,
  y = 1:100
)

df = data.frame(
  x = runif(1000, min = 0, max=100),
  y= runif(1000, min = 0, max=100),
  z= runif(1000, min = 0, max=100)
)


t = seq(0, 2*pi, length.out= 50) # 50 points from 0 to 2*pi
x = sin(t)
y = cos(t)
x1 = t * x
y1 = t * y
z = y*x

circles = data.frame(t,x,y,x1,y1, z)

ggplot(circles, aes(x= x1, y= y1))+geom_point()+ggdark::dark_mode()

# circles(4, 8, radius = 66, bg= 'black', fg='white')





df %>% 
  ggplot(
    aes(x= x,
        y= y,
        col= z)
  )+
  # geom_curve( aes(xend= 30, yend= 40), size= .2)+ # fibre optic split end
  geom_jitter()+
  # geom_diagonal( aes(xend= .4, yend= .6))+
  geom_crossbar( aes(ymin= 12, ymax= 16)) +
  geom_crossbar( aes(xmin= 4, xmax= 8)) +
  
  geom_crossbar( aes(ymin= 25, ymax= 29)) +
  geom_crossbar( aes(xmin= 16, xmax= 20)) +

  geom_crossbar( aes(ymin= 65, ymax= 69)) +
  geom_crossbar( aes(xmin= 80, xmax= 84)) +
  
  geom_crossbar( aes(ymin= 85, ymax= 89)) +
  geom_crossbar( aes(xmin= 92, xmax= 96)) +
  
  scale_color_paletteer_c("ggthemes::Purple")+ # 
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "#197a7d")) # #1e9094




#   geom_curve( aes(xend= 20, yend=40))+










