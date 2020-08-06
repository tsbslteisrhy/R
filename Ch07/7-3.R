#날짜 : 2020/08/06
#이름 : 유효진
#내용 : R 데이터분석 상관분석 실습하기

install.packages('corrplot')
install.packages('corrgram')

library(corrplot)
library(corrgram)

df_product <- read.csv('../file/product.csv')
View(df_product)

#변수간 상관계수 확인
cor(df_product$제품_친밀도, df_product$제품_적절성)
cor(df_product$제품_친밀도, df_product$제품_만족도)
cor(df_product$제품_적절성, df_product$제품_만족도)

#상관계수 행렬
cor(df_product, method = 'pearson')

#상관관계 시각화
pairs(df_product)
corrgram(df_product, upper.panel = panel.conf)

#도전 붓꽃데이터 상관분석
View(iris)

df_iris <- iris %>% select(-Species)
View(df_iris)

cor(df_iris, method = 'pearson')

pairs(df_iris)
corrgram(df_iris, lower.panel = panel.conf)
