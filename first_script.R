###### first example script ######


library(devtools)
url <- 'https://github.com/ryanetracy/misc_functions/blob/main/misc_functions.R?raw=TRUE'
devtools::source_url(url)

pckgs <- c('rstatix', 'tidyverse')
package_loader(pckgs)

df <- read.delim('RExam.dat', sep = '\t')
head(df, 10)

mod1 <- lm(exam ~ computer + lectures + numeracy + uni, data = df)
summary(mod1)

ggplot(df, aes(uni, exam)) +
  geom_point(color = 'blue',
             shape = 7,
             alpha = .8,
             position = position_jitter(.05, 0)) +
  geom_smooth(method = 'lm', color = 'red2') +
  scale_x_continuous(breaks = c(0, 1)) +
  theme_light()

m1 <- mean(df$exam[df$uni == 0])
m2 <- mean(df$exam[df$uni == 1])

sd1 <- sd(df$exam[df$uni == 0])
sd2 <- sd(df$exam[df$uni == 1])

get_cohen_d(m1, m2, sd1, sd2)


df$uni <- factor(df$uni, levels = c(0, 1))

mod2 <- lm(exam ~ lectures * uni, data = df)
summary(mod2)

ggplot(df, aes(lectures, exam, color = uni)) +
  geom_point(shape = 7,
             alpha = .8,
             position = position_jitter(.05, 0)) +
  geom_smooth(method = 'lm') +
  scale_color_manual(values = c('turquoise2', 'black')) +
  theme_light()

# add a comment

m3 <- glm(uni ~ exam + lectures, family = "binomial", data = df)
summary(m3)
