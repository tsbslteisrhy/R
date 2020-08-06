#날짜 : 2020/08/05
#이름 : 유효진
#내용 : 텍스트 시각화

install.packages("multilinguer")
library(multilinguer)


install_jdk()
install.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type = "binary")
install.packages("remotes")

remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
library(KoNLP)
library(dplyr)
library(stringr)

#형태소 분석을 위한 사전설정
useNIADic()

#텍스트 파일 데이터 생성
data_song <- readLines('../file/song.txt')
View(data_song)

#특수문자 제거
data_song <- str_replace_all(data_song, '\\W', ' ')
View(data_song)

#명사 추출
data_noun <- extractNoun(data_song)
View(data_noun)

#명사 단어 집계
word_count <- table(unlist(data_noun))
View(word_count)

#데이터프레임으로 변환
df_word <- as.data.frame(word_count, stringsAsFactors = F)
View(df_word)

#두 문자 이상 단어만 추출
df_word <- df_word %>%  filter(nchar(Var1) >= 2) %>% filter(!is.na(Var1)) 
View(df_word)

#워드클라우드 출력
install.packages('wordcloud')
library(wordcloud)
library(RColorBrewer)

pal <- brewer.pal(8, 'Dark2')
set.seed(1)

wordcloud(words = df_word$Var1,
          freq = df_word$Freq,
          min.freq = 3,
          max.words = 1000,
          random.order = F,
          rot.per = 0.7,
          scale = c(4, 0.3),
          colors = pal)
