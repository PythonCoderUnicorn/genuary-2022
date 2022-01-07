
# ======= genuary day 18 -- VHS 

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


# --- what bar chart to do?
diamonds = diamonds

diamonds %>% 
  filter(price < 500) %>% 
  ggplot(
    aes(x= price,
        y= table)
  )+
  geom_col()


v = data.frame(
  x = 1:10,
  y= 1:10
)



# ============= used to make the bar chart plot then pasted onto Figma
v %>% 
  ggplot(
    aes(x=x,
        y=y)
  )+
  geom_col(fill='#070463')+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "#0000A2"))





