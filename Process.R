rm(list = ls())

library(tidyverse)
library(readr)
library(maps )

setwd("~/Desktop/k2208198/Meta-Analysis")
# https://www.r4epi.com/importing-plain-text-files.html
df <- read_delim ("GBIF2.txt",delim  = "\t")


dim(df)

# colnames(df)

# https://rstudio-pubs-static.s3.amazonaws.com/576093_5ea8c7b5464246cd989f082ae2bab9b0.html

df <- df[,colSums(is.na(df))<nrow(df)]

df <- df %>%
  select(gbifID,individualCount,locality,verbatimElevation,decimalLatitude,decimalLongitude,
         scientificName,
         order,family,genus) %>%
  filter(complete.cases(.))

df %>% group_by(genus) %>%
  select(genus)

unique(df$scientificName)

df %>%  group_by(genus) %>% select(genus,scientificName)

# Scarabaeinae,Aphodiinae,Geotrupidae
unique(df$genus)

#count <- list('Onthophagus',)

df[df$genus=='Kurtops']


colnames(df)





df$subfamily <- paste(df$genus ," ",df$specificEpithet)
# subgenus is NA
plot(df$decimalLongitude,df$decimalLatitude)



map(database = 'world',
    xlim = c(min(df$lon)-0.2,max(df$lon)+0.2),
    ylim = c(min(df$lat)-0.2,max(df$lat)+0.2),
    fill = T,
    col = 'light grey'
    )

points(df$lon,
       df$lat,
       col = "orange",
       pch = 20,
       cex = 0.7)










plot(df$decimalLongitude,df$decimalLatitude)

dim(df)



str(df)








#https://stackoverflow.com/questions/69158910/keeping-2-digits-after-decimal-without-rounding-off






