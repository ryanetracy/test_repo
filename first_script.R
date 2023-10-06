###### first example script ######


library(devtools)
url <- 'https://github.com/ryanetracy/misc_functions/blob/main/misc_functions.R?raw=TRUE'
devtools::source_url(url)

pckgs <- c('rstatix', 'tidyverse')
package_loader(pckgs)

df <- read.delim('RExam.dat', sep = '\t')
head(df, 10)

m1 <- lm(exam ~ computer + lectures + numeracy + uni, data = df)
summary(m1)

ggplot(df, aes(uni, exam)) +
  geom_point(color = 'blue',
             shape = 7,
             alpha = .8,
             position = position_jitter(.05, 0)) +
  geom_smooth(method = 'lm', color = 'red2') +
  scale_x_continuous(breaks = c(0, 1)) +
  theme_light()
