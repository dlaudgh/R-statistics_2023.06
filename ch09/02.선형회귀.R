##### 단순 선형회귀
### 아버지와 아들 키
hf = read.table('data/Galton.txt', header=T, stringsAsFactors=F)
tail(hf)
hf$Gender = factor(hf$Gender, levels=c('M','F'))
# filtering
hf.son = hf[hf$Gender == 'M',]      # hf.son = subset(hf, Gender=='M)
# selection
hf.son = hf.son[c('Father','Height')] * 2.54

### R에서 선형회귀 구하는 방법
# lm(): linear model
out = lm(Height ~ Father, data=hf.son)
summary(out)

### 좋은 선형 모델
# 정규성 : Q-Q Residuals 대각선상에 점이 몰려 있을 것
# 독립성
# 선형성 : Residuals vs Fitted 랜덤하게 퍼져 있을 것
# 등분산성 : Scale-Location 랜덤하게 퍼져 있을 것
par(mfrow=c(2,2))
plot(out)
par(mfrow=c(1,1))


##### 비교
women
plot(weight ~ height, data=women)
out2 = lm(weight ~ height, data=women)
summary(out2)       # R-squared: 0.991
par(mfrow=c(2,2))
plot(out2)
par(mfrow=c(1,1))

### 다항식
poly = lm(weight~height + I(height^2), data=women)
summary(poly)       # R-squared: 0.9995
par(mfrow=c(2,2))
plot(poly)
par(mfrow=c(1,1))
