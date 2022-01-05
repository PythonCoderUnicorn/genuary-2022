
# ======== day 4

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


df = tibble(
  x= runif(1e3, 4, 5),
  y= runif(1e3, 4, 5),
  z = runif(1e3,4,5)
)

df %>% 
  ggplot(
    aes(x= x,
        y=y,
        col= x)
  )+
  # geom_density_2d()+
  # geom_bspline_closed()+
  # geom_diagonal(aes(xend= 40, yend=90))+
  # geom_density_2d()+
  # geom_density2d_filled()+
  # geom_density_2d() +
  # geom_delaunay_segment()+
  # geom_curve(aes(x = 4, y = 10, xend = 90, yend = 10), data = df, curvature = -0.8)+
  # geom_count()+
  # geom_circle( aes(x0= 2, y0= 4, r= 45))+ # just dots
  # geom_bspline() +
  # geom_voronoi_tile()+
  geom_voronoi_segment()+
  # geom_vline(xintercept = 5:10, colour="green", linetype = "longdash")+
  # geom_violin()+
  # geom_step()+
  # geom_spiro(aes(R = 10, r = 3, d = 5)) +
  # geom_arc0(aes(x0= 5, y0=80,r=45,start=4, end=190))+
  # geom_spoke(aes(angle= x*8, radius= x/2))+
  # geom_segment(aes(xend= -81, yend=7))+ # (3 40) (30 4) (10 4)
  # geom_pointrange(aes(ymin=1, ymax=300))+
  # geom_point()+
  # geom_line()+
  # # geom_hex()+
  # geom_curve(aes(xend=1, yend=54))+ # planet curve
  # geom_crossbar(ymin=4, ymax=40)+
  # geom_path()+
  # geom_hex(col='#44145c', fill='seagreen',size=1.5, alpha=0.9)+
  
  scale_color_viridis_c(option = 'F')+ # B
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))















ggplot(faithfuld, aes(waiting, eruptions, z = density/30))+ 
  geom_contour()+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))











ggplot(
  data = data.2,
  aes(x=X,
      y=Y, 
      fill= Z)
)+
  geom_tile()+
  scale_fill_paletteer_c("gameofthrones::wildfire")+
  # scale_fill_gradient(low="pink",  high="blue") +
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))


library("lattice")

# Dummy data
x <- seq(1,10, length.out=20) #
y <- seq(1,10, length.out=20) #, length.out=20
data.2 <- expand.grid(X=x, Y=y)
data.2$Z <- runif(400, 0, 15) # 400, 0, 5

## Try it out
levelplot(Z ~ X*Y, data=data  ,xlab="X",
          main="")












df %>% 
  ggplot(
    aes(x= x,
        y=y,
        col= x)
  )+
  geom_curve(aes(x = 3, 
                 y = 10, 
                 xend = 90, yend = 10), curvature = -0.8)+
  geom_curve(aes(x = 3, 
                 y = 8, 
                 xend = 80, yend = 20), curvature = -0.8)+
  geom_curve(aes(x = 3, 
                 y = 8, 
                 xend = 30, yend = 40), curvature = -0.3)+
  geom_curve(aes(x = 3, 
                 y = 8, 
                 xend = 40, yend = 50), curvature = -0.3)+
  geom_curve(aes(x = 3, 
                 y = 8, 
                 xend = 50, yend = 60), curvature = -0.4, col='green')+
  
  
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))
  
  
  
  
  
  
  
df %>% 
  ggplot(
    aes(x= x,
        y=y,
        col= x)
  )+
  geom_diagonal(aes(xend= 40, yend=90))+
  geom_diagonal(aes(xend= 20, yend=100))+
  geom_diagonal(aes(xend= 100, yend=110))+
  geom_diagonal(aes(xend= 100, yend=11))+
  
  scale_color_viridis_c(option = 'F')+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))




data <- data.frame(
  x = c(1, 7, 2, 1, 7, 3, 3, 7),
  y = c(1, 7, 3, 2, 3, 1, 2, 5),
  group = c(3,3,3,3, 7,7,7,7)
)

ggplot(data,
       aes(x, y, group = group)) +
  geom_diagonal_wide(fill='purple',radius = unit(5, 'mm'))+
  geom_diagonal_wide(strength = 0.25, alpha = 0.5, fill = 'blue')+
  geom_diagonal_wide(strength = 0.2, alpha = 0.5, fill = 'green',
                     radius = unit(5, 'mm'))+
  geom_diagonal_wide(fill='purple',radius = unit(5, 'mm'), alpha=0.3)+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))















d = data.frame(
  x1= c(-1,5,2,-5,8), # 1,3,1,5,4   left top
  x2= c(2,4,7,-9,16), # 2,4,3,4,8
  y1= c(1,-3,5,7,15), # 1,1,4,1,3   bottom edge
  y2= c(-2,3,6,4,4) # 2,2,5,3,5    top edge
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


















circles <- data.frame(
  x0 = runif(6, 1, 10),
  y0 = runif(6, 1, 10),
  r = seq(0.1, 2) # , length.out = 9
)

# Behold the some circles
ggplot(data = circles) +
  geom_circle(aes(x0 = x0, y0 = y0, r = r, fill = r) , alpha= 0.6)+
  scale_fill_viridis_c(option = 'B')+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))





