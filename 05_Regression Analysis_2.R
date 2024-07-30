#===============================================
#     3. Logistic Regression 
#   => 종속 변수가 범주형인 경우, 양성 클래스일 확률을 예측하는 함수 
#   (선형함수와 달리 확률을 0~1값으로 조정)
#===============================================
library(boot) # 패키지 불러오기 
data(nodal) # 데이터 불러오기 

# 1) 
first_model <- glm(r~.,data=nodal,family="binomial")
summary(first_model)
# => 유의수준 5%에서 유의하지 않음 

# 2) 
a <- c(2,4,6,7) # 벡터 --> index 지정용으로 사용  
data <- nodal[,a] # 행은 전체, 열은 (2,4,6,7) 인덱스만 (r,stage,xray,acid)
second_model <- glm(r~.,data=data,family="binomial")
summary(second_model)
# Call:
#   glm(formula = r ~ ., family = "binomial", data = data)
# 
# Coefficients:
#   Estimate Std. Error z value Pr(>|z|)    
# (Intercept)  -3.0518     0.8420  -3.624  0.00029 ***
#   stage         1.6453     0.7297   2.255  0.02414 * 
#   xray          1.9116     0.7771   2.460  0.01390 *  --> 통계적으로 유의 
#   acid          1.6378     0.7539   2.172  0.02983 *  
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# (Dispersion parameter for binomial family taken to be 1)
# 
# Null deviance: 70.252  on 52  degrees of freedom
# Residual deviance: 49.180  on 49  degrees of freedom
# AIC: 57.18
# 
# Number of Fisher Scoring iterations: 5
