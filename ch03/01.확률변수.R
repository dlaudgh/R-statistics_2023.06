# 확률변수의 평균과 기댓값
# 동전을 2회 던졌을때 앞면의 갯수
x = c(0, 1, 2)
px = c(1/4, 1/2, 1/4)
ex = sum(x * px)
ex                      # 기댓갑, 1

x2 = x ^ 2
x2
ex2 = sum(x2 * px)
ex2
varx = ex2 - ex ^ 2     # E(x^2) - E(X)^2
varx                    # 분산, 1/2

### 동전을 4회 던졌을 때 앞면의 갯수
x = c(0, 1, 2, 3, 4)
px = c(1/16, 1/4, 3/8, 1/4, 1/16)
ex = sum(x * px)    # 기댓값, 2
ex

x2 = x^2
x2
ex2 = sum(x2 * px)
ex2
varx = ex2 - ex^2
varx                # 분산, 1

### 주사위를 2회 던졌을 때 3의 배수의 갯수
x = c(0, 1, 2)
px = c(4/9, 4/9, 1/9)
ex = sum(x * px)        # 기댓값, 2/3
ex

x2 = x^2
x2
ex2 = sum(x2 * px)
ex2
varx = ex2 - ex^2       # 분산, 4/9
varx