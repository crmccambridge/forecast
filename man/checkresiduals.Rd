% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/checkresiduals.R
\name{checkresiduals}
\alias{checkresiduals}
\title{Check that residuals from a time series model look like white noise}
\usage{
checkresiduals(object, lag, df = NULL, test, plot = TRUE, ...)
}
\arguments{
\item{object}{Either a time series model, a forecast object, or a time
series (assumed to be residuals).}

\item{lag}{Number of lags to use in the Ljung-Box or Breusch-Godfrey test.
If missing, it is set to \code{max(10,df+3)} for non-seasonal data, and
\code{max(2m, df+3)} for seasonal data, where \code{df} is the degrees of
freedom of the model, and \code{m} is the seasonal period of the data.}

\item{df}{Number of degrees of freedom for fitted model, required for the
Ljung-Box or Breusch-Godfrey test. Ignored if the degrees of freedom can be
extracted from \code{object}.}

\item{test}{Test to use for serial correlation. By default, if \code{object}
is of class \code{lm}, then \code{test="BG"}. Otherwise, \code{test="LB"}.
Setting \code{test=FALSE} will prevent the test results being printed.}

\item{plot}{Logical. If \code{TRUE}, will produce the plot.}

\item{...}{Other arguments are passed to \code{\link{ggtsdisplay}}.}
}
\value{
None
}
\description{
If \code{plot=TRUE}, produces a time plot of the residuals, the
corresponding ACF, and a histogram. If the degrees of freedom for the model
can be determined and \code{test} is not \code{FALSE}, the output from
either a Ljung-Box test or Breusch-Godfrey test is printed.
}
\examples{

fit <- ets(WWWusage)
checkresiduals(fit)

}
\seealso{
\code{\link{ggtsdisplay}}, \code{\link[stats]{Box.test}},
\code{\link[lmtest]{bgtest}}
}
\author{
Rob J Hyndman
}
