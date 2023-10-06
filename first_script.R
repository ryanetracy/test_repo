###### first example script ######


library(devtools)
url <- 'https://github.com/ryanetracy/misc_functions/blob/main/misc_functions.R?raw=TRUE'
devtools::source_url(url)

pckgs <- c('rstatix', 'tidyverse')
package_loader(pckgs)

df <- read.delim('RExam.dat', sep = '\t')
head(df, 10)

ghp_pdazgmgWala5vUEfs04TTg3rZH6NVD1I