##### 다중 선형회귀
View(state.x77)
states = as.data.frame(state.x77[,c('Murder','Population','Illiteracy','Income','Frost')])
head(states)

fit = lm(Murder ~ ., data=states)
summary(fit)
par(mfrow=c(2,2))
plot(fit)

# 다중 공선성 : 독립변수간 강한 상관관계가 나타나는 문제
# 상관계수가 0.9 이상이면 다중공선성 의심
states.cor = cor(states[2:5])
states.cor

### 다음의 과정을 반복해서 진행
fit1 = lm(Murder ~ ., data=states)      # 모든 독립변수
summary(fit1)       # R-squared: 0.567

fit2 = lm(Murder ~ Population+Illiteracy, data=states) # 독립변수 2개
summary(fit2)       # R-squared: 0.5668

# AIC(Akaike Information Criterion) - 값이 적을수록 좋은 모델
AIC(fit1, fit2)

par(mfrow=c(1,1))