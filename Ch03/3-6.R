#날짜 : 2020/08/07
#이름 : 유효진
#내용 : 수행평가

install.packages('dplyr')
library(dplyr)

df_exam <- read.csv('../file/exam.csv')
View(df_exam)

df_new_exam <- df_exam %>% select(math, english, science)
View(df_new_exam)

df_english <- df_exam %>% filter(english >= 60 & english < 80)
View(df_english)

df_class1 <- df_exam %>% filter(class==1) %>% select(everything())
View(df_class1)

df_math <- df_exam %>% select(class, id, math) %>% 
                       filter(math >= 60) %>% 
                       arrange(desc(math))
View(df_math)

df_group <- df_exam %>% group_by(class) %>% 
            summarise(mean_math = mean(math))
View(df_group)

