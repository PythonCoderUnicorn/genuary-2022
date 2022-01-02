
# TEMPLATE

library(tidyverse)
library(showtext)
library(paletteer)
library(ggtext)
library(magick)
library(imager)


font_add_google('Poppins','Poppins')
showtext_auto()


df = data.frame(
  x = runif(10e3, min = 0, max=100),
  y= runif(10e3, min = 0, max=100),
  z= runif(10e3, min = 0, max=100)
)









