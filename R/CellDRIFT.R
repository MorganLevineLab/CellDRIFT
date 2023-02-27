#' CellDRIFT
#'
#' @description A function to run the appropriate PC fit and obtain CellDRIFT for samples in a single line of code.
#'
#' @param DNAm A matrix or data frame that contains the DNA methylation beta values as obtained from Illumina 450k or EPIC arrays. Columns should be named according to CpG ID but do not have to be in a specific order.
#'
#' @return Will return a vector of predicted CellDrift values with length equal to the number of input rows (or samples).
#' @export
#'
#' @examples CellDRIFT(DNAm = exampleDNAm)
CellDRIFT <- function(DNAm) {

  Betas_y <- as.matrix(DNAm)

  # Check for NAs and remove
  if(any(is.na(Betas_y))) {

  warning("Your DNA methylation contained NA Values.
                              \n These were set to 0 by CellDrift's Parameters.")
    Betas_y[is.na(Betas_y)] <- 0
  }

  # Input any missing columns
  Missing <- which(names(yellow_module_means) %in% colnames(Betas_y)==FALSE)
  MissingNames <- names(yellow_module_means)[names(yellow_module_means) %in% colnames(Betas_y)==FALSE]
  Means <- yellow_module_means[Missing]
  tempMat <- matrix(rep(Means, dim(Betas_y)[1]), nrow = dim(Betas_y)[1], ncol = length(Means), byrow = TRUE)
  colnames(tempMat) <- MissingNames
  Betas_y <- cbind(Betas_y, tempMat)

  # Ensure that you have your methylation in the right order
  Betas_y <- Betas_y[,match(names(yellow_module_means),colnames(Betas_y))]
  if(any(colnames(Betas_y) != names(yellow_module_means))) stop("Error: Yellow Module DNAm colname mismatch! Terminating")

  # Run yellow PCA
  PCs_yellow=predict(PCA_yellow,Betas_y)

  # Repeat for tan module

  Betas_t <- as.matrix(DNAm)

  # Check for NAs and remove
  if(any(is.na(Betas_t))) Betas_t[is.na(Betas_t)] <- 0

  # Input any missing columns
  Missing <- which(names(tan_module_means) %in% colnames(Betas_t)==FALSE)
  MissingNames <- names(tan_module_means)[names(tan_module_means) %in% colnames(Betas_t)==FALSE]
  Means <- tan_module_means[Missing]
  tempMat <- matrix(rep(Means, dim(Betas_t)[1]), nrow = dim(Betas_t)[1], ncol = length(Means), byrow = TRUE)
  colnames(tempMat) <- MissingNames
  Betas_t <- cbind(Betas_t, tempMat)

  # Ensure that you have your methylation in the right order
  Betas_t <- Betas_t[,match(names(tan_module_means),colnames(Betas_t))]
  if(any(colnames(Betas_t) != names(tan_module_means))) stop("Error: Yellow Module DNAm colname mismatch! Terminating")

  # Run tan PCA
  PCs_tan=predict(PCA_tan,Betas_t) #CAME FROM OBJECT PCA_htert_sex_tan

  # Set PC names to appropriate labels for consistency with paper

  colnames(PCs_yellow) <- c("PC1_y","PC2_y","PC3_y","PC4_y","PC5_y","PC6_y","PC7_y","PC8_y","PC9_y",
                            "PC10_y","PC11_y","PC12_y","PC13_y","PC14_y","PC15_y","PC16_y","PC17_y",
                            "PC18_y","PC19_y","PC20_y","PC21_y","PC22_y","PC23_y","PC24_y","PC25_y",
                            "PC26_y","PC27_y","PC28_y","PC29_y","PC30_y","PC31_y")

  colnames(PCs_tan) <- c("PC1_t","PC2_t","PC3_t","PC4_t","PC5_t","PC6_t","PC7_t","PC8_t","PC9_t",
                         "PC10_t","PC11_t","PC12_t","PC13_t","PC14_t","PC15_t","PC16_t","PC17_t",
                         "PC18_t","PC19_t","PC20_t","PC21_t","PC22_t","PC23_t","PC24_t","PC25_t",
                         "PC26_t","PC27_t","PC28_t","PC29_t","PC30_t","PC31_t")

  # Combine PC sets

  PCs_CellDRIFT <- cbind(PCs_yellow, PCs_tan)

  dim_mismatch_error_code <- as.numeric(1*as.numeric(dim(PCs_CellDRIFT)[1] != dim(DNAm)[1]) + 2*as.numeric(dim(PCs_CellDRIFT)[2] != 62))

  if(dim_mismatch_error_code == 1) stop("The combined PCA object does not match the number of rows in the input data.")
  if(dim_mismatch_error_code == 2) stop("The combined PCA object does not have the expected number of PCs (62).")
  if(dim_mismatch_error_code == 3) stop("The combined PCA object does not match the number of rows in the input data AND \n does not have the expected 62 PC columns.")

  # Use the elastic net objects to predict values from the final PC object

  CellDRIFT=as.numeric(glmnet::predict.glmnet(Fit.CellDRIFT,PCs_CellDRIFT,s=CV.CellDRIFT$lambda.min)) #TYPO CELLCRIFT

  return(CellDRIFT)

}
