#===============================================
#     Select Variables - 1. Backward Elimination
#===============================================

# Backward Elimination: 적은 영향을 주는 변수부터 하나씩 제거  
# => 그 中 유의확률(p-value) 기반법 : p-value가 높은 변수부터 제거 

# 벡터 생성 
x1 <- c(7,  1,  11, 11, 7,  11, 3,  1,  2,  21, 1,  11, 10)
x2 <- c(26, 29, 56, 31, 52, 55, 71, 31, 54, 47, 40, 66, 68)
x3 <- c(6,  15, 8,  8,  6,  9,  17, 22, 18, 4,  23, 9,  8)
x4 <- c(60, 52, 20, 47, 33, 22, 6,  44, 22, 26, 34, 12, 12)
y <- c(78.5, 74.3, 104.3, 87.6, 95.9, 109.2, 102.7, 72.5, 93.1, 115.9, 83.8, 113.3, 109.4)

# 데이터 프레임 생성 
bdf <- data.frame(x1, x2, x3, x4, y)
ndf <- data.frame(x1=1, x2=30, x3=16, x4=52, y=76.0)
df <- rbind(bdf, ndf) 
head(df)
# x1 x2 x3 x4     y
# 1  7 26  6 60  78.5
# 2  1 29 15 52  74.3
# 3 11 56  8 20 104.3
# 4 11 31  8 47  87.6
# 5  7 52  6 33  95.9
# 6 11 55  9 22 109.2

# 회귀 모형 생성 
a <- lm(y ~ x1 + x2 + x3 + x4, data = df)
summary(a)
# Call:
#   lm(formula = y ~ x1 + x2 + x3 + x4, data = df)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -3.6719 -1.4193  0.1729  1.3544  4.0011 
# 
# Coefficients:
#             Estimate  Std. Error t value Pr(>|t|)  
# (Intercept) 42.71284   65.75033   0.650    0.532  
# x1           1.72594    0.71038   2.430    0.038 *
# x2           0.71494    0.67865   1.053    0.320  
# x3           0.30305    0.71209   0.426    0.680  
# x4           0.06597    0.66126   0.100    0.923  
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 2.418 on 9 degrees of freedom
# Multiple R-squared:  0.9828,	Adjusted R-squared:  0.9752 
# F-statistic: 128.8 on 4 and 9 DF,  p-value: 6.168e-08

# 1. "모든 상관계수가 0?" F-statistic > 0.05 : 통계적으로 유의
# 2. "각각의 입력변수 유의?" 변수 각각의 t-statistic 다 0.05보다 큼 : 통계적으로 유의 X 


# Step! 유의 확률(p-value)이 가장 높은 변수 제거하고 다시 회귀보형 생성 
b <- lm(y ~ x1 + x2 + x4, data = df)
summary(b)
# Call:
#   lm(formula = y ~ x1 + x2 + x4, data = df)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -3.4739 -1.7289  0.2862  1.1444  3.9234 
# 
# Coefficients:
#             Estimate Std. Error   t value Pr(>|t|)    
# (Intercept)    69.9853    14.1016   4.963 0.000568 ***
#   x1            1.4280     0.1151  12.407 2.13e-07 ***
#   x2            0.4381     0.1851   2.367 0.039471 *  
#   x4           -0.2050     0.1712  -1.197 0.258795    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 2.317 on 10 degrees of freedom
# Multiple R-squared:  0.9825,	Adjusted R-squared:  0.9772 
# F-statistic:   187 on 3 and 10 DF,  p-value: 4.424e-09
# 여전히 x1을 제외한 t의 p-value > 0.05 --> 통계적으로 유의 X 


# Step ! 유의확률이 가장 큰 x4 제거 
c <- lm(y ~ x1 + x2, data = df)
summary(c)
# Call:
#   lm(formula = y ~ x1 + x2, data = df)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -2.7979 -1.7715 -0.3521  1.6013  4.0517 
# 
# Coefficients:
#               Estimate    Std.Error t value Pr(>|t|)    
# (Intercept)   53.27588    2.06270   25.83 3.39e-11 ***
#   x1           1.44757    0.11615   12.46 7.88e-08 ***
#   x2           0.65362    0.04367   14.97 1.17e-08 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 2.362 on 11 degrees of freedom
# Multiple R-squared:   0.98,	Adjusted R-squared:  0.9763 
# F-statistic: 269.2 on 2 and 11 DF,  p-value: 4.551e-10

# 오! Joint Hypothesis에 대한 F-statistic도, 각각의 상관계수에 대한 T-statistic도 만족 (모두 통계적으로 유의 )
# 최종 회귀식 : y = 52.57735 + 1.46831*x1 + 0.06625*x2 

