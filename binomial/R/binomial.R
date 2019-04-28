#private function to check if an input prob is a valid probablility
check_prob <- function(prob){
  if(min(prob) >= 0 & max(prob) <= 1){
    return(TRUE)
  } else {
    stop("invalid prob value")
  }
}

#private function to check if an input trials is a non-negative integer
check_trials <- function(trials) {
  if(min(trials) >= 0) {
    if(sum(trials %% 1 == 0) == length(trials)) {
      return(TRUE)
    } else {
      stop("trials must be an integer value")
    }
  } else {
    stop('trials must be non-negative')
  }
}

#private function to check if an input success is a non-negative integer less than n
check_success <- function(success, trials) {
  if(sum(success %% 1 == 0) == length(success)) {
    if(min(success) >= 0){
      if(max(success) <= trials){
        return(TRUE)
      } else {
        stop("invalid success value")
      }
    } else {
      stop("invalid success value")
    }
  } else {
    stop("invalid success value")
  }
}


#' @title Binomial Choose function
#' @description a ground up choose function using factorial
#' @param n the number of trials
#' @param k the number of successes
#' @export
#' @examples bin_choose(n = 5, k = 2)
#' @examples bin_choose(5, 0)
#' @examples bin_choose(5, 1:3)
bin_choose <- function(n, k) {
  if(n >= max(k)) {
    choose <- factorial(n)/(factorial(k)*factorial(n-k))
    return(choose)
  } else {
    stop('n must be greater than k')
  }
}

#' @title Binomial probability function
#' @description the probability of a given outcome of a binomial task
#' @param success the number of successes
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @export
#' @examples bin_probability(success = 2, trials = 5, prob = 0.5)
#' @examples bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' @examples bin_probability(success = 55, trials = 100, prob = 0.45)
bin_probability <- function(success, trials, prob) {
  if(check_trials(trials = trials) == TRUE) {
    if(check_prob(prob = prob) == TRUE) {
      if(check_success(success = success, trials = trials) == TRUE) {
        bin_prob <- bin_choose(n = trials, k = success)*(prob^success)*((1-prob)^(trials - success))
        return(bin_prob)
      } else {
        stop("invalid success value")
      }
    } else {
      stop("invalid prob value")
    }
  } else {
    stop("invalid trials value")
  }
}

#' @title Binomial probability distribution
#' @description the probability of all possible outcomes of a binomial task
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @export
#' @examples bin_distribution(trials = 5, prob = 0.5)
bin_distribution <- function(trials, prob) {
  success <- c()
  probability <- c()
  i = 0
  for(i in 0:trials) {
    success <- c(success, i)
    probability <- c(probability, bin_probability(success = i, trials = trials, prob = prob))
    i <- i + 1
  }

  bindis <- data.frame(
    success = success,
    probability = probability
  )
  class(bindis) = c("bindis", "data.frame")
  return(bindis)
}

#' @export
plot.bindis <- function(bindis) {
  dis1 <- bindis
  barplot(height = dis1$probability, names.arg = dis1$success ,xlab = "successes", ylab = "probability")
}
#dis1 <- bin_distribution(trials = 5, prob = 0.5)
#barplot(height = dis1$probability, names.arg = dis1$success ,xlab = "successes", ylab = "probability")

#' @title Binomial cumulative density function
#' @description the probability of all possible outcomes of a binomial task summed with all less than that value
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @export
#' @examples bin_cumulative(trials = 5, prob = 0.5)

bin_cumulative <- function(trials, prob) {
  df <- bin_distribution(trials = trials, prob = prob)
  cumulative <- c()
  for(i in 0:trials) {
    cumulative <- c(cumulative, sum(df$probability[0:(i +1)]))
  }
  df1 <- data.frame(
    df,
    cumulative = cumulative
  )
  class(df1) = c("bincum", "data.frame")
  return(df1)
}

#' @export
plot.bincum <- function(bincum) {
  dis2 <- bincum
  plot(x = dis2$success, y = dis2$cumulative, xlab = "successes", ylab = "probability")
  lines(x = dis2$success, y = dis2$cumulative)
}


