### 일원 분산분석(ANOVA: Analysis of Variance)
ad = read.csv('data/age.data.csv')
head(ad)
tail(ad)
ad$scale = factor(ad$scale)

g1 = ad[ad$scale == 1,]
g2 = ad[ad$scale == 2,]
g3 = ad[ad$scale == 3,]
boxplot(g1$age, g2$age, g3$age)

boxplot(age ~ scale, data=ad, col=rainbow(3))

# 등분산 검증
install.packages('lawstat')
library(lawstat)
levene.test(ad$age, ad$scale)   # p-value=0.7105
# 분산이 같다라는 귀무가설 채택 -> 분산이 같다

# Anova
ow = lm(age~scale, data=ad)
anova(ow)       # p-value=0.6941
# 평균이 같다라는 귀무가설 채택 -> 평균이 같다
# anova 결과 F-value=0.366
1 - pf(0.366, 2, 147)       # p-value=0.694133











