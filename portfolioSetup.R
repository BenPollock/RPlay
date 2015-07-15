#TODO: remove use of global variables
tradeSize <- 1000
initialEq <- 100000

strategy.st <- portfolio.st <- account.st <- "Testing"

#TODO: put this somewhere else
initDate <- "2000-01-01"
from <- "2015-07-08"
options(width=70)

rm.strat(strategy.st)
initPortf(portfolio.st, symbols=symbols, initDate=initDate, currency='CAD')
initAcct(account.st, portfolios=portfolio.st, initDate=initDate, currency='CAD', initEq=initialEq)
initOrders(portfolio.st, initDate=initDate)
strategy(strategy.st, store=TRUE)
