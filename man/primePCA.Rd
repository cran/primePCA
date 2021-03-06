% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/code_full_new.R
\name{primePCA}
\alias{primePCA}
\title{primePCA algorithm}
\usage{
primePCA(
  X,
  K,
  V_init = NULL,
  thresh_sigma = 10,
  max_iter = 1000,
  thresh_convergence = 1e-05,
  thresh_als = 1e-10,
  trace.it = F,
  prob = 1,
  save_file = "",
  center = T,
  normalize = F
)
}
\arguments{
\item{X}{an \eqn{n}-by-\eqn{d} data matrix with \code{NA} values}

\item{K}{the number of the principal components of interest}

\item{V_init}{an initial estimate of the top \eqn{K} eigenspaces of the covariance matrix of \code{X}.
By default, primePCA will be initialized by the inverse probability method.}

\item{thresh_sigma}{used to select the "good" rows of \eqn{X} to update the principal eigenspaces \eqn{\sigma_*} in the paper).}

\item{max_iter}{maximum number of iterations of refinement}

\item{thresh_convergence}{The algorithm is halted if the Frobenius-norm sine-theta distance between the two consecutive iterates}

\item{thresh_als}{This is fed into \code{thresh} in \code{svd.als} of
\code{softImpute}.   
is less than \code{thresh_convergence}.}

\item{trace.it}{report the progress if \code{trace.it} = \code{TRUE}}

\item{prob}{probability of reserving the "good" rows. \code{prob == 1} means to reserve all the "good" rows.}

\item{save_file}{the location that saves the intermediate results, including \code{V_cur}, \code{step_cur} and \code{loss_all}, 
which are introduced in the section of returned values. The algorithm will not save any intermediate result 
if \code{save_file == ""}.}

\item{center}{center each column of \code{X} if \code{center == TRUE}. 
The default value is \code{TRUE}.}

\item{normalize}{normalize each column of \code{X} such that its sample variance is 1 if \code{normalize == TRUE}. 
The default value is \code{False}.}
}
\value{
a list is returned, with components \code{V_cur}, \code{step_cur} and \code{loss_all}. 
\code{V_cur} is a \eqn{d}-by-\eqn{K} matrix of the top \eqn{K} eigenvectors. \code{step_cur} is the number of iterations. 
\code{loss_all} is an array of the trajectory of MSE.
}
\description{
primePCA algorithm
}
\examples{
X <- matrix(1:30 + .1 * rnorm(30), 10, 3)
X[1, 1] <- NA
X[2, 3] <- NA
v_tilde <- primePCA(X, 1)$V_cur
}
