library(gghighlight)
library(ggrepel)
library(ggflags)
library(ggsci)
library(hrbrthemes)
library(tidyverse)

rm(list=ls())
source("load_data.R") # Cargar datos

# Parámetros
tipo_grafico <- "líneas"
fecha <- "2020_05_13"

# Modificar datos para el propósito
# MeP_grafico <- MeP_datos %>%
#   filter(date == "2019")

# Gráfico
MeP_gg <- ggplot(MeP_datos, aes(x = as.numeric(date), y = value, 
                                color = as.factor(country))) +
  theme_ipsum_rc(subtitle_family = "Roboto Condensed") +
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    plot.margin = margin(3,4,3,3,"mm"),
  ) +
  scale_color_d3(name = "País") +
  xlab("Año") + ylab("% de mujeres en el parlamento") +
  labs(title = "Porcentaje de mujeres en el parlamento nacional",
       subtitle = paste0("1990 a 2019"),
       caption = paste0("kumulonimb.us | CC-BY 1.0.\nFuente de datos: Banco Mundial")) +
  geom_line(size = 2)

print(MeP_gg)

ggsave(paste0(fecha, "/", fecha, "_30DdG_", tipo_grafico, ".png"),
       width=6, height=6)
