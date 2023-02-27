#' @title Fit.CellDRIFT
#'
#' @description The elasticnet fit object for CellDRIFT regression
#'
#' @format A list object as defined by the output of calling function glmnet.fit
#' \describe{
#'   \item{a0}{Intercept}
#'   \item{beta}{Matrix of coefficients}
#'   \item{df}{The number of nonzero coefficients.}
#'   \item{dim}{Dimension of coefficient matrix (including zeros).}
#'   \item{lambda}{Lambda value that was used.}
#'   \item{dev.ratio}{Fraction of var. explained.}
#'   \item{nulldev}{The null deviance per obs.}
#'   \item{npasses}{Total data passes.}
#'   \item{jerr}{An error flag allowing internal debugging.}
#'   \item{offset}{Was an offset included in model?}
#'   \item{call}{The call producing the object}
#'   \item{nobs}{The # of observations.}
#' }
"Fit.CellDRIFT"
