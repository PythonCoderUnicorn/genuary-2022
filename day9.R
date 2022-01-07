

# ========== day 9 - architecture

library(tidyverse)
library(showtext)
library(paletteer)
library(ggtext)
library(magick)
library(imager)
library(ggfx)
library(ggfx)
library(ggforce)


df = data.frame(
  x = runif(10e3, min = 0, max=100),
  y= runif(10e3, min = 0, max=100),
  z= runif(10e3, min = 0, max=100)
)

df2 = data.frame(
  x = 1:100,
  y= 1:100,
  z= 1:100
)

df %>% 
  ggplot(
    aes(x= x,
        y= y,
        fill= z)
  )+
  geom_bezier() +
  # geom_arc( aes(x0= 10, y0= 30, r= 5, start=35, end=50))+
  
  theme(panel.background = element_rect(fill = "#0064A5",
                                        colour = "white"),
    plot.background = element_rect(fill = "#0064A5"),
    axis.line = element_line(colour = "white",
                             linetype = "solid"),
    axis.ticks = element_line(colour = "white"),
    panel.grid.major = element_line(size = 0.2),
    panel.grid.minor = element_line(size = 0.2),
    axis.text = element_blank()
    ) 



beziers <- data.frame(
  x = c(1, 2, 3, 4, 4, 6, 6),
  y = c(0, 2, 0, 0, 2, 2, 0),
  type = rep(c('cubic', 'quadratic'), c(3, 4)),
  point = c('end', 'control', 'end', 'end', 'control', 'control', 'end'),
  colour = letters[1:7]
)
help_lines <- data.frame(
  x = c(1, 3, 4, 6),
  xend = c(2, 2, 4, 6),
  y = 0,
  yend = 2
)
# See how control points affect the bezier
ggplot() +
  geom_segment(aes(x = x, xend = xend, y = y, yend = yend),
               data = help_lines,
               # arrow = arrow(length = unit(c(0, 0, 0.5, 0.5), 'cm')),
               colour = 'white',
               show.legend = F
               ) +
  geom_bezier(aes(x = x, y = y, group = type, linetype = type),
              data = beziers,
              show.legend = F
              ) +
  # geom_point(aes(x = x, y = y, colour = point),
  #            data = beziers)+
  theme(panel.background = element_rect(fill = "#0064A5",
                                        colour = "white"),
        plot.background = element_rect(fill = "#0064A5"),
        axis.line = element_line(colour = "white",
                                 linetype = "solid"),
        axis.ticks = element_line(colour = "white"),
        panel.grid.major = element_line(size = 0.2),
        panel.grid.minor = element_line(size = 0.2),
        axis.text = element_blank()
  )











# ================ future space dock or something

beziers2 <- data.frame(
  x = c(1, 7, 7, 4, 4, 6, 6), # 1, 2, 3, 4, 4, 6, 6
  y = c(0, 2, 0, 0, 2, 2, 0), # 0, 2, 0, 0, 2, 2, 0
  x2 = c(15, 9, 9, 7, 3, 3, 16),
  y2 = c(16, 17, 7, 5, 5, 12, 12),
  type = rep(c('cubic', 'quadratic'), c(3, 4)),
  point = c('end', 'control', 'end', 'end', 'control', 'control', 'end'),
  colour = letters[1:7]
)


ggplot(beziers2) +
  labs(x='', y='')+
  geom_bezier2(aes(x = x*7, 
                   y = y+ y^5, 
                   group = type, 
                   # colour = colour
                   show.legend=F
                   )
               )+
  geom_bezier2(aes(x = x*8, 
                   y = y^4, 
                   group = type, 
                   # colour = colour
                   show.legend=F )
  )+
  geom_bezier2(aes(x = x*x, 
                   y = y*4/y, 
                   group = type, 
                   # colour = colour
                   show.legend=F )
  )+
  geom_bezier2(aes(x = x*x+6,
                   y = y*7,
                   group = type,
                   # colour = colour
                   show.legend=F )
  )+
  geom_bezier2(aes(x = x*x+6,
                   y = y*7,
                   group = type,
                   # colour = colour
                   show.legend=F )
  )+
  # geom_bezier2(aes(x = x2,
  #                  y = y2,
  #                  group = type,
  #                  # colour = colour
  #                  show.legend=F )
  # )+
  theme(
    panel.background = element_rect(fill = "#0064A5",
                                    margin(2,2,2,2, unit = 'cm'),
                                        colour = "white"),
        plot.background = element_rect(fill = "#0064A5"),
        axis.line = element_line(colour = "white",
                                 linetype = "solid"),
        axis.ticks = element_line(colour = "white"),
        panel.grid.major = element_line(size = 0.2),
        panel.grid.minor = element_line(size = 0.2),
        axis.text = element_blank()
  )










