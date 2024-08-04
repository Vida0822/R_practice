# ===============================================
#    Hierarchical Clusterng : 계층적 군집분석 
# ===============================================
# n개의 군집으로 시작해 점차 군집의 갯수 줄여나감 
# (수정 거리행렬을 기반으로 새로운 군집을 형헝하며)

head(iris) 
#         Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# 1          5.1         3.5          1.4         0.2  setosa
# 2          4.9         3.0          1.4         0.2  setosa
# 3          4.7         3.2          1.3         0.2  setosa
# 4          4.6         3.1          1.5         0.2  setosa
# 5          5.0         3.6          1.4         0.2  setosa
# 6          5.4         3.9          1.7         0.4  setosa

idx <- sample(1:dim(iris)[1], 40) 
# 1:dim(iris)[1]은 1부터 iris 데이터셋의 행 수까지의 순서를 나타내는 벡터를 생성
# 이 벡터에서 중복되지 않는 방식으로 40개의 인덱스를 무작위로 추출

iris.s <- iris[idx,] # idx에 있는 인덱스에 해당하는 행들로 구성
iris.s$Species <- NULL # Species 열을 제거 ('거리계산'에 종은 포함 x --> 집단 결과값 비교 대상 )

hc <- hclust(dist(iris.s), method = "ave")
# 데이터프레임 각 행 간의 유클리드 거리를 계산 -> 계산된 거리 행렬을 이용하여 "average linkage" 방법을 사용하여 계층적 군집화를 수행

plot(hc, hang = -1, labels = iris$Species[idx])
# 덴드로그램이 수직으로 표시되도록 설정]
# 관측치(행)에 해당하는 종(Species) 정보를 표시 (idx 벡터에 있는 인덱스를 사용하여 데이터셋에서 해당하는 종 정보)

# > 해당 덴드로그램 보면서 군집화 : 수평선 그며 적절한 군집수 결정  