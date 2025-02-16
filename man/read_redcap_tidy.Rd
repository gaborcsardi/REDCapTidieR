% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_redcap_tidy.R
\name{read_redcap_tidy}
\alias{read_redcap_tidy}
\title{Extract a REDCap database into a tidy supertibble}
\usage{
read_redcap_tidy(
  redcap_uri,
  token,
  raw_or_label = "label",
  forms = NULL,
  suppress_messages = TRUE
)
}
\arguments{
\item{redcap_uri}{The
URI/URL of the REDCap server (e.g.,
"https://server.org/apps/redcap/api/"). Required.}

\item{token}{The user-specific string that serves as the password for a
project. Required.}

\item{raw_or_label}{A string (either 'raw' or 'label') that specifies whether
to export the raw coded values or the labels for the options of multiple
choice fields. Default is 'label'.}

\item{forms}{A character vector of form names that specifies the forms to
export. Default returns all forms in the project.}

\item{suppress_messages}{Optionally show or suppress messages.
Default \code{TRUE}.}
}
\value{
Returns a \code{tibble} in which each row represents a REDCap instrument.
}
\description{
Call the REDCap API to retrieve data and metadata about a project,
and then transform the output into a tidy "supertibble" that contains tidy
tibbles, where each tibble represents a single instrument.
}
\details{
This function uses [REDCapR](https://ouhscbbmc.github.io/REDCapR)
to call the REDCap API. The REDCap API returns
a [block matrix](https://en.wikipedia.org/wiki/Block_matrix) that mashes
data from all data collection instruments
together. In complex databases, such as those that contain repeated
instruments, this is unwieldy. The `read_redcap_tidy` function intelligently
deconvolutes the block matrix and splices the data into individual tibbles,
where one tibble represents the data from one instrument.
}
\examples{
\dontrun{
redcap_uri <- Sys.getenv("REDCAP_URI")
token <- Sys.getenv("REDCAP_TOKEN")

read_redcap_tidy(
   redcap_uri,
   token,
   raw_or_label = "label"
 )
}

}
