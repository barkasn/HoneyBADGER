% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/HoneyBADGER_allele.R
\name{calcAlleleCnvProb}
\alias{calcAlleleCnvProb}
\title{Calculate posterior probability of CNVs using allele data}
\usage{
calcAlleleCnvProb(r.maf, n.sc, l.maf, n.bulk, snps, geneFactor, region = NULL,
  filter = FALSE, pe = 0.1, mono = 0.7, verbose = FALSE)
}
\arguments{
\item{r.maf}{Matrix of alt allele count in single cells.}

\item{n.sc}{Matrix of site coverage count in single cells.}

\item{l.maf}{Vector of alt allele count in pooled single cells or bulk.}

\item{n.bulk}{Vector of site coverage count in pooled single cells or bulk.}

\item{snps}{SNP annotations}

\item{geneFactor}{Output of \code{\link{setGeneFactors}}}

\item{region}{GenomicRanges region of interest such as expected CNV boundaries.}

\item{filter}{Boolean for whether to filter out SNP sites with no coverage. (default: TRUE)}

\item{pe}{Effective error rate to capture error from sequencing, etc. (default: 0.01)}

\item{mono}{Rate of mono-allelic expression. (default: 0.7)}

\item{verbose}{Verbosity(default: FALSE)}
}
\description{
Calculate posterior probability of CNVs using allele data
}
\examples{
data(r)
data(cov.sc)
allele.mats <- setAlleleMats(r, cov.sc)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
geneFactor <- setGeneFactors(allele.mats$snps, TxDb.Hsapiens.UCSC.hg19.knownGene)
## test region known to be commonly deleted in glioblastoma
results <- calcAlleleCnvProb(allele.mats$r.maf, allele.mats$n.sc, 
    allele.mats$l.maf, allele.mats$n.bulk, allele.mats$snps, geneFactor, 
    region=GenomicRanges::GRanges('chr10', IRanges::IRanges(0,1e9)), verbose=TRUE)

}
