#날짜 : 2020/08/05
#이름 : 유효진
#내용 : 데이터시각화 - 전국 wifi 지도 시각화

library('ggmap')

register_google(key = 'AIzaSyBrkMiFk4KP89zVAkrefQdzTiiGAucTcAY')

df_wifi <- read.csv('../file/wifi.csv')
df_wifi

#센터좌표 생성
wifi_center <- c(mean(df_wifi$lon), mean(df_wifi$lat))

#지도생성
map <- get_googlemap(center = wifi_center,
                     maptype = 'roadmap',
                     zoom = 7,
                     size = c(640, 640))

#지도출력
ggmap(map) + geom_point(aes(x=lon, y=lat, color='red', size=3), data = df_wifi)
