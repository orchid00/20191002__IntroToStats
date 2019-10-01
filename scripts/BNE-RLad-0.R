## Author: Paula Andrea Martinez
## Date: 2019-10-01

# install packages if they are not yet installed ----
list_of_packages <- c("agricolae", "emmeans", "pwr", "car", "carData")
new_packages <- list_of_packages[!(list_of_packages %in% installed.packages()[, "Package"])]
if (length(new_packages)) install.packages(new_packages)

# remove objects that we don't need anymore
rm(list_of_packages, new_packages)
