#' @title PCA_yellow
#'
#' @description The PCA object allowing prediction and mapping of yellow PCs in new data.
#'
#' @format A list object as defined by the output of calling prcomp([yellow-module-CpG-Mat])
#' \describe{
#'   \item{sdev}{Standard deviation of principal components--the sqrt of the singular vector eigenevalues.}
#'   \item{rotation}{The matrix of CpG loadings.}
#'   \item{center}{The values used to center by CpG in the new data matrix.}
#'   \item{scale}{Indicates that CpGs were not scaled.}
#'   \item{x}{The value of the rotated samples on the new PC features.}
#' }
"PCA_yellow"
