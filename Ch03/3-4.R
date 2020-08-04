#날짜 : 2020/08/04
#이름 : 유효진
#내용 : dplyr 패키지 실습하기

install.packages('dplyr')
library(dplyr)

df_exam <- read.csv('../file/exam.csv')
View(df_exam)

#select - DF의 특정 컬럼을 선택해서 새로운 DF 생성
df_math    <- df_exam %>% select(math)
df_english <- df_exam %>% select(english)
df1        <- df_exam %>% select(math, science)
df2        <- df_exam %>% select(everything())

df_math
df_english
df1
df2

#filter (where) - DF의 특정 조건에 맞는 컬럼을 선택해서 새로운 DF 생성
df_class1 <- df_exam %>% filter(class==1)
df_class1

# 영어점수 60점이상 80점 미만
df_english <- df_exam %>% filter(english >= 60 & english < 80)
df_english

# 과학점수 60점이상 80점 이하
df_science <- df_exam %>% filter(science >= 60 | science <= 80)
df_science

# SELECT math FROM df_exam WHERE class=1
df_math <- df_exam %>% filter(class==1) %>% select(math)
df_math

# SELECT * FROM df_exam WHERE math > 60 AND math < 80
df_all <- df_exam %>% select(everything()) %>%  filter(math > 60 & math < 80)
df_all

#arrange (order by) - DF의 특정 컬럼을 정렬해서 새로운 DF 생성
df_math_asc <- df_exam %>% arrange(math)
df_math_desc <- df_exam %>% arrange(desc(math))
df_math_asc
df_math_desc

# SELECT class, id, math FROM df_exam WHERE math >= 60 ORDER BY math DESC LIMIT 3;
df_result <- df_exam %>% select(class, id, math) %>% 
                         filter(math >= 60) %>%
                         arrange(desc(math)) %>% 
                         head(3)
df_result

#mutate - DF의 새로운 특정 컬럼(파생변수)을 추가해서 새로운 DF 생성
df_total <- df_exam %>% mutate(total = math+english+science)
df_total

df_mean <- df_total %>% mutate(mean = total/3)
df_mean

df_grade <- df_exam %>% mutate(total = math+english+science) %>% 
                        mutate(mean = total/3) %>% 
                        mutate(grade = ifelse(mean >= 90, 'A',
                                       ifelse(mean >= 80, 'B',
                                       ifelse(mean >= 70, 'C',
                                       ifelse(mean >= 60, 'D','F')))))
df_grade

#summarise - DF의 특정 컬럼에 대한 요약통계
df_exam %>% summarise(mean_math=mean(math))
df_exam %>% summarise(sum_math=sum(math))

#group_by - DF의 특정 컬럼에 대해 그룹화
df_group1 <- df_exam %>% group_by(class) %>% summarise(sum_math = sum(math))
df_group1

df_group2 <- df_exam %>% group_by(class) %>% summarise(mean_math = mean(math))
df_group2

#inner_join - 두 개 이상의 DF의 공통 컬럼으로 조인
df_teacher <- data.frame(class=c(1,2,3,4,5),
                         teacher=c('김유신','김춘추','장보고','강감찬','이순신'))
df_teacher

df_join <- inner_join(df_exam, df_teacher, by='class')
df_join