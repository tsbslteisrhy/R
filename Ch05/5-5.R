#날짜 : 2020/08/05
#이름 : 유효진
#내용 : 데이터시각화 - 지도 그래프 p290

install.packages('devtools')

devtools::install_github('dkahle/ggmap')
library('ggmap')

register_google(key = 'AIzaSyBrkMiFk4KP89zVAkrefQdzTiiGAucTcAY')

#서울 위치정보 구하기
gc <- geocode("seoul")
gc

seoul <- as.numeric(gc)

#지도 출력
map <- get_googlemap(center = seoul,
                     language = 'ko-KR',
                     color = 'bw',
                     zoom = 15)

ggmap(map, extent = 'device')
