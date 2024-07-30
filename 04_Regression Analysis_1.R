#===============================================
#     1. Single Vaiables Regression 
#===============================================
x <- c(19, 23, 26 ,29 ,30 ,38 ,39 ,46 ,49) # vector 
y <- c(33, 51, 40, 49, 50, 69, 70, 64, 89) # vector 

lm(y~x)
# Call:
#   lm(formula = y ~ x)
# 
# Coefficients:
#(Intercept)      x  
# 6.409        1.529  

summary(lm(y~x))
# 
# Call:
#   lm(formula = y ~ x)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -12.766  -2.470  -1.764   4.470   9.412 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)   6.4095     8.9272   0.718 0.496033    
# x             1.5295     0.2578   5.932 0.000581 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 7.542 on 7 degrees of freedom
# Multiple R-squared:  0.8341,	Adjusted R-squared:  0.8104 
# F-statistic: 35.19 on 1 and 7 DF,  p-value: 0.0005805


#===============================================
#     2. Multiple Vaiables Regression 
#===============================================
library(MASS) # Dataset in 'Mass' package 

head(Cars93) # head() : print 6 datas of dataset 
# Manufacturer   Model    Type Min.Price Price Max.Price MPG.city MPG.highway
# 1        Acura Integra   Small      12.9  15.9      18.8       25          31
# 2        Acura  Legend Midsize      29.2  33.9      38.7       18          25
# 3         Audi      90 Compact      25.9  29.1      32.3       20          26
# 4         Audi     100 Midsize      30.8  37.7      44.6       19          26
# 5          BMW    535i Midsize      23.7  30.0      36.2       22          30
# 6        Buick Century Midsize      14.2  15.7      17.3       22          31

summary(Cars93)
# Manufacturer   Model    Type Min.Price Price Max.Price MPG.city MPG.highway
# 1        Acura Integra   Small      12.9  15.9      18.8       25          31
# 2        Acura  Legend Midsize      29.2  33.9      38.7       18          25
# 3         Audi      90 Compact      25.9  29.1      32.3       20          26
# 4         Audi     100 Midsize      30.8  37.7      44.6       19          26
# 5          BMW    535i Midsize      23.7  30.0      36.2       22          30
# 6        Buick Century Midsize      14.2  15.7      17.3       22          31

attach(Cars93) # can approach to data easily 

lm(formula = Price~EngineSize+RPM+Weight, data = Cars93)
# Coefficients:
#   (Intercept)   EngineSize          RPM       Weight  
# -51.793292     4.305387     0.007096     0.007271  
# 
# --> Based on Cars93 Dataset, 
    # Price = 4.305387*EngineSize + 0.007096*RPM + 0.007271*Weight

summary(lm(Price~EngineSize+RPM+Weight, data = Cars93))

# Residuals:
#   Min      1Q  Median      3Q     Max 
# -10.511  -3.806  -0.300   1.447  35.255 
# 
# Coefficients:
#                 Estimate   Std.Error t value Pr(>|t|)    
# (Intercept)     -51.7932   9.106309  -5.688 1.62e-07 ***
#   EngineSize    4.305387   1.324961   3.249  0.00163 **  
#   RPM           0.007096   0.001363   5.208 1.22e-06 *** 
#   Weight        0.007271   0.002157   3.372  0.00111 **  
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#  => 회귀계수 p-values good: statistically significant (통계적으로 유의)

# Residual standard error: 6.504 on 89 degrees of freedom
# Multiple R-squared:  0.5614,	Adjusted R-squared:  0.5467 --
# => 결정계수 자체는 낮아 데이터의 설명력은 낮다. 

# F-statistic: 37.98 on 3 and 89 DF,  p-value: 6.746e-16