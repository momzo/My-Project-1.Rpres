

## dygraph time serie
library(rmarkdown)
library(dygraphs)
dygraph(nhtemp, main = "New Haven Temperatures") %>%
  dyRangeSelector(dateWindow = c("1920-01-01", "1960-01-01"))
  dySeries(label ="Temp(F)", color ="black") %>%
  dyShading(from ="1920-01-01", to ="1930-01-01", color = "#FFE6E6") %>%
  dyShading(from ="1940-01-01", to ="1950-01-01", color ="#CCEBD6")


