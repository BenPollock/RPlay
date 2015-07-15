require(quantstrat)
require(quantmod)
require(PerformanceAnalytics)

from <- "2001-01-01"
to <- "2015-07-08"

options("getSymbols.warning4.0" = FALSE)

rm(list = ls(.blotter), envir = .blotter)

currency('CAD')
Sys.setenv(TZ = "UTC")

symbols <- c(
  "BB.TO",
  "BNS.TO",
  "CM.TO",
  "CNQ.TO",
  "CVE.TO",
  "CPG.TO",
  "ELD.TO",
  "G.TO",
  "IMO.TO",
  "L.TO",
  "MRU.TO",
  "NA.TO",
  "POT.TO",
  "SU.TO",
  "T.TO",
  "TD.TO",
  "VRX.TO"
)

#Get data if not present
#if(!"BB.TO" %in% ls()) {
#  print("not present");
#  print(ls())
  suppressMessages(getSymbols(symbols, from = from,
                              to = to, src = "yahoo", adjust = TRUE))
#}

stock(symbols, currency = "CAD", multiplier = 1)
