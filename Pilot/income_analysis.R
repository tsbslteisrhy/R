#필요한 패키지 설치
install.packages("DBI")
install.packages("rJava")
install.packages("RJDBC")
install.packages("log4r")

#설치한 패키지 로드
library("DBI")
library("rJava")
library("RJDBC")

#R과 Hive 연동을 위한 R클래스 path 설정
hive.class.path = list.files(path = c("../lib"), pattern = "jar", full.names = T);
hadoop.lib.path = list.files(path = c("../lib"), pattern = "jar", full.names = T);
hadoop.class.path = list.files(path = c("../lib"), pattern = "jar", full.names = T);
class.path = c(hive.class.path, hadoop.lib.path, hadoop.class.path);
.jinit(classpath = class.path)

#하이브 JDBC 로드
drv <- JDBC("org.apache.hive.jdbc.HiveDriver",
            "../lib/hive-jdbc-2.1.1-cdh6.3.2.jar",
            identifier.quote = "`")

#하이브 접속
conn <- dbConnect(drv,
                  "jdbc:hive2://192.168.100.201:10000/default",
                  "hive",
                  "1234")

#하이브 테이블 목록 조회
dbListTables(conn)

#smartcar_master2income 테이블 조회
data <- dbGetQuery(conn, "select * from smartcar_master2income")
View(data)

#조회한 테이블 데이터 시각화
hist(data$smartcar_master2income.income)

#스마트카의 배기량에 따른 운전자의 연소득 예측 회귀모델 생성 및 요약
model <- lm(data$smartcar_master2income.income ~ 
            smartcar_master2income.car_capacity,
            data=data)
summary(model)

#회귀모델 테스트 확인
test_data <- read.csv("../data/CarMaster2Income_Test.txt",
                      sep ="|",
                      header = T,
                      encoding = "UTF-8")
predict(model, test_data, interval = "prediction")
