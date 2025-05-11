#' Add technical replicates
#'
#' Add counts across columns of a count matrix corresponding
#' to technical replicates.
#'
#' @import SummarizedExperiment
#' @importFrom methods is
#' @importFrom S4Vectors metadata
#'
#' @param se SummarizedExperiment object
#' @param group Character string vector, or factor, that indicates
#'   the grouping of technical replicates.
#'
#' @return A SummarizedExperiment object, where technical
#'   replicates have been added in the count matrix.
#'
#' @author Robert Castelo
#'
#' @examples
#' library(SummarizedExperiment)
#'
#' cnt <- matrix(1, nrow=3, ncol=9,
#'                 dimnames=list(paste0("g", 1:3), paste0("s", 1:9)))
#' cdata <- data.frame(group=rep(LETTERS[1:3], each=3), row.names=colnames(cnt))
#' se <- SummarizedExperiment(assays=list(counts=cnt), colData=cdata)
#' dim(se)
#' assays(se)$counts
#'
#' se <- add_tech_rep(se, se$group)
#' dim(se)
#' assays(se)$counts
#'
#' @export

add_tech_rep <- function(se, group) {
  stopifnot(is(se, "SummarizedExperiment")) ## QC
  stopifnot(length(group) == ncol(se)) ## QC

  ## build a list of sample identifiers by sample group
  sambygrp <- split(colnames(se), group)

  ## add up the corresponding columns in the count matrix,
  ## by sample group
  cntbygrp <- lapply(sambygrp, function(x, cnt) {
                     rowSums(cnt[, x, drop=FALSE])
            }, assays(se)$counts)
  cntbygrp <- do.call("cbind", cntbygrp)

  ## extract the corresponding column data, assuming that
  ## those data are identical across samples within a
  ## sample group
  sam2grp <- sapply(sambygrp, "[", 1)
  cdata <- colData(se)[sam2grp, , drop=FALSE]
  cdata <- as.data.frame(lapply(cdata, unname))
  rownames(cdata) <- names(sam2grp)

  ## here we expect that column identifiers in the table of counts
  ## are identical to the row identifiers in the phenotypic data
  ## and we instantiate that expectation as a quality check (QC)
  ## using the function 'stopifnot()', which will prompt an error
  ## if this expectation is not TRUE
  stopifnot(identical(colnames(cntbygrp), rownames(cdata))) ## QC

  ## build the new SummarizedExperiment object, we need to take
  ## care of possible NULL arguments and remove them, first by
  ## identifying them and then removing them by doing a NULL assignment
  seargs <- list(assays=list(counts=cntbygrp),
                 rowRanges=rowRanges(se),
                 colData=cdata,
                 metadata=metadata(se))
  seargs[sapply(seargs, is.null)] <- NULL

  ## 'do.call()' allows one to parametrize a function call
  se <- do.call("SummarizedExperiment", seargs)

  se
}
