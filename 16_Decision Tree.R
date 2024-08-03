# ===============================================
#   Decision Tree Analysis
# ===============================================
# > party 패키지 : 의사결정나무를 활용하기 위한 분류 패키지 中 1 
library(party) 

# 데이터 준비 
idx <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7,0.3)) # 70:30으로 데이터 나눔

train.data <- iris[idx==1,] # train input 
test.data <- iris[idx==2, ] # test input 


# 훈련 (모형 생성)
iris.tree <- ctree(Species~., data = train.data)


# 시각화 
plot(iris.tree)
plot(iris.tree, type="simple")
# y(setosa, versicolor, virginica)


# 예측 데이터 vs 실제 데이터
# > 머신러닝 모델은 훈련할 때 해당 데이터값으로 먼저 예측을 한후, 결과를 기록한 후 실제 값을 비교한다. 
# 이를 통해 모델 자신의 정확도 및 확률을 설정한다. 
table(predict(iris.tree), train.data$Species)
#             setosa versicolor virginica
# setosa         40          0         0
# versicolor      0         34         1
# virginica       0          4        31


# 평가 
test.pre <- predict(iris.tree, newdata=test.data)
table(test.pre, test.data$Species)
# test.pre     setosa versicolor virginica
# setosa         10          0         0
# versicolor      0         10         0
# virginica       0          2        18
