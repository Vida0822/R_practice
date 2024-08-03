# ===============================================
#   Logistric Regression Analysis
# ===============================================
# Y : categorical vairable -> y^ : likelihood(probability) of being Y=1 

# 데이터 준비
a <- iris[iris$Species=="setosa" | iris$Species=="versicolor",] 
# 종류가 setosa, versicolor인 레코들로만 dataset 구성 

# 훈련 
b <- glm(Species ~ Sepal.Length, data=a, family=binomial)

# 해석 
summary(b)
# Call:
#   glm(formula = Species ~ Sepal.Length, family = binomial, data = a)
# 
# Coefficients:
#                 Estimate  Std. Error z value Pr(>|z|)    
#   (Intercept)   -27.831      5.434  -5.122 3.02e-07 ***
#   Sepal.Length    5.140      1.007   5.107 3.28e-07 ***
#                    ㄴ Length가 한단위 증가함에 따라 
#                       Species(Y)=2 에 대한 오즈가 exp(5.140) ~= 170배 증가 
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 

# (Dispersion parameter for binomial family taken to be 1)
# 
# Null deviance: 138.629  on 99  degrees of freedom
#      ㄴ 절편만 포함하는 모형의 완전 모형으로부터의 이탈도(Deviance)    
#      ㄴ P(99) > 138.629 ~= 0.005 --> 통계적으로 유의 
# Residual deviance:  64.211  on 98  degrees of freedom
#      ㄴ 예측변수(Length)가 포함된 모형의 완전 모형으로부터의 이탈도(Deviance) 
#      ㄴ P(98) > 64.211 ~= 0.997 --> 통계적으로 유의 x : 귀무가설 기각 X 
# AIC: 68.211
# 
# Number of Fisher Scoring iterations: 6