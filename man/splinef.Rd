% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spline.R
\name{splinef}
\alias{splinef}
\title{Cubic Spline Forecast}
\usage{
splinef(y, h = 10, level = c(80, 95), fan = FALSE, lambda = NULL,
  biasadj = FALSE, method = c("gcv", "mle"), x = y)
}
\arguments{
\item{y}{a numeric vector or time series of class \code{ts}}

\item{h}{Number of periods for forecasting}

\item{level}{Confidence level for prediction intervals.}

\item{fan}{If TRUE, level is set to seq(51,99,by=3). This is suitable for
fan plots.}

\item{lambda}{Box-Cox transformation parameter. Ignored if NULL. Otherwise,
forecasts back-transformed via an inverse Box-Cox transformation.}

\item{biasadj}{Use adjusted back-transformed mean for Box-Cox
transformations. If TRUE, point forecasts and fitted values are mean
forecast. Otherwise, these points can be considered the median of the
forecast densities.}

\item{method}{Method for selecting the smoothing parameter. If
\code{method="gcv"}, the generalized cross-validation method from
\code{\link[stats]{smooth.spline}} is used. If \code{method="mle"}, the
maximum likelihood method from Hyndman et al (2002) is used.}

\item{x}{Deprecated. Included for backwards compatibility.}
}
\value{
An object of class "\code{forecast}".

The function \code{summary} is used to obtain and print a summary of the
results, while the function \code{plot} produces a plot of the forecasts and
prediction intervals.

The generic accessor functions \code{fitted.values} and \code{residuals}
extract useful features of the value returned by \code{splinef}.

An object of class \code{"forecast"} containing the following elements:
\item{model}{A list containing information about the fitted model}
\item{method}{The name of the forecasting method as a character string}
\item{mean}{Point forecasts as a time series} \item{lower}{Lower limits for
prediction intervals} \item{upper}{Upper limits for prediction intervals}
\item{level}{The confidence values associated with the prediction intervals}
\item{x}{The original time series (either \code{object} itself or the time
series used to create the model stored as \code{object}).}
\item{onestepf}{One-step forecasts from the fitted model.}
\item{fitted}{Smooth estimates of the fitted trend using all data.}
\item{residuals}{Residuals from the fitted model. That is x minus one-step
forecasts.}
}
\description{
Returns local linear forecasts and prediction intervals using cubic
smoothing splines.
}
\details{
The cubic smoothing spline model is equivalent to an ARIMA(0,2,2) model but
with a restricted parameter space. The advantage of the spline model over
the full ARIMA model is that it provides a smooth historical trend as well
as a linear forecast function. Hyndman, King, Pitrun, and Billah (2002) show
that the forecast performance of the method is hardly affected by the
restricted parameter space.
}
\examples{
fcast <- splinef(uspop,h=5)
plot(fcast)
summary(fcast)

}
\references{
Hyndman, King, Pitrun and Billah (2005) Local linear forecasts
using cubic smoothing splines. \emph{Australian and New Zealand Journal of
Statistics}, \bold{47}(1), 87-99.
\url{https://robjhyndman.com/publications/splinefcast/}.
}
\seealso{
\code{\link[stats]{smooth.spline}}, \code{\link[stats]{arima}},
\code{\link{holt}}.
}
\author{
Rob J Hyndman
}
\keyword{ts}
