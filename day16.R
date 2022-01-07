

# ========== day 16 color gradients
library(tidyverse)
library(showtext)
library(paletteer)
library(ggtext)
library(magick)
library(imager)
library(ggfx)
library(ggfx)
library(ggforce)


# https://statisticsglobe.com/find-transparent-equivalent-of-color-in-r


library(systemfonts)

theme_set(theme_bw(base_family = "Lato"))



my.color = "#30b389"

# use the scales pkg
scales::show_col(my.color, labels = T, borders = 'black')

my.color.alpha = adjustcolor(my.color, alpha.f = 0.2)
scales::show_col( c(my.color, my.color.alpha),
                  labels = F, 
                  borders = 'black')


my.color.alpha.all = character()
i = NULL
for (i in 1:20) {
  my.color.alpha.all[i] = adjustcolor(
    my.color,
    alpha.f = i/20
  )
}
my.color.alpha.all

scales::show_col(my.color.alpha.all, labels = F)
  








df = data.frame(
  x = runif(100, min = 1, max=100),
  y= runif(100, min = 1, max=100),
  z= runif(100, min = 1, max=100)
)
#  aes(x0= 1, y0=2, r=67, start=44, end=89)
df %>% 
  ggplot(
    aes(x=x,
        y=y,
        color= z, fill= z)
  )+
  geom_jitter()+
  scale_color_viridis_c(option = 'B')+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))













df <- data.frame(x = c("a", "b", "c", "d"), y = c(3, 4, 1, 2))
bars <- ggplot(df, aes(x, y, fill = x)) + 
  geom_bar(stat = "identity") + 
  labs(x = NULL, y = NULL) +
  theme(legend.position = "none")

bars +
  
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))










# =================== scale gradient ugly / wrong

sp <- ggplot(iris, 
             aes(x= Sepal.Length, 
                 y= Sepal.Width,
                 color = Sepal.Length
                 )
             )+
  geom_point(size=5 )

mid <- mean(iris$Sepal.Length)

sp +
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))+
  scale_color_gradient2(midpoint = mid, 
                        low = "#542d2d",
                        mid = "#594343",
                        high = "#444359"
                        )




