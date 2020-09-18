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
colnames(df_new) <- c('safe', 'operate', 'use', 'access', 'info', 'clean', 'transfer')
View(df_new)

#df_new$total <- df_new$safe +
#                df_new$operate +
#                df_new$use + 
#                df_new$access +
#                df_new$info +
#                df_new$clean + 
#                df_new$transfer
