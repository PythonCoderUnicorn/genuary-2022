

# ===================== aRt

# https://www.thetidytrekker.com/post/thinking-outside-the-grid



library(tidyverse)
library(paletteer)


random_lines = tibble(
  x= sample(1:500, 50),
  y= 1:50
)

random_lines %>% 
  ggplot(
    aes(x=x,
        y=y,
        xend= median(x),
        yend= median(y),
        col= x
        )
  )+
  geom_segment()+
  scale_color_paletteer_c("gameofthrones::martell")+
  ggdark::dark_mode()




# a square consists of four lines.
# need to make four points on our plot, 2 values (x and y)= 4 x points and 4 y points
square <- tibble(x = c(0,5,5,0), 
                 y = c(0,0,5,5),
                 labels = 1:4)


# ------------------------ what not to use
square %>%
  ggplot(aes(x = x,
             y = y,
             label = labels))+
  geom_line()+
  geom_label()+
  coord_equal()+ ggdark::dark_mode()

square %>%
  ggplot(aes(x = x, y = y, label = labels))+
  geom_path()+
  geom_label()+
  coord_equal()+ggdark::dark_mode()
# ------------------------



square %>%
  ggplot(aes(x = x,
             y = y,
             label = labels))+
  geom_polygon(fill=NA, col='yellow')+
  geom_label()+
  coord_equal()+ggdark::dark_mode()




# ------------------
square_color_points <- tibble(x = c(0,5,5,0),
                              y = c(0,0,5,5),
                              colors = c("#c0d943","#027337","#d12017","#000a96"))

square_color_points %>%
  ggplot(aes(x = x,
             y = y))+
  geom_polygon(fill = "#4b1980")+
  geom_point(color = square_color_points$colors)+
  coord_equal()+ggdark::dark_mode()



square_color_points %>%
  ggplot(aes(x = x,
             y = y))+
  geom_polygon(fill = "#4b1980")+
  geom_point(color = square_color_points$colors,
             size = sample(1:20, nrow(square_color_points)))+
  coord_equal()+ggdark::dark_mode()







random_points <- tibble(x = 1:100,
                        y = sample(1:100))

## Example 8: ggplot of randomized points====
random_points %>%
  ggplot(aes(x=x, y=y))+
  geom_point()+ggdark::dark_mode()

## Example 8: ggplot of randomized points with randomized colors====
random_points %>%
  ggplot(aes(x=x, y=y))+
  geom_point(color = sample(RColorBrewer::brewer.pal(5,"PRGn"), 
                            nrow(random_points), 
                            replace = TRUE),
             size= runif(100, 5, 35)#--- my add -- bubbles !
             )+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))




random_points %>%
  ggplot(aes(x=x, y=y))+
  geom_point(color = ifelse(random_points$y < 70,
                            sample(RColorBrewer::brewer.pal(5,"PRGn"), 
                                   nrow(random_points), 
                                   replace = TRUE),
                            "green")
             )+
  theme_void()+
  ggdark::dark_mode()





# ---------------- expand function
fruits <- tibble(
  type   = c("apple", "orange", "apple", "orange", "orange", "orange"),
  year   = c(2010, 2010, 2012, 2010, 2010, 2012),
  size  =  factor(
    c("XS", "S",  "M", "S", "S", "M"),
    levels = c("XS", "S", "M", "L")
  ),
  weights = rnorm(6, as.numeric(size) + 2)
)

fruits %>% expand(type)
fruits %>% expand(type, size)
fruits %>% expand(type, size, year)

fruits %>% expand(nesting(type, size))
fruits %>% expand(nesting(type, size, year))

fruits %>% expand(type, size, full_seq(year, 1))
fruits %>% expand(type, size, 2010:2012)




# ====== planet quad

# install.packages('cowplot')
library(cowplot)
# install.packages('patchwork')
library(patchwork)

# star bg
Space_colors <- c("Topleft"="#000000",
                    "Topright"="#130321",
                    "Bottomleft"="#330500",
                    "Bottomright"="#8a4500")

stars <- tibble(crossing(x = seq(1,2000,100),
                         y = seq(1,2000,100)))

## Making the list to hold the "space" plots====
All_stars <- list()

