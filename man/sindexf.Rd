% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/season.R
\name{sindexf}
\alias{sindexf}
\title{Forecast seasonal index}
\usage{
sindexf(object, h)
}
\arguments{
\item{object}{Output from \code{\link[stats]{decompose}} or
\link[stats]{stl}.}

\item{h}{Number of periods ahead to forecast}
}
\value{
Time series
}
\description{
Returns vector containing the seasonal index for \code{h} future periods. If
the seasonal index is non-periodic, it uses the last values of the index.
}
\examples{
uk.stl <- stl(UKDriverDeaths,"periodic")
uk.sa <- seasadj(uk.stl)
uk.fcast <- holt(uk.sa,36)
seasf <- sindexf(uk.stl,36)
uk.fcast$mean <- uk.fcast$mean + seasf
uk.fcast$lower <- uk.fcast$lower + cbind(seasf,seasf)
uk.fcast$upper <- uk.fcast$upper + cbind(seasf,seasf)
uk.fcast$x <- UKDriverDeaths
plot(uk.fcast,main="Forecasts from Holt's method with seasonal adjustment")

}
\author{
Rob J Hyndman
}
\keyword{ts}
