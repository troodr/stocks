library(renv)

.libPaths()

#options(renv.config.mran.enabled=TRUE)

getOption("repos")

sessionInfo()

renv::install("data.table@1.12.8",type="binary")
renv::install("xgboost@1.0.0.2",type="binary")

library(parallel)

detectCores(logical = FALSE)