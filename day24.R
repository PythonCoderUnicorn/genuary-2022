
# ======== day 24 - random number


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



df2 = data.frame(
  x = rnorm(50, 33, 7),
  y = runif(50, min=4, max= 89),
  z = runif(50, min=4, max=89)
)

df2 %>% 
  ggplot(
    aes(x= x,
        y= y,
        col= z)
  )+
  # geom_bspline() +
  # geom_density_2d()+
  geom_
  scale_color_viridis_c(option = 'C')+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))
  
  


# ----- rainbow dotplot
  
df2 %>% 
  ggplot( aes(x=x,))+
  geom_dotplot(fill='red', binwidth = 0.90, data = df)+
  geom_dotplot(fill='orange', binwidth = 0.80, data = df)+
  geom_dotplot(fill='yellow', binwidth = 0.70, data = df)+
  geom_dotplot(fill='green', binwidth = 0.60, data = df)+
  geom_dotplot(fill='blue', binwidth = 0.50, data = df)+
  geom_dotplot(fill='purple', binwidth = 0.4, data = df)+
  
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black",
                                        margin(2,2,2,2, unit = 'cm'))
        )
  
  
  
  
  

