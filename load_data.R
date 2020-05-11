library(tidyverse)
library(wbstats)

# Inspired by 
# https://github.com/saghirb/Women-in-Parliament-Hex-Sticker

# Ubicar indicador de proporción de mujeres en parlamentos nacionales
mujeres_indicador <- wbsearch(pattern = "women in national parliaments")

# Obtener datos del indicador seleccionado
MeP_datos <- wb(indicator = as.character(mujeres_indicador[1]),
                startdate = 1990, enddate = 2019,
                # Sólo países de Suramérica
                country = c("ARG", "BOL", "BRA", "CHL", "COL", "ECU",
                            "PER", "PRY", "URY", "VEN"))

# Cambiar nombres a español
MeP_datos <- MeP_datos %>% 
  mutate(country = ifelse(country == "Peru", "Perú", country)) %>%
  mutate(country = ifelse(country == "Brazil", "Brasil", country)) %>%
  mutate(country = ifelse(country == "Venezuela, RB", "Venezuela", country))


