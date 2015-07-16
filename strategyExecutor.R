t1 <- Sys.time()
out <- applyStrategy(strategy = strategy.st, portfolios = portfolio.st)
t2 <- Sys.time()

print(t2-t1)

updatePortf(portfolio.st)
dateRange <- time(getPortfolio(portfolio.st)$summary)[-1]
updateAcct(portfolio.st, dateRange)
updateEndEq(account.st)