## Iterating through the "space_colors" to make four different plots====
for(i in seq_along(Space_colors)){
  
  All_stars[[i]] <- stars %>%
    ggplot(aes(x = x, y = y))+
    geom_jitter(size = sample(c(.02,.04,.06,.8),nrow(stars), replace = TRUE), color = "white")+
    theme_void()+
    theme(plot.background = element_rect(fill = Space_colors[i], color = "#ffffff", size = 6)) 
}

## Naming the plots just to help keep track of what's going where====
names(All_stars) <- names(Space_colors)

# Planet Creations====
## Setting the color palettes for each planet quad====
Planet_colors <- list("Topleft" = c("#194157","#008dd7","#085b88","#26925e","#095c88"),
                      "Topright" = c("#480463","#392242","#1e0329","#bf9232","#120b17"),
                      "Bottomleft" = c("#47322d","#6b1c09","#a30000","#6b1d09","#851205"),
                      "Bottomright" = c("#c7a602","#998523","#ba690d","#755b3d","#dbab39"))

## Setting the colors of each planet's borders====
Planet_borders <- c("Topright" = "#333333",
                    "Topright" = "#120b17",
                    "Bottomleft" = "#260f09",
                    "Bottomright" = "#5c523a")

planet <- tibble(crossing(x = sample(1:1000,100, replace = TRUE),
                          y = sample(1:2000, 100, replace = TRUE)))


## Making the list to hold the "planet" plots====
All_planets <- list()

## Iterating through the "planet_colors" to make four different planet plots====
for(i in seq_along(Planet_colors)){
  
  All_planets[[i]] <- planet %>%
    ggplot(aes(x = x, y = y))+
    scale_fill_manual(values = sample(Planet_colors[[i]],100, replace = TRUE))+ #100 is just a arbitrary "safe" number I picked. geom_density does background calcs to create levels that varies based on data.
    geom_density2d_filled(color = Planet_borders[i], size = 2)+
    coord_polar(clip = "on")+
    theme_void()+
    theme(legend.position = "none")
}

names(All_planets) <- names(Planet_colors)

# Saving Planets into the directory====
for(i in seq_along(All_planets)){
  
  ggsave(paste0("planets/",
                names(All_planets)[i],
                "_planet.png"),
         All_planets[[i]],
         bg = "transparent", 
         device = "png")
}



# Loading Planets back into the environment as PNGs====
Planet_PNGs <- list()

for(i in seq_along(All_planets)){
  
  Planet_PNGs[[i]] <- png::readPNG(paste0("planets/",
                                          names(All_planets)[i],
                                          "_planet.png"))
}

## Setting names to keep track of the planets====
names(Planet_PNGs) <- names(All_planets)

# Combining both the stars and planets to create four plots in total====
Combined_plots <- list()

for(i in seq_along(All_planets)){
  
  Combined_plots[[i]] <- ggdraw(All_stars[[i]]) +
    draw_image(Planet_PNGs[[i]])
}

## Setting names to keep track of the plots===
names(Combined_plots) <- names(Planet_PNGs)

## Plucking out all the individual plots===
Topleft <- Combined_plots %>% pluck("Topleft")
Topright <- Combined_plots %>% pluck("Topright")
Bottomright <- Combined_plots %>% pluck("Bottomright")
Bottomleft <- Combined_plots %>% pluck("Bottomleft")

# Final output construction with patchwork functions====
Planet_Quad <- (Topleft + Topright) / (Bottomleft + Bottomright)

# View the piece#
Planet_Quad


























# ========= rainbow rose

## Angle "slices"/ Sine/Cosine Frequency====
theta <- seq(0, 40*pi, length = 100) 

## Number of divisions/rows in the data wanted====
n <- 500

## "Radial" setting of the "circle" to create "n" different marks====
r = 1:500

colors <- c("#af3918", "#a21152", "#822b75","#612884","#154baf",
            "#0b82b9", "#277e9d","#488e35","#e3a934","#b2336a")


# Placing everything into a dataset====
data <- tibble(x = cos(theta)*r,
               y = sin(theta)*r)

# Pulling it all together====
Rainbow_Rose <- data %>%
  ggplot(aes(x = x, y = y, color = color))+
  geom_path(color = rep(colors, each = n/10),
            size = 1)+
  theme_void()+
  theme(legend.position = "none",
        panel.background = element_rect(fill = "black"))

# View it #
Rainbow_Rose






