#===============================================
#     Select Variables - 3. Actual Practice
#===============================================
# Backward Elimination Based On step() 

library(boot)
Data = nodal 
data.use = Data[, -ncol(Data)]
# [ ,] : 모든 행 (데이터는 다 포함)
# [ , ncol(Data)] : 데이터프레임의 모든 컬럼 --> (-) :마지막 요소 제외 

lm.full.Model = lm(r~., data = data.use)
backward.aic = step(lm.full.Model, lpsa~1, direction="backward")
# 
# Step:  AIC=-86.04
# r ~ aged + stage + grade + xray
# 
# Df Sum of Sq     RSS     AIC
# - grade  1   0.11015  8.7657 -87.371
# - aged   1   0.17217  8.8277 -86.997
# <none>                8.6555 -86.041
# - stage  1   0.82264  9.4782 -83.229
# - xray   1   1.35972 10.0153 -80.308
# 
# Step:  AIC=-87.37
# r ~ aged + stage + xray
# 
# Df Sum of Sq     RSS     AIC
# - aged   1   0.25232  9.0180 -87.867
# <none>                8.7657 -87.371
# - stage  1   1.30867 10.0744 -81.996
# - xray   1   1.52189 10.2876 -80.886
# 
# Step:  AIC=-87.87
# r ~ stage + xray
# 
# Df Sum of Sq    RSS     AIC
# <none>                9.018 -87.867 --> 현 상태가 가장 최솟값 (최적화)
# - stage  1    1.2303 10.248 -83.088
# - xray   1    1.6871 10.705 -80.777

lm(r~stage + xray, data = data.use)
# Call:
#   lm(formula = r ~ stage + xray, data = data.use)
# 
# Coefficients:
#   (Intercept)        stage         xray  
#     0.1016          0.3084       0.3932  

# => model : r =  0.1016 + 0.3084*stage + 0.3932*xray 
