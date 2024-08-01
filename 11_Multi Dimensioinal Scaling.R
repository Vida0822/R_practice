# ==========================================
#     Metric MDS : 데이터가 실제로 구간척도나 비율척도 
# ==========================================
#   > 데이터가 그 값 자체만으로 서로간의 거리를표현하기 적합

# 실제 거리 데이터를 다차원 2차원 평면에 시각화


print(eurodist)
# Athens Barcelona Brussels Calais Cherbourg Cologne Copenhagen Geneva Gibraltar Hamburg Hook of Holland Lisbon Lyons
# Barcelona         3313                                                                                                             
# Brussels          2963      1318                                                                                                   
# Calais            3175      1326      204                                                                                          
# Cherbourg         3339      1294      583    460                                                                                   
# Cologne           2762      1498      206    409       785                                                                         
# Copenhagen        3276      2218      966   1136      1545     760                                                                 
# Geneva            2610       803      677    747       853    1662       1418 
# > 유럽 주요 도시 간의 거리 행렬 데이터(2차원)

library(MASS)
loc <- cmdscale(eurodist) # eurodist 데이터 2차원 좌표로 변환 : 거리 데이터를 바탕으로 각 도시의 좌표 계산

head(loc)
#           [,1]      [,2]
# Athens    2290.27468 1798.8029
# Barcelona -825.38279  546.8115
# Brussels    59.18334 -367.0814
# Calais     -82.84597 -429.9147
# Cherbourg -352.49943 -290.9084
# Cologne    293.68963 -405.3119

x <- loc[,1] # x좌표 
y <- -loc[,2] # y좌표

plot(x,y,type="n", asp=1, main="Metric MDS") # 그래프 그리기 but 표시는 no! (x/y축 비율 1:1)
text(x,y,rownames(loc), cex=0.7) # 도시 이름을 가져와 해당 좌표 위에 추가 (글자크기 : 0.7) 
abline(v=0, h=0,lty=2, lwd=0.5) # x축과 y축을 그림 --> 수직, 수평선 0의 위치 + lty = 2 : 점선 , lwd = 0.5 : 두께

# => 객체들간의 집단성, 연관성을 한눈에 볼 수 있음 