#날짜 : 2020/08/03
#이름 : 유효진
#내용 : 제어문과 함수 교재 p113

#조건문
num1 <- 1
num2 <- 2
num3 <- 3

if(num1 < num2){
  print('num1은 num2보다 작다.')
}

if(num2 > num3){
  print('num2은 num3보다 크다.')
}else{
  print('num2은 num3보다 작다.')
}

result <- ifelse(num1 > num3, 'num1이 num3보다 크다.', 'num1이 num3보다 작다.')
result

#반복문
for(i in 1:5){
  print(i)
}

#1부터 10까지 합
sum <- 0
for(k in 1:10){
  sum <- sum + k
}

sprintf('1부터 10까지 합 : %d', sum)

#while
k <- 1
total <- 0

while(k <= 10){
  total <- total + k
  k <- k + 1
}

sprintf('total 값 : %d', total)