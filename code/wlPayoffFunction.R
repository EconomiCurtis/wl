library(dplyr)
# weakest link
# Pi = e_hat - Beta * (e_i - e_hat)

e_hat = 7:0
e_i = 7:0
constant = .60
alpha = .25
beta = .10

system.time({
  Pi = data.frame(effort = 7:0)
  Pi[paste("alpha")] = alpha
  Pi[paste("beta")] = beta
  Pi[paste("const")] = constant
  colcnt = 1
  for (min_e in e_hat){
    
    Pi[paste("Min_", min_e, sep="")] = rep(NA, length(e_hat))
    # Pi[paste("c", min_e, sep="")] = constant + min_e - beta*(e_i-min_e) # beta = 0.1 -> alpha = 1.1 and beta = 0.1
    Pi[paste("Min_", min_e, sep="")] = constant + (alpha * min_e) - (beta * e_i)
    Pi[paste("Min_", min_e, sep="")][which((min_e > e_i)),] = NA
    colcnt = colcnt + 1
  }
  
  
  
})
Pi

#mild
# 20, 1, 60

#from lit: .2, .1, .6

#severe
# 20, 10, 60

# nikos: alpha .25,.10,.60 

# in other experiments, 20 points equals 0.2 euros
