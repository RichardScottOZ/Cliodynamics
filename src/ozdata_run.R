
library(ozdata)

###get_ausmacrodata()
#The `ausmacrodata.org` contains macroeconomic data from the ABS and RBA. Every ausmacrodata series have unique ID and can be loaded either by using full URL or only series ID. The first argument is either full URL or ID. The subsequent argument specifies in what format data should be returned: `tibble`, `ts` or `xts`, whereas `ts` is a default format for quarterly data and `xts` for daily data.

#Load the job vacancies data in New South Wales between 1983-2017
# 'jvnswjvstoq' is a unique ID of this series
dat <- get_ausmacrodata('jvnswjvstoq')
#plot the series
library(xts)
class(dat)
plot(dat)

##Real gdp
realgdp <- get_ausmacrodata('gdpcknaasaq')
realgdp
periodicity(realgdp)
realgdpxts<- as.xts(realgdp)
realgdp_yearly <- to.yearly(realgdpxts)
write.csv(as.data.frame(realgdp_yearly),"data/ausmacrodata_realgdp.csv")

#estimated resident population
estrestpop <- get_ausmacrodata('erpapcsaoq')
periodicity(estrestpop)
estrestpopxts<- as.xts(estrestpop)
estrespop_yearly <- to.yearly(estrestpopxts)
write.csv(as.data.frame(estrespop_yearly),"data/ausmacrodata_estrespop.csv")

#current account
#http://ausmacrodata.org/series.php?id=cabpsqoq
currentaccount <- get_ausmacrodata('cabpsqoq')
periodicity(currentaccount)
currentaccount<- as.xts(currentaccount)
currentaccount_yearly <- to.yearly(currentaccount)
write.csv(as.data.frame(currentaccount_yearly),"data/ausmacrodata_currentaccount.csv")

#employed total - persons
#http://ausmacrodata.org/series.php?id=etpyossam
#etpyosom
employed <- get_ausmacrodata('etpyosom')
periodicity(employed)
employedxts <- as.xts(employed)
employed_yearly <- to.yearly(employedxts)
write.csv(as.data.frame(employed_yearly),"data/ausmacrodata_employed.csv")

#employment to population ratio
#http://ausmacrodata.org/series.php?id=eprpyosom2
employed_ratio <- get_ausmacrodata('eprpyosom2')
periodicity(employed_ratio)
employed_ratioxts <- as.xts(employed_ratio)
employed_ratio_yearly <- to.yearly(employed_ratioxts)
write.csv(as.data.frame(employed_ratio_yearly),"data/ausmacrodata_employed_ratio.csv")



