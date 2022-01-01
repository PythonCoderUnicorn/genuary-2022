
# Genuary 2022 - 1

library(tidyverse)
library(paletteer)

df = data.frame(
  x = runif(10e3, min = 0, max=100),
  y= runif(10e3, min = 0, max=100),
  z= runif(10e3, min = 0, max=100)
)

ggplot(
  df,
  aes(x= x,
      y=y,
      col= z)
)+
  geom_point(show.legend = FALSE)+
  scale_color_paletteer_c("gameofthrones::martell")+
  theme_void()
  
  
  
  
  
  
  
  
  
  