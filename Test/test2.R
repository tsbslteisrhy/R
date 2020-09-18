install.packages('dplyr')
install.packages("reshape")
install.packages("ggplot2")
library(dplyr)
library(reshape)
library(ggplot2)

df_satisfy <- read.csv('../file/satisfaction.csv')
View(df_satisfy)

df_satisfy_new <- df_satisfy %>% select('구분1', '서울', '부산', '대전')
View(df_satisfy_new)

names(df_satisfy_new) <- c("title", "Seoul", "Busan", "Daejeon")
names(df_satisfy_new)

df_seoul <- df_satisfy_new %>% select('title', 'Seoul')
df_seoul_group <- df_seoul %>% group_by(title) %>%
                  summarise(mean_S = mean(Seoul))
View(df_seoul_group)

df_busan <- df_satisfy_new %>% select('title', 'Busan')
df_busan_group <- df_busan %>% group_by(title) %>%
                  summarise(mean_B = mean(Busan))
View(df_busan_group)

df_daejeon <- df_satisfy_new %>% select('title', 'Daejeon')
df_daejeon_group <- df_daejeon %>% group_by(title) %>%
                    summarise(mean_D = mean(Daejeon))
View(df_daejeon_group)

df_new <- merge(x = df_seoul_group,
                y = df_busan_group,
                by='title')
df_new <- merge(x = df_new,
                y = df_daejeon_group,
                by='title')

df_new <- df_new[,-1]
df_new <- t(df_new)
colnames(df_new) <- c('operate', 'use', 'clean', 'info', 'clean', 'transfer', 'safe')
View(df_new)

df_new %>% mutate(total=safe+operate+use+access+info+clean+transfer, mean=total/7)
View(df_new)


#독립변수와 종속변수 생성
x <- df_new$clean
y <- df_new$use

df_xy <- data.frame(x, y)
View(df_xy)

#단순선형회귀모델 생성
result_lm <- lm(formula = y ~ x, data = df_xy)
result_lm

#회귀식
simple_linear <- function(x){
  y <- 0.7393 * x + 0.7789
  return(y)
}

#예측
y1 <- simple_linear(1)
y2 <- simple_linear(2)
y3 <- simple_linear(3)
y4 <- simple_linear(4)
y5 <- simple_linear(5)

y1
y2
y3
y4
y5

plot(df_new$use ~ df_new$clean, data = df_new)
abline(result_lm, col('red'))


df_product <- read.csv('../file/product.csv')

#독립변수와 종속변수 생성
x <- df_product$제품_적절성
y <- df_product$제품_만족도

df_xy <- data.frame(x, y)
View(df_xy)

#단순선형회귀모델 생성
result_lm <- lm(formula = y ~ x, data = df_xy)
result_lm

#회귀식
simple_linear <- function(x){
  y <- 0.7393 * x + 0.7789
  return(y)
}