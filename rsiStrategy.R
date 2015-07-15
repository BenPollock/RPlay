nRSI <- 2
buyThresh <- 20
sellThresh <- 80

#quote means that the object will be obtained later
#Cl refers to close
add.indicator(strategy.st, name="RSI", arguments=list(price=quote(Cl(mktdata)),
                                                      n=nRSI), label="rsi")

add.signal(strategy.st, name="sigThreshold",
           arguments=list(column="rsi", threshold=buyThresh,
                          relationship="lt", cross=FALSE),
           label="longEntry")

add.signal(strategy.st, name="sigThreshold",
           arguments=list(column="rsi", threshold=sellThresh,
                          relationship="gt", cross=TRUE),
           label="longExit")

#For variable position sizing, osFUN=function
#For static, orderqty=""

add.rule(strategy.st, name="ruleSignal",
         arguments=list(sigcol="longEntry", sigval=TRUE, ordertype="market",
                        orderside="long", replace=FALSE, prefer="Open",
                        orderqty=tradeSize),
         type="enter", path.dep=TRUE)

add.rule(strategy.st, name="ruleSignal",
         arguments=list(sigcol="longExit", sigval=TRUE, orderqty="all",
                        ordertype="market", orderside="long",
                        replace=FALSE, prefer="Open"),
         type="exit", path.dep=TRUE)
