#auxilliary mean function
aux_mean <- function(trials, prob) {
  mean <- trials*prob
  return(mean)
}

#auxilliary variance function
aux_variance <- function(trials, prob) {
  var <- trials*prob*(1-prob)
  return(var)
}

#auxilliary mode function
aux_mode <- function(trials, prob) {
  mode <- floor(prob*(trials + 1))
  return(mode)
}

#auxilliary skewness function
aux_skewness <- function(trials, prob) {
  skew <- (1 - 2*prob)/(sqrt(trials*prob*(1-prob)))
  return(skew)
}

#auxilliary Kurtosis function
aux_kurtosis <- function(trials, prob) {
  kurt <- (1 - 6*prob*(1-prob))/(trials*prob*(1-prob))
  return(kurt)
}

aux_kurtosis(10, 0.3)
