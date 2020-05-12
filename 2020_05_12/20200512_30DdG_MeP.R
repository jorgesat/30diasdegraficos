library(gghighlight)
library(ggrepel)
library(ggflags)
library(hrbrthemes)
library(tidyverse)

rm(list=ls())
source("load_data.R") # Cargar datos

# Parámetros
tipo_grafico <- "barras"
fecha <- "2020_05_12"

# Modificar datos para el propósito
MeP_grafico <- MeP_datos %>%
  filter(date == "2019")

# Gráfico
MeP_gg <- ggplot(MeP_grafico, aes(x = reorder(country, value), y = value)) +
  coord_flip() +
  theme_ipsum_rc(subtitle_family = "Roboto Condensed") +
  theme(
    panel.grid.minor = element_blank(),
    # panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    plot.margin = margin(3,4,3,3,"mm"),
  ) +
  labs(title = "Porcentaje de mujeres en el parlamento nacional",
       subtitle = paste0("Al año 2019 en naciones de América del Sur"),
       caption = paste0("kumulonimb.us | CC-BY 1.0.\nFuente de datos: Banco Mundial")) +
  geom_bar(stat = "identity", fill = "#5CAB7D", colour = "#FFFFFF00") +
  geom_text(size = 4,
            aes(label = formatC(round(value, digits = 1), decimal.mark = ",")),
                hjust= 1.2, color="white", family = "Roboto Condensed") +
  geom_flag(y = -1.5, aes(country = tolower(iso2c)), size = 4)

# print(MeP_gg) 

ggsave(paste0(fecha, "/", fecha, "_30DdG_", tipo_grafico, ".png"),
       width=6, height=6)
