#날짜 : 2020/08/04
#이름 : 유효진
#내용 : Excel 파일 데이터프레임 생성

#패키지 설치
install.packages('readxl')

#패키지 로드
library(readxl)

df_exam <- read_excel('../file/exam.xlsx')

View(df_exam)

#합
sum_math <- sum(df_exam$math)
sum_math

#평균
mean_math <- mean(df_exam$math)
mean_math
