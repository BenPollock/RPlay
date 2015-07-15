tStats <- tradeStats(Portfolios = portfolio.st, use = "trades",
  inclZeroDays = FALSE)
tStats[, 4:ncol(tStats)] <- round(tStats[, 4:ncol(tStats)], 2)

print(data.frame(t(tStats[,-c(1,2)])))
aggPF <- sum(tStats$Gross.Profits) / -sum(tStats$Gross.Losses)
aggCorrect <- mean(tStats$Percent.Positive)
numTrades <- sum(tStats$Num.Trades)
meanAvgWLR <- mean(tStats$Avg.WinLoss.Ratio[
  tStats$Avg.WinLoss.Ratio < Inf], na.rm = TRUE)


instRets <- PortfReturns(account.st)
portfRets <- xts(rowMeans(instRets) * ncol(instRets), order.by = index(instRets))
portfRets <- portfRets[!is.na(portfRets)]
cumPortfRets <- cumprod(1 + portfRets)
firstNonZeroDay <- as.character(index(portfRets)[
min(which(portfRets != 0))])
# Obtain symbol
getSymbols("XIU.TO", from = firstNonZeroDay, to = to)
SPYrets <- diff(log(Cl(XIU.TO)))[-1]
cumSPYrets <- cumprod(1 + SPYrets)
#comparison <- cbind(cumPortfRets, cumSPYrets)
#colnames(comparison) <- c("strategy", "TSX")
chart.TimeSeries(cumPortfRets, legend.loc = "topleft", colors=c("green", "red"))

#instRets <- PortfReturns(account.st)

#portfRets <- xts(rowMeans(instRets) * ncol(instRets),
# order.by = index(instRets))
#portfRets <- portfRets[!is.na(portfRets)]
#cumPortfRets <- cumprod(1 + portfRets)
#firstNonZeroDay <- as.character(index(portfRets)[min(which(portfRets != 0))])

#getSymbols("XIU.TO", from = firstNonZeroDay, to = to)
print("1");
#SPYrets <- diff(log(Cl(XIU.TO)))[-1]
print("2");
#cumSPYrets <- cumprod(1 + SPYrets)
print("3");
#comparison <- cbind(cumPortfRets, cumSPYrets)
print("4");
#colnames(comparison) <- c("strategy", "TSX")
print("5");
#chart.TimeSeries(comparison, legend.loc = "topleft", colors=c("green", "red"))
