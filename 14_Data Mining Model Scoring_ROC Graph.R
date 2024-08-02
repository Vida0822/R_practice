# ===============================================
#     ROCR : ROC 아래 그래프의 면적으로 적합도 평가
# ===============================================
# > Binary Classification만 지원 가능 

library(rpart)
install.packages("party")
library(party)
install.packages("ROCR")
library(ROCR)

# 1) 데이터 준비 

# kyphosis : 데이터셋의 행을 무작위로 섞음
x <- kyphosis[sample(1:nrow(kyphosis), nrow(kyphosis), replace = F),]

# 데이터셋을 훈련 세트와 평가 세트로 나누는 작업을 수행
x.train <- kyphosis[1:floor(nrow(x) * 0.75), ]
x.evaluate <- kyphosis[floor(nrow(x) * 0.75):nrow(x), ]

# 2) 모델 훈련 

# 모델 객체 생성 (Tree) + 훈련 
x.model <- cforest(Kyphosis ~ Age + Number + Start, data = x.train)

# 평가 세트 예측 
x.evaluate$prediction <- predict(x.model, newdata = x.evaluate)

# 일치 여부 행렬로 
x.evaluate$correct <- x.evaluate$prediction == x.evaluate$Kyphosis

# 예측 정확도 출력
print(paste("% of predicted classification correct", mean(x.evaluate$correct)))
# [1] "% of predicted classification correct 0.818181818181818"

# 각 데이터 포인트의 예측 확률을 계산 --> 행렬 형태로 (내림차순)
x.evaluate$probabilities <- 1 - unlist(treeresponse(x.model, newdata = x.evaluate), use.names = F)[seq(1, nrow(x.evaluate) * 2, 2)]


# 3) 성능 평가 

# ROC 그래프 (by AUROC)
pred <- prediction(x.evaluate$probabilities, x.evaluate$Kyphosis)
perf <- performance(pred, "tpr", "fpr") # x : tpr, y : fpr 
plot(perf, main = "ROC curve", colorize=T)
# > large AUROC is good 

# 이익도표 (lift chart)
perf <- performance(pred, "lift", "rpp") # x : lift (향상도) , resp : 반응률 
plot(perf, main="lift curve", colorize=T)
# > steep graph is good 
