

# =========== day 25 -- perspective

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

ggplot(df,
       aes(x=x,
           y=y, col=z, fill= z)
       )+
  geom_hex(fill= '#155422', alpha= 0.4)+ # green dark
  geom_hex(fill= '#2b2a1f', alpha= 0.2, size=3)+
  
  # geom_rect( aes(xmin=20, xmax= 23, ymin= 1, ymax=13),
  #            fill='#4d4233', alpha= 0.2)+

  # geom_circle( aes(x0= 1, y0= 1, r= 120), size= 1.5, alpha= 0.5)+
  geom_circle( aes(x0= 3, y0= 5, r= 2), size= 2.5, alpha= 0.5)+
  geom_path()+ # --- grass !

  scale_color_paletteer_c("ggthemes::Green")+ # 
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "#2e2c1f")) # brown

#









# ## set up the plot region:
# plot(c(100, 250), c(300, 450), type = "n")
# i <- 4*(0:10)
# ## draw rectangles with bottom left (100, 300)+i  and top right (150, 380)+i
# rect(100+i, 300+i, 150+i, 380+i, col=rainbow(11, start=.7,end=.1))
# rect(240-i, 320+i, 250-i, 410+i, col=heat.colors(11), lwd=i/5)
# 




