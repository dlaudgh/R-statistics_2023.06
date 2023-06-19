
prob = round(pnorm(14, 11, 4), 2)
1-prob      # 0.23

day = round(pnorm(760, 800, 30), 2)
day     # 0.09

e90 = round(pnorm(90, 70, 8), 2)
e80 = round(pnorm(80, 70, 8), 2)
e90         # 0.99
e80         # 0.89
e90 - e80   # 0.1
