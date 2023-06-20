# ggplot2 패키지에 있는 mpg 데이터셋에 대해서 다음을 검정해 보세요.
# 1. compact 자동차와 midsize 자동차의 고속도로(hwy) 연비 [10]
# 2. compact 자동차와 midsize 자동차의 도시(cty) 연비 [10]
# 3. 일반 휘발유(r)와 고급 휘발유(p)의 고속도로 연비 [10]
# 4. compact 자동차의 전륜구동(f)이냐 후륜구동(r)이냐에 따른 고속도로 연비 [10]
# 5. compact, subcompact, midsize 자동차의 고속도로 연비 [10]

data('mpg', package='ggplot2')
mpg
table(mpg$class)

# 1
compact = mpg[mpg$class == 'compact',]
midsize = mpg[mpg$class == 'midsize',]
t.test(compact$hwy, midsize$hwy)
# p-value = 0.1232

# 2
compact = mpg[mpg$class == 'compact',]
midsize = mpg[mpg$class == 'midsize',]
t.test(compact$cty, midsize$cty)
# p-value = 0.02061

table(mpg$fl)
# 3
r = mpg[mpg$fl == 'r',]
p = mpg[mpg$fl == 'p',]
t.test(r$hwy, p$hwy)
# p-value = 0.001576

table(compact$drv)
# 4
shapiro.test(compact$cty[compact$drv == 'f'])   # p-value = 0.0007121
shapiro.test(compact$cty[compact$drv == '4'])   # p-value = 0.05771
t.test(compact$hwy[compact$drv == 'f'], compact$hwy[compact$drv == '4'])
# p-value = 6.5e-05

# 5
mpg$class = factor(mpg$class)
mpg = mpg[mpg$class == 'compact',]
compact = mpg[mpg$class == 'compact',]
subcompact = mpg[mpg$class == 'subcompact',]
midsize = mpg[mpg$class == 'midsize',]
ow = lm(hwy~class, data=mpg)
anova(ow)
# p-value = 2.2e-16

