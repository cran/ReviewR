% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_REDCap.R
\name{redcap_connection}
\alias{redcap_connection}
\title{REDCap Connection}
\usage{
redcap_connection(url, token)
}
\arguments{
\item{url}{A string containing the https URL for your institution's REDCap API.}

\item{token}{A string containing the API token for your REDCap project.}
}
\value{
A redcapAPI connection object if the URL and API token are correct
( See: \link[redcapAPI:redcapConnection]{redcapAPI::redcapConnection} ). Else, return diagnostic error.
}
\description{
\subsection{Overview}{

A 'safe' wrapper for \code{\link[redcapAPI:redcapConnection]{redcapAPI::redcapConnection()}}. Will return diagnostic
error codes in case incorrect URL or token are provided instead of failing
outright.
}

\subsection{REDCap API Security}{

It is good practice to ensure that SSL certs are validated when utilizing the REDCap API.
To ensure this happens, set the CURLOPT_SSL_VERIFYPEER' option to TRUE to avoid potential
man in the middle attacks.

The redcapAPI package utilizes the httr package to perform operations using the REDCap API.
Configuration options can be passed directly to httr via the config option in the
\link[redcapAPI:redcapConnection]{redcapAPI::redcapConnection} function. Here, we set 'ssl_verifypeer = 1L' to ensure
cert checking is enabled.
\itemize{
\item \url{https://search.r-project.org/CRAN/refmans/redcapAPI/html/redcapConnection.html}
\item \url{https://httr.r-lib.org/reference/httr_options.html}
}
}
}
\keyword{internal}
