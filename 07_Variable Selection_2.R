#===============================================
#     Select Variables - 2. Forward Elimination
#===============================================
# 전진 선택법 : 변수를 하나씩 추가 
#   Based on 벌점화 (모든 후보 모형에 대해 AIC 또는 BIC를 계산하고 그 값이 최소가 되는 모형 pick)
# => Step 함수 활용해서! 

step(lm(y ~ 1, data=df), scope=list(lower=~1, upper=~x1+x2+x3+x4), direction="forward")
# step(lm(출력변수~입력변수, 데이터 세트)
# ,scope = list(lower=가장작은모형, upper=가장 큰 모형, direction = "forward"/"backward"/"stepwise"))
# k=2:AIC, k=log(자료의 수)

# Start:  AIC=77.45
# y ~ 1
# 
#         Df  Sum of Sq     RSS    AIC
# + x4    1   2173.90     892.17 62.164
# + x2    1   2137.91     928.17 62.718
# + x1    1   1754.53     1311.54 67.559
# + x3    1    947.83     2118.24 74.270
# <none>                  3066.07 77.447
# 
# Step:  AIC=62.16
# y ~ x4
# 
#         Df Sum of Sq    RSS    AIC
# + x1    1     808.4     83.77 31.046
# + x3    1     714.4     177.77 41.580
# <none>                  892.17 62.164
# + x2    1      12.1     880.07 63.973
# 
# Step:  AIC=31.05
# y ~ x4 + x1
# 
#         Df Sum of Sq    RSS    AIC
# + x2    1    30.083     53.689 26.818
# + x3    1    24.652     59.119 28.167
# <none>                  83.771 31.047
# 
# Step:  AIC=26.82
# y ~ x4 + x1 + x2
# 
#         Df Sum of Sq    RSS    AIC
# <none>                  53.689 26.818
# + x3    1    1.0592     52.629 28.539
#                                   ㄴ 추가를 안하는게 벌점이 더 낮다(최소화 완료!).  
# Call:
#   lm(formula = y ~ x4 + x1 + x2, data = df)
# 
# Coefficients:
#   (Intercept)           x4           x1           x2  
# 69.9853      -0.2050       1.4280       0.4381  
