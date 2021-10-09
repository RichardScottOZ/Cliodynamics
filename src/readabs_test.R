#install.packages("readabs")
install.packages("tidyquant")

library(readabs)
library(ozdata)
library(lubridate)
library(xts)
library(tidyverse)

Sys.setenv(R_READABS_PATH = "C:/Users/rscott/OneDrive - OZ Minerals/Exploration2021/Cliodynamics/data")

#abs time series
#https://www.abs.gov.au/websitedbs/D3310114.nsf/home/Time+Series+Directory+-+URL+formula+instructions+for+access+to+Time+Series+Metadata

awe <- read_awe()
#class(awe$date)

awexts <- xts(awe[,4],awe$date)
aws_yearly <- to.period(awexts, period="years")
write.csv(as.data.frame(aws_yearly),"data/abs_average_weekly_earnings.csv")



demography <- read_abs("3101.0")

demography
population <- read_abs("3218.0")

write.csv(as.data.frame(demography),"data/abs_demography.csv")

#population_trends <- download_abs_data_cube("3201.0")
#population_trends <- read_abs("3201.0")
#population_old <- download_abs_data_cube("3212.0")

empearn <- read_abs("6306.0")
empearn <- download_abs_data_cube("6306.0")

yearbook <- read_abs("1301.0")
yearbook <- download_abs_data_cube("1301.0")

labour <- read_abs("6202.0")
#he <- download_abs_data_cube("6227.0")

write.csv(as.data.frame(labour),"data/abs_labour.csv")

head(labour)
