#날짜 : 2020/08/03
#이름 : 유효진
#내용 : R 자료구조 데이터프레임 교재 p77

a <- c(1, 2)
b <- c(3, 4)
c <- c(T, F)

df1 <- data.frame(a, b, c)
df1 

df2 <- data.frame(num  = c(1, 2, 3),
                  name = c('김유신', '김춘추', '장보고'),
                  age  = c(31, 29, 42))
df2

#데이터프레임 출력
df2$name[1]
df2$name[2]
df2$name[3]

df2$age[1]
df2$age[2]
