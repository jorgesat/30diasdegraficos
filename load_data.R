library(tidyverse)
library(wbstats)

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
  mutate(Country.Region = ifelse(Country.Region == "Peru", "Perú", Country.Region)) %>%
  mutate(Country.Region = ifelse(Country.Region == "Brazil", "Brasil", Country.Region)) %>%
  mutate(Country.Region = ifelse(Country.Region == "Venezuela, RB", "Venezuela", Country.Region))


