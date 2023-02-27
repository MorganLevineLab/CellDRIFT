#' @title CV.CellDRIFT
#'
#' @description The elasticnet crossvalidation object for CellDRIFT regression
#'
#' @format A list object as defined by the output of calling function cv.glmnet
#' \describe{
#'   \item{lambda}{The values of lambda that were used for training fits.}
#'   \item{cvm}{The mean cross-validated error.}
#'   \item{cvsd}{Estimate of the standard error of the cvm.}
#'   \item{cvup}{cvm+cvsd}
#'   \item{cvlo}{cvm-cvsd}
#'   \item{nzero}{The number of nonzero coefficients at each value of lambda}
#'   \item{call}{The very original training call made to the data object. Ignore as objects were renamed.}
#'   \item{name}{Text string with type of measure for plotting purposes.}
#'   \item{glmnet.fit}{Fitted glmnet object for full data.}
#'   \item{lambda.min}{Minimum cvm value of lambda}
#'   \item{lambda.1se}{Largest value of lmabda so that error is within +1se of the minimum.}
#'   \item{index}{Loci of lambda min and 1se in the lambda vector.}
#' }
"CV.CellDRIFT"
