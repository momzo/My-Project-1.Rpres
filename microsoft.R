
library(quantmod)
library(dygraphs)

quantmod::getSymbols("MSFT", from ="2014-06-01", auto.assign = TRUE)

ret =ROC(MSFT[, 4])
mn = mean(ret, na.rm = TRUE)
sdt = sd(ret, na.rm = TRUE)
dygraph(ret, main = "Microsoft Share Price") %>%
  dySeries("MSFT.Close", label ="MSFT") %>%
  dyShading(from = mn - sdt, to = mn + sdt, axis ="y")