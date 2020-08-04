#날짜 : 2020/08/04
#이름 : 유효진
#내용 : dplyr 패키지 연습문제

View(iris)

df_result  <- iris %>% group_by(Species) %>% 
                       summarise(mean(Sepal.Length),
                                 mean(Sepal.Width),
                                 mean(Petal.Length),
                                 mean(Petal.Width))
df_result
