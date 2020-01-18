### DEFINE LIBRARIES ---
library("dplyr")

### FUNCTION: stdevBetween() ----
stdevBetween <- function(dat.grp, m.obs, n.grp){
     list.df <- list()
     
     # LOOP BY GROUP
     for(i in 1:n.grp){
          m.grp <- dat.grp$Mean[i]
          n.freq <- dat.grp$Freq[i]
          
          list.df[i] <- (m.grp - m.obs)^2 * n.freq
     }
     
     # COMPILE OVERALL RESULTS ---
     sd_betweem <- sqrt((do.call(sum, list.df)) / (n.grp - 1))
     
     return(sd_betweem)
}


### FUNCTION: stdevWithin() ----
stdevWithin <- function(dat, dat.grp, n.grp){
     list.dm <- list()
     
     # LOOP BY GROUP
     for(i in 1:n.grp){
          # GET GROUP SUMMARY ---
          m.grp <- dat.grp$Mean[i]
          n.freq <- dat.grp$Freq[i]
          
          # SUBSET DATA BY GROUP ---
          dat.sub <- subset(dat, dat$Group == unique(dat$Group)[i])
          
          # LOOP BY GROUP OBSERVATION ---
          list.df <- list()
          
          for(j in 1:n.freq){
               x_obs <- dat.sub$Observation[j]
               
               list.df[[j]] <- (x_obs - m.grp)^2

          }
          
          # COMPILE GROUP RESULT ---
          list.dm[[i]] <- do.call(sum, list.df) / (n.freq - 1)
     }
     
     # COMPILE OVERALL RESULTS ---
     sd_within <- sqrt(do.call(sum, list.dm))
     
     return(sd_within)
}



### FUNCTION: getStdDev.Decomposition() ---
getStdDev.Decomposition <- function(dat){
     # FACTORIZE DATA ---
     dat$Group <- factor(dat$Group, levels=unique(dat$Group))
     
     # DATA SUMMARY ---
     n.obs <- length(dat$Observation)
     m.obs <- mean(dat$Observation)
     n.grp <- length(unique(dat$Group))
     
     # CALCULATE GROUP MEANS ---
     dat.grp <- dat %>% 
          dplyr::group_by(Group) %>%
          summarize(Mean = mean(Observation, na.rm=TRUE), Freq=n()) 
     
     # STANDARD DEVIATION BETWEEN ---
     sd_between <- stdevBetween(dat.grp, m.obs, n.grp)
     
     # STANDARD DEVIATION WITHIN ---
     sd_within <- stdevWithin(dat, dat.grp, n.grp)

     # RETURN RESULTS ---     
     list.res <- list(Standard_Deviation_Between_Groups=sd_between,  
                      Standard_Deviation_Within_Groups=sd_within)
     
     return(list.res)
}
