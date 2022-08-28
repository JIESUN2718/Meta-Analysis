setwd("~/Desktop/Metadata/GBIF/2-南非大学标本馆")

library(tidyverse)
library(readr)
library(maps )


# https://www.r4epi.com/importing-plain-text-files.html
df <- read_delim ("verbatim.txt",delim  = "\t")


dim(df)

colnames(df)

# https://rstudio-pubs-static.s3.amazonaws.com/576093_5ea8c7b5464246cd989f082ae2bab9b0.html

df$ID <- df$gbifID

# geography with in 100 according to 29:16 video 2
df$lon <- df$decimalLongitude
df$lat <- df$decimalLatitude
df$miniElevation <- df$minimumElevationInMeters
df$maxiElevation <- df$maximumElevationInMeters
#df$class NA
#df$order <- df$order
#df$family <- df$family
# Do you need the value of "specificEpithet"
table(df$specificEpithet)

df$subfamily <- paste(df$genus ," ",df$specificEpithet)
# subgenus is NA




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




max(df$lon)
min(df$lon)


df <- df %>%
  select(ID,lon,lat,order,family) %>%
  filter(complete.cases(.))

dim(df)



str(df)

df <- df[,colSums(is.na(df))<nrow(df)]
str(df)



sum(is.na(df$infraspecificEpithet))










