% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/HoneyBADGER_gexp.R
\name{setMvFit}
\alias{setMvFit}
\title{Model expected gene expression variance as a function of number of genes}
\usage{
setMvFit(gexp.norm, num.genes = seq(5, 100, by = 5), rep = 50,
  plot = FALSE, verbose = TRUE)
}
\arguments{
\item{gexp.norm}{Normalized gene expression matrix}

\item{num.genes}{Number of random genes sampled (default: seq(5, 100, by=5))}

\item{rep}{Number of repeats/resampling (default: 50)}

\item{plot}{Whether to plot (default: FALSE)}

\item{verbose}{Verbosity (default: TRUE)}
}
\description{
Model expected gene expression variance as a function of number of genes
}
\examples{
data(gexp)
data(ref)
require(biomaRt) ## for gene coordinates
mart.obj <- useMart(biomart = "ENSEMBL_MART_ENSEMBL", 
    dataset = 'hsapiens_gene_ensembl', 
    host = "jul2015.archive.ensembl.org")
gexp.mats <- setGexpMats(gexp, ref, mart.obj, filter=FALSE, scale=FALSE)
mvFit <- setMvFit(gexp.mats$gexp.norm)

}
