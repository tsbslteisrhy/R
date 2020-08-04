#날짜 : 2020/08/04
#이름 : 유효진
#내용 : 데이터프레임 파생변수 생성

df_exam <- read.csv('../file/exam.csv')
View(df_exam)

#파생변수 total
df_exam$total <- df_exam$math + df_exam$english + df_exam$science
View(df_exam)

#파생변수 mean
df_exam$mean <- (df_exam$total) / 3
df_exam

#파생변수 grade
df_exam$grade <- ifelse(df_exam$mean >= 90, 'A',
                 ifelse(df_exam$mean >= 80, 'B',
                 ifelse(df_exam$mean >= 70, 'C',
                 ifelse(df_exam$mean >= 60, 'D', 'F'))))
View(df_exam)
