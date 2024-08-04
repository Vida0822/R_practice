# ===============================================
#    Non-Hierarchical Clustering : 비계층적 군집분석 
# ===============================================
# 처음부터 군집 갯수를 정해두고 최적의 Clustering 수행 

# > Kmeans -> 'seeds' : 군집 생성 중심 points 

# 데이터 준비 
data(iris)
newiris <- iris
newiris$Species <- NULL 

# 훈련(학습)
kc <- kmeans(newiris,3) # 3개의 군집으로 나눔 

# 결과 비교 
table(iris$Species, kc$cluster) 
# > 목적집단(Species)를 지정해두지 않고 특성값들의 거리로만 구분한 군집이 실제 집단(Species)와 얼마나 일치하는지 
#             1  2  3
# setosa      50 0 17
# versicolor  0 2  48     --> 2: virginica/ 3 : versicolor
# virginica   0 36  0


# 시각화 
plot(newiris[c("Sepal.Length", "Sepal.Width")], col = kc$cluster)
#  두 개의 변수 사용하여 데이터를 색깔로 구분된 클러스터링 결과로 시각화
