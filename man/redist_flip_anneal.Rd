% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/redist_flip_tidy.R
\name{redist_flip_anneal}
\alias{redist_flip_anneal}
\title{Flip MCMC Redistricting Simulator using Simulated Annealing}
\usage{
redist_flip_anneal(
  map,
  nsims,
  warmup = 0,
  init_plan = NULL,
  constraints = redist_constr(),
  num_hot_steps = 40000,
  num_annealing_steps = 60000,
  num_cold_steps = 20000,
  eprob = 0.05,
  lambda = 0,
  adapt_lambda = FALSE,
  adapt_eprob = FALSE,
  exact_mh = FALSE,
  maxiterrsg = 5000,
  verbose = TRUE
)
}
\arguments{
\item{map}{A \code{\link{redist_map}} object.}

\item{nsims}{The number of samples to draw, not including warmup.}

\item{warmup}{The number of warmup samples to discard.}

\item{init_plan}{A vector containing the congressional district labels
of each geographic unit. The default is \code{NULL}. If not provided,
a random initial plan will be generated using \code{redist_smc}. You can also
request to initialize using \code{redist.rsg} by supplying 'rsg', though this is
not recommended behavior.}

\item{constraints}{A \code{redist_constr} object.}

\item{num_hot_steps}{The number of steps to run the simulator at beta = 0.
Default is 40000.}

\item{num_annealing_steps}{The number of steps to run the simulator with
linearly changing beta schedule. Default is 60000}

\item{num_cold_steps}{The number of steps to run the simulator at beta = 1.
Default is 20000.}

\item{eprob}{The probability of keeping an edge connected. The
default is \code{0.05}.}

\item{lambda}{The parameter determining the number of swaps to attempt
each iteration of the algorithm. The number of swaps each iteration is
equal to Pois(\code{lambda}) + 1. The default is \code{0}.}

\item{adapt_lambda}{Whether to adaptively tune the lambda parameter so that the Metropolis-Hastings
acceptance probability falls between 20\% and 40\%. Default is FALSE.}

\item{adapt_eprob}{Whether to adaptively tune the edgecut probability parameter so that the
Metropolis-Hastings acceptance probability falls between 20\% and 40\%. Default is
FALSE.}

\item{exact_mh}{Whether to use the approximate (0) or exact (1)
Metropolis-Hastings ratio calculation for accept-reject rule. Default is FALSE.}

\item{maxiterrsg}{Maximum number of iterations for random seed-and-grow
algorithm to generate starting values. Default is 5000.}

\item{verbose}{Whether to print initialization statement.
Default is \code{TRUE}.}
}
\value{
redist_plans
}
\description{
\code{redist_flip_anneal} simulates congressional redistricting plans
using Markov chain Monte Carlo methods coupled with simulated annealing.
}
\concept{simulate}
