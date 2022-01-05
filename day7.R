
# ======= day 7 --- Sol LeWitt Wall 


library(tidyverse)
library(showtext)
library(paletteer)
library(ggtext)
library(magick)
library(imager)
library(ggfx)
library(ggforce)





d = data.frame(
  x1= c(1,2,1,1,2), # 1,3,1,5,4   left top
  x2= c(2,3,1,3,1), # 2,4,3,4,8
  y1= c(1,2,3,1,2), # 1,1,4,1,3   bottom edge
  y2= c(2,3,2,3,2) # 2,2,5,3,5    top edge
  # t= c('a','a','a','b','b'), 
  # r= c(1,2,3,4,5)
)

ggplot(data=d,
       aes(xmin= x1, # left top
           xmax= x2, # right top
           ymin= y1, # bottom edge
           ymax= y2, # top edge
       )
) + 
  geom_rect(color='purple', fill='#47fc71', size=1, alpha=0.7) +
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))


df4 = tibble(
  x1 = runif(15, min = 1, max = 100),
  x2 = runif(15, min = 1, max = 100),
  y1 = runif(15, min = 1, max = 100),
  y2= runif(15, min = 1, max = 100)
)
ggplot(data=df4,
       aes(xmin= x1, # left top
           xmax= x2, # right top
           ymin= y1, # bottom edge
           ymax= y2, # top edge
       )
) + 
  geom_rect(color='purple', fill=NA, size=1, alpha=0.7) +
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))

##














df3 <- data.frame(
  x = rep(c(2, 5, 7, 9, 12), 2),
  y = rep(c(1, 2), each = 5),
  z = factor(rep(1:5, each = 2)),
  w = rep(diff(c(0, 4, 6, 8, 10, 14)), 2)
)

ggplot(df3, 
       aes(xmin = x * w/2, 
           xmax = x + w/2, 
           ymin = y*3, 
           ymax = y+5,
           fill = z)
) +
  geom_rect(colour = "black", size=1)+
  scale_fill_paletteer_d("beyonce::X10") +
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))







df <- expand.grid(x = 0:5, y = 0:5)
df$z <- runif(nrow(df))
ggplot(df, aes(x, y, fill = z)) +
  geom_raster()+
  scale_fill_paletteer_c("grDevices::PurpOr")+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))








