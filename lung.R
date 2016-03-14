
library(dygraphs)
library(RColorBrewer)

lungDeaths<-cbind(ldeaths, mdeaths, fdeaths)
dygraph(lungDeaths, main = "Deaths from lung  Diseease(UK") %>%
  dyOptions(stemPlot = TRUE)