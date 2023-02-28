
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CellDRIFT

<!-- badges: start -->
<!-- badges: end -->

The goal of CellDRIFT is to calculate the undrlying entropic loss (calculated as cellular division events) that occurs with age. CellDRIFT was trained as a replication signal (extracted from a longitudinal hTERT passaging model) and this specific cellular measure links age to cancer outcomes. For most epigenetic clocks (or observations that aging and cancer share common epigenetic signatures) the exact root or driver of the signals or measures are unknown. We set out to provide evidence that DNA methylation changes in response to cellular replication may be one explainable entopic event underlying the observation made by Vogelstein and Tomasetti that more proliferative tissues are more cancer prone. The output of CellDRIFT is calibrated to predict the cumulative popultion doubling events (cPD) of cultured human cells, with the absolute value trained from hTERT immortalized astrocytes.

## Installation

You can install the development version of CellDRIFT like so:

``` r
devtools::install_github("kthrush/CellDRIFT")
```

## Example

This is an example of CellDRIFT run on GSE31848, which we have included
in part as exampleDNAm in the package.

``` r
library(CellDRIFT)
as.vector(CellDRIFT(exampleDNAm))
#> Warning in CellDRIFT(exampleDNAm): Your DNA methylation contained NA Values.
#>                               
#>  These were set to 0 by CellDrift's Parameters.
#>   [1] 31.78583 31.91889 34.65030 30.41556 34.20683 34.39755 26.85195 26.37777
#>   [9] 25.92453 26.59179 28.40618 47.09914 44.77835 43.68171 32.18637 33.72215
#>  [17] 36.08404 32.20465 32.12337 37.79923 38.09946 38.24920 37.00901 42.98973
#>  [25] 37.91581 36.85345 31.45311 32.70674 32.65686 31.91479 30.87614 29.55700
#>  [33] 32.03909 29.70064 33.26870 29.32097 33.91248 31.22774 33.83704 30.36095
#>  [41] 32.93677 33.36343 32.61938 33.41273 33.10456 32.41828 32.85753 31.11043
#>  [49] 30.33476 31.83309 30.10649 31.57120 30.38446 31.72540 29.61431 28.89860
#>  [57] 33.60081 32.20070 29.87466 34.17544 35.29105 36.52918 39.11772 34.73854
#>  [65] 35.82561 39.13726 38.99597 37.25910 35.95614 36.70489 38.03307 33.75672
#>  [73] 35.15593 29.69515 29.55616 31.44092 25.21835 28.02536 32.95501 34.08192
#>  [81] 24.89777 27.17145 23.09878 22.60904 24.34666 25.23013 25.04779 25.00695
#>  [89] 27.26767 29.58064 31.05848 32.71789 24.83061 31.40300 35.51959 36.66343
#>  [97] 23.40007 21.39445 37.77718 22.68756 21.19298 22.11178 30.43606 30.71452
#> [105] 22.49294 21.67003 22.37947 27.97738 21.49649 23.49280 24.24586 21.23866
#> [113] 20.98627 21.20713 20.11802 21.33244 22.33016 23.42442 23.97283 23.71681
#> [121] 20.94438 20.22740 19.57584 20.96464 32.45657 34.02204 34.58360 25.51456
#> [129] 26.40154 24.78252 23.43734 31.58081 31.17554 21.86259 29.02166 29.94689
#> [137] 21.97585 21.46207 22.22862 34.75871 33.33323 21.48591 21.12737 27.27432
#> [145] 33.64887 33.07365 24.53058 26.39323 30.96990 30.58189 29.43413 29.63596
#> [153] 28.40269
```

## Model Data Details

If you are curious regarding the CellDRIFT model, all components
required for its calculation are included as data objects within the
package.

If you would like to look at the composition of the yellow module, you
might want to look at the objects in `data(yellow_module_means)` and
`data(PCA_yellow)` which give you:  
- the **CpGs** in the yellow module with the command
`names(yellow_module_means)`  
- the **mean values** that are imputed for missing data as the vector
`yellow_module_means`  
- the **variance** of the model PCs in `PCA_yellow$sdev`  
- the **rotations** of the CpG basis to the new PC basis in
`PCA_yellow$rotation`  
- the **centering** values in `PCA_yellow$center`  
- the **original PC training** data in `PCA_yellow$x`

If you are interested in the tan module, all the same values are
available if you simply swap `yellow` for `tan`.
