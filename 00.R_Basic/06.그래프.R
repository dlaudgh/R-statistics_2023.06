##### 산점도
plot(c(1:10), c(2,3,5,7,3,1,9,4,9,8),
     pch=0,                             # 점의 모양
     col='red',                         # 점의 색상
     xlab='X축 제목', ylab='Y축 제목',  # X축, Y축 제목
     main='산점도(Scatter plot)')       # 제목

##### Line graph
plot(c(1:10), c(2,3,5,7,3,1,9,4,9,8),
     type='l',                          # 선 그래프
     lwd=3,                             # 선의 굵기
     col='blue',
     xlab='X축 제목', ylab='Y축 제목',
     main='선 그래프')

##### Pie chart
x = c(10,20,30,40)
pie(x, init.angle=90,
    labels=c("Apples", "Bananas", "Cherries", "Dates"),
    main='내가 좋아하는 과일')

##### Bar chart
x = c('A','B','C','D')
y = c(3, 4, 6, 7)
barplot(y, names.arg=x, col='orange')