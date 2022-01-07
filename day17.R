
# ========= #genuary art

# day 17 == 3 colors

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
  geom_point(size= 2, alpha= 0.3)+
  scale_color_distiller(palette = "YlGnBu", direction = -1)+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))

# -- that's nice 3 colors 



erupt <- ggplot(faithfuld, 
                aes(x= waiting, 
                    y= eruptions, 
                    fill = density)
                ) +
  geom_raster(show.legend = F) +
  scale_x_continuous(NULL, expand = c(0, 0)) + 
  scale_y_continuous(NULL, expand = c(0, 0)) + 
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))

erupt +
  theme_void()+
  # scale_fill_distiller(palette = "RdPu")
  # scale_fill_distiller(palette = "Spectral")
  scale_fill_distiller(palette = "RdYlGn")









