required_packages <- c("gt",
                       "tidyverse",    #Set of packages for data science"
                       "gtExtras",
                       "dplyr",
                       "ggplot2")

for (pkg in required_packages){
  if (!requiredNamespace(pkg,quitely = TRUE)){
    stop(paste0("Package '",pkg,"' is required but is not installed."))
  }
}

load <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[,"Package"])]
  if (length(new.pkg))
    install.packages(new.pkg,dependencies = TRUE)
  sapply(pkg,require,character.only=TRUE)
}