#날짜 : 2020/08/04
#이름 : 유효진
#내용 : 데이터전처리 - 이상치 처리 교재 p209

library(dplyr)

#이상치 처리하기
df_exam <- read.csv('../file/csv_exam_outlier.csv')
View(df_exam)

#이상치를 결측치로 수정
df_exam$math    <- ifelse(df_exam$math    > 100 | df_exam$math    < 0, NA, df_exam$math)
df_exam$english <- ifelse(df_exam$english > 100 | df_exam$english < 0, NA, df_exam$english)
df_exam$science <- ifelse(df_exam$science > 100 | df_exam$science < 0, NA, df_exam$science)

View(df_exam)

#결측치를 0으로 대체
df_exam[is.na(df_exam)] <- 0
View(df_exam)

#기본통계분석
df_exam %>% mutate(total=math+english+science, mean=total/3) %>% arrange(desc(total))