#' @title Binomial variable function
#' @description returns a list of trials and the probability of success
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @export
#' @examples bin_variable(trials = 10, prob = 0.3)

bin_variable <- function(trials, prob) {
  binlist <- list(
    trials = trials,
    prob = prob
  )
  class(binlist) = "binvar"
  return(binlist)
}

#' @export
 print.binvar <- function(x, ...) {
   cat('"Binomial variable"\n')
   cat("\n")
   cat('Parameters \n')
   cat(sprintf('- number of trials : '), x$trials, '\n')
   cat(sprintf('- prob of success : '), x$prob)
   invisible(x)
  }

#' @export
summary.binvar <- function(binvar){
  binsum <- list(
    trials = binvar$trials,
    prob = binvar$prob,
    mean = aux_mean(trials = binvar$trials, prob = binvar$prob),
    variance = aux_variance(trials = binvar$trials, prob = binvar$prob),
    mode = aux_mode(trials = binvar$trials, prob = binvar$prob),
    skewness = aux_skewness(trials = binvar$trials, prob = binvar$prob),
    kurtosis = aux_kurtosis(trials = binvar$trials, prob = binvar$prob)
  )
  class(binsum) <- "summary.binvar"
  return(binsum)
}

#' @export
print.summary.binvar <- function(x, ...) {
  cat('" Summary Binomial"\n')
  cat("\n")
  cat('Parameters \n')
  cat(sprintf('- number of trials : '), x$trials, '\n')
  cat(sprintf('- prob of success : '), x$prob)
  cat("\n")
  cat('Measures \n')
  cat(sprintf('- mean     : '), x$mean, '\n')
  cat(sprintf('- variance : '), x$variance, '\n')
  cat(sprintf('- mode     : '), x$mode, '\n')
  cat(sprintf('- skewness : '), x$skewness, '\n')
  cat(sprintf('- kurtosis : '), x$kurtosis)
  invisible(x)
}


#' @title Binomial mean
#' @description mean of a binomial distribution
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @export
#' @examples bin_mean(10, 0.3)
bin_mean <- function(trials, prob) {
  if(check_trials(trials) == TRUE){
    if(check_prob(prob) == TRUE) {
      mean <- aux_mean(trials = trials, prob = prob)
      return(mean)
    } else {
      stop("ivalid prob value")
    }
  } else {
    stop("ivalid trials value")
  }
}


#' @title Binomial mode
#' @description mode of a binomial distribution
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @export
#' @examples bin_mode(10, 0.3)
bin_mode <- function(trials, prob) {
  if(check_trials(trials) == TRUE){
    if(check_prob(prob) == TRUE) {
      mode <- aux_mode(trials = trials, prob = prob)
      return(mode)
    } else {
      stop("ivalid prob value")
    }
  } else {
    stop("ivalid trials value")
  }
}


#' @title Binomial variance
#' @description variance of a binomial distribution
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @export
#' @examples bin_variance(10, 0.3)
bin_variance <- function(trials, prob) {
  if(check_trials(trials) == TRUE){
    if(check_prob(prob) == TRUE) {
      variance <- aux_variance(trials = trials, prob = prob)
      return(variance)
    } else {
      stop("ivalid prob value")
    }
  } else {
    stop("ivalid trials value")
  }
}


#' @title Binomial skewness
#' @description skewness of a binomial distribution
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @export
#' @examples bin_skewness(10, 0.3)
bin_skewness <- function(trials, prob) {
  if(check_trials(trials) == TRUE){
    if(check_prob(prob) == TRUE) {
      skewness <- aux_skewness(trials = trials, prob = prob)
      return(skewness)
    } else {
      stop("ivalid prob value")
    }
  } else {
    stop("ivalid trials value")
  }
}


#' @title Binomial kurtosis
#' @description kurtosis of a binomial distribution
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @export
#' @examples bin_kurtosis(10, 0.3)
bin_kurtosis <- function(trials, prob) {
  if(check_trials(trials) == TRUE){
    if(check_prob(prob) == TRUE) {
      kurtosis <- aux_kurtosis(trials = trials, prob = prob)
      return(kurtosis)
    } else {
      stop("ivalid prob value")
    }
  } else {
    stop("ivalid trials value")
  }
}







