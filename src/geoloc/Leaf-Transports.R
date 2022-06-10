# Exemple 1 : Open Data BCN: Servicio de datos abiertos del Ayuntamiento de Barcelona
# TRANSPORTS.csv

library(leaflet)
library(dplyr)
setwd("C:/Users/Alumne_mati1/Desktop/BigData/src/dat")
data <- read.csv('TRANSPORTS.csv')

data$popup = paste(data$NOM_CAPA, '</p>',
                   data$NOM_DISTRICTE, '</p>', 
                   data$NOM_BARRI)

#-- Canvi de colors : Forma 1 Creant una columna de color
data$mycolor = "red"
data <- data %>% mutate(mycolor =
                     case_when(CODI_CAPA == "K011" ~ "green", 
                               CODI_CAPA == "K010" ~ "navy",
                               CODI_CAPA == "K009" ~ "white",
                               CODI_CAPA == "K008" ~ "cyan",
                               CODI_CAPA == "K004" ~ "black",
                               CODI_CAPA == "K003" ~ "brown",
                               CODI_CAPA == "K002" ~ "yellow",                               
                               CODI_CAPA == "K001" ~ "pink")
)
# en el addMarker descomentar  color = ~mycolor,

#-- Canvi de colors : Forma 2 Creant un gradient

beatCol <- colorFactor(palette = 'RdYlGn', data$CODI_CAPA)
# en el addMarker descomentar  beatCol(CODI_CAPA)
#
leaflet(data = data[1:99,]) %>% addTiles() %>%

  addCircleMarkers(~LONGITUD, ~LATITUD, 
    label = ~EQUIPAMENT, 
    # color = ~mycolor,
    color = ~beatCol(CODI_CAPA),
    popup = ~popup, 
    radius = 5)
