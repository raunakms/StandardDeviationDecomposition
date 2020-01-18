### DEFINE PATH ---
dir.wrk <- getwd()

### DEFINE FILE ---
file.dat <- file.path(dir.wrk, "dummy_observations.tsv")

### LOAD DATA ---
dat <- read.delim(file.dat, header=TRUE, stringsAsFactors=FALSE)

### RUN STANDARD DEVIATION DECOMPOSITON ---
source("standard_deviation_decomposition.R")
getStdDev.Decomposition(dat=dat)

