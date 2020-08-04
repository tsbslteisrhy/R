#날짜 : 2020/08/04
#이름 : 유효진
#내용 : 데이터전처리 - 결측치 처리 교재 p201

library(dplyr)

#결측치(누락값) 처리하기

df_exam <- read.csv('../file/csv_exam_na.csv')
View(df_exam)

#결측치 존재여부 확인
is.na(df_exam)

#결측치를 갖는 행 제거
df_exam_new <- df_exam %>% filter(!is.na(math) & !is.na(english) & !is.na(science))
View(df_exam_new)

#기본통계분석
df_exam_new %>% mutate(total=math+english+science, mean=total/3) %>% arrange(desc(total))

