# 숫자 데이터를 범주형으로 인식하지 못하게 하여야 함
cafe = read.csv('data/cafedata.csv', stringsAsFactors=F)
str(cafe)
head(cafe)
dim(cafe)       # 48 22
summary(cafe)   # pandas describe()와 유사

# 커피 판매량의 최대값과 최소값
cafe$Coffees = as.numeric(cafe$Coffees)
sort(cafe$Coffees)
sort(cafe$Coffees)[1]                   # 최소값
sort(cafe$Coffees, decreasing=T)[1]     # 최대값
sort(cafe$Coffees)[length(cafe$Coffees)-sum(is.na(cafe$Coffees))]

min(cafe$Coffees, na.rm=T)
max(cafe$Coffees, na.rm=T)

##### 대표값
# 최빈값을 알기 위한 방법
stem(cafe$Coffees)      # 줄기-잎 그림
table(cafe$Coffees)

# 평균
num.na = sum(is.na(cafe$Coffees))       # NA 의 갯수
weight = 1 / (length(cafe$Coffees) - num.na)
sum(cafe$Coffees * weight, na.rm=T)     # 산술 평균
mean(cafe$Coffees, na.rm=T)

# 양 끝 값의 변화에 따른 평균의 변화
rc = na.omit(cafe$Coffees)
length(rc)
rc[rc == max(rc)] = 480
mean(rc)                    # 21.5 --> 30.7 로 바뀜

# 중앙값
median.idx = (1 + length(rc)) / 2
median.idx
sort(rc)[median.idx]            # 23
median(cafe$Coffees, na.rm=T)   # 23

# 양 끝 값의 변화에 따른 평균의 변화는 크고, 중앙값의 변화는 없다.

##### 자료의 퍼진 정도 - 표준편차와 사분위수

### 표준 편차
# 아래와 같이 계산하면 퍼진 정도를 알 수 없다
height = seq(164, 176, 2)
height.m = mean(height)
h.dev = height - height.m
sum(h.dev)

sum(h.dev ^ 2) / 7
mean(h.dev ^ 2)             # 분산 - 16
sqrt(mean(h.dev ^ 2))       # 표준편차 - 4

# R에서 제공하는 함수
var(height)                 # 표본 분산 - 18.67
sd(height)                  # 표본 표준편차 - 4.32

### 사분위수
quantile(cafe$Coffees, na.rm=T)
qs = quantile(cafe$Coffees, na.rm=T)
bp = boxplot(cafe$Coffees, main='커피 판매량의 Box Plot')

IQR(cafe$Coffees, na.rm=T)
qs[4] - qs[2]               # 3분위수 - 1분위수 --> IQR(Inter Quantile Range)

### 이상치(Outlier)
boxplot(cars$dist)
hist(cars$dist, breaks=seq(0,120,10))

qs = quantile(cars$dist)
iqr = qs[4] - qs[2]
upperlimit = qs[4] + 1.5 * iqr
lowerlimit = qs[2] - 1.5 * iqr
cars$dist[cars$dist > upperlimit | cars$dist < lowerlimit]  # 120, 이상치




