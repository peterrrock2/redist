% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_diagnostics.R
\name{redist.diagplot}
\alias{redist.diagplot}
\title{Diagnostic plotting functionality for MCMC redistricting.}
\usage{
redist.diagplot(sumstat,
plot = c("trace", "autocorr", "densplot", "mean", "gelmanrubin"),
logit = FALSE, savename = NULL)
}
\arguments{
\item{sumstat}{A vector, list, \code{mcmc} or \code{mcmc.list} object
containing a summary statistic of choice.}

\item{plot}{The type of diagnostic plot to generate: one of "trace",
"autocorr", "densplot", "mean", "gelmanrubin". If \code{plot = "gelmanrubin"},
the input \code{sumstat} must be of class \code{mcmc.list} or \code{list}.}

\item{logit}{Flag for whether to apply the logistic transformation for the
summary statistic. The default is \code{FALSE}.}

\item{savename}{Filename to save the plot. Default is \code{NULL}.}
}
\value{
Returns a plot of file type \code{.pdf}.
}
\description{
\code{redist.diagplot} generates several common MCMC diagnostic plots.
}
\details{
This function allows users to generate several standard diagnostic
plots from the MCMC literature, as implemented by Plummer et. al (2006).
Diagnostic plots implemented include trace plots, autocorrelation plots,
density plots, running means, and Gelman-Rubin convergence diagnostics
(Gelman & Rubin 1992).
}
\examples{
\donttest{
data(fl25)
data(fl25_enum)
data(fl25_adj)

## Get an initial partition
init_plan <- fl25_enum$plans[, 5118]

## 25 precinct, three districts - no pop constraint ##
alg_253 <- redist.flip(adj = fl25_adj, total_pop = fl25$pop,
    init_plan = init_plan, nsims = 10000)

## Get Republican Dissimilarity Index from simulations
rep_dmi_253 <- redist.segcalc(alg_253, fl25$mccain, fl25$pop)

## Generate diagnostic plots
redist.diagplot(rep_dmi_253, plot = "trace")
redist.diagplot(rep_dmi_253, plot = "autocorr")
redist.diagplot(rep_dmi_253, plot = "densplot")
redist.diagplot(rep_dmi_253, plot = "mean")

## Gelman Rubin needs two chains, so we run a second
alg_253_2 <- redist.flip(adj = fl25_adj,
    total_pop = fl25$pop,
    init_plan = init_plan, nsims = 10000)

rep_dmi_253_2 <- redist.segcalc(alg_253_2, fl25$mccain, fl25$pop)

## Make a list out of the objects:
rep_dmi_253_list <- list(rep_dmi_253, rep_dmi_253_2)

## Generate Gelman Rubin diagnostic plot
redist.diagplot(sumstat = rep_dmi_253_list, plot = "gelmanrubin")
}
}
\references{
Fifield, Benjamin, Michael Higgins, Kosuke Imai and Alexander
Tarr. (2016) "A New Automated Redistricting Simulator Using Markov Chain Monte
Carlo." Working Paper. Available at
\url{http://imai.princeton.edu/research/files/redist.pdf}.

Gelman, Andrew and Donald Rubin. (1992) "Inference from iterative simulations
using multiple sequences (with discussion)." Statistical Science.

Plummer, Martin, Nicky Best, Kate Cowles and Karen Vines. (2006) "CODA:
Convergence Diagnosis and Output Analysis for MCMC." R News.
}
\concept{plot}
