% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rgb2hex.R
\name{rgb2hex}
\alias{rgb2hex}
\title{RGB to Hex Color Conversion}
\usage{
rgb2hex(col, maxColorValue = 255)
}
\arguments{
\item{col}{An integer matrix with three ("red", "green", and "blue") or four
("alpha") rows and one column for each color in \code{col}. Values are in
[0,M], where M is \code{maxColorValue}.}

\item{maxColorValue}{number giving the maximum value for each of the color
components in \code{col} (default: \code{255})}
}
\value{
The colors as hexadecimal strings
}
\description{
Convert matrices containing red, green, blue, and alpha
(optional) values into hex color strings.
}
\examples{
# Get the hex color code for "orange"
rgb2hex(col2rgb("orange"))

}
\seealso{
\code{\link[grDevices]{col2rgb}} for translating \R colors to RGB
vectors
}

