

# ======== day 27 - 5 colors 


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
  scale_color_viridis_c(option = 'C')+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))




# ============= flower 5 colors 

df4 = data.frame(
  x = c(3,2,3,4,5),
  y = c(7,3,4,5,2)
)
ggplot(
  df4,
    aes(x= x,
        y= y,
        col= factor(y) )
  )+
  geom_diagonal( aes(xend= 7, yend= 9), size=1) +
  geom_diagonal( aes(xend= 1, yend= 6), size=1) +
  geom_diagonal( aes(xend= 4, yend= 11), size=1) +
  geom_diagonal( aes(xend= 6, yend= -2), size=1) +
  geom_diagonal( aes(xend= -3, yend= -2), size=1) +
  geom_diagonal( aes(xend= 1, yend= 9), size=1) +
  geom_diagonal( aes(xend= -1.5, yend= 7.8), size=1) +
  geom_diagonal( aes(xend= 1.4, yend= 12), size=3) +
  
  scale_color_manual(values = c('#2E294E',
                                '#541388',
                                '#F1E9DA',
                                '#FFD400',
                                '#D90368'
                                ))+
  theme_void() +
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))














