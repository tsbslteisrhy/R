#날짜 : 2020/08/06
#이름 : 유효진
#내용 : R 데이터분석 인구통계자료 실습하기

library(dplyr)
library(ggplot2)

#나이대별 소득그래프 출력
df_koweps <- read.csv('../file/koweps.csv')
View(df_koweps)

df_koweps <- df_koweps %>% select(h10_g3,
                                 h10_g4,
                                 h10_g10,
                                 h10_g11,
                                 h10_eco9,
                                 p1002_8aq1,
                                 h10_reg7)
View(df_koweps)

df_koweps <- rename(df_koweps,
                    gender = h10_g3,
                    birth = h10_g4,
                    married = h10_g10,
                    religion = h10_g11,
                    job = h10_eco9,
                    income = p1002_8aq1,
                    region = h10_reg7)
View(df_koweps)

#나이 파생변수 생성
df_koweps$age <- 2020 - df_koweps$birth + 1
View(df_koweps)

df_income <- df_koweps %>% filter(!is.na(income)) %>% 
                           group_by(age) %>% 
                           summarise(mean_income=mean(income))
View(df_income)

#그래프 출력
ggplot(data=df_income, aes(x=age, y=mean_income)) + geom_line()










