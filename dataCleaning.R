library(readr)
library(dplyr)
library(lubridate)
# BCCrashes <- read_csv("2015-2019 Crashes in BC.csv", 
#                                             col_types = cols(`Cyclist Flag` = col_character(), 
#                                                                        `Crash Count` = col_integer(),
#                                                                         Latitude = col_double(),
#                                                                         Longitude = col_double()))

BCCrashes <- read_csv("2015-2019 Crashes in BC.csv")
BCCrashes_time <- BCCrashes %>% mutate (time = format(ymd(paste0(`Date Of Loss Year`, `Month Of Year`, "01")), "%Y-%m"))
write_csv(BCCrashes_time, "BCCrashes.csv")


CyclistsCrashesVan <- BCCrashes %>% filter(`Cyclist Flag` == "Yes" & ((`Municipality Name` == "VANCOUVER") | (`Municipality Name` == "UBC"))) %>% mutate (time = format(ymd(paste0(`Date Of Loss Year`, `Month Of Year`, "01")), "%Y-%m")) %>% filter (!is.na(Longitude))
write_csv(CyclistsCrashesVan, "CyclistsCrashesVancouver.csv")


CyclistsCrashesBC <- BCCrashes %>% filter(`Cyclist Flag` == "Yes") %>% mutate (time = format(ymd(paste0(`Date Of Loss Year`, `Month Of Year`, "01")), "%m-%Y"))
write_csv(CyclistsCrashesBC, "CyclistsCrashesBC.csv")


allCrashesVan <- BCCrashes %>% filter((`Municipality Name` == "VANCOUVER") | (`Municipality Name` == "UBC")) %>% mutate (time = format(ymd(paste0(`Date Of Loss Year`, `Month Of Year`, "01")), "%Y-%m"))
write_csv(allCrashesVan, "allCrashesVancouver.csv")


allCrashesBCInjured <- BCCrashes %>% filter((`Municipality Name` == "VANCOUVER") | (`Municipality Name` == "UBC")) %>% filter(`Crash Severity`=="CASUALTY") %>% mutate (time = format(ymd(paste0(`Date Of Loss Year`, `Month Of Year`, "01")), "%Y-%m"))
write_csv(allCrashesBCInjured, "BCCrashesCasualty.csv")

