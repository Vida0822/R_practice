
data(mtcars)
# data(Dataset) : Get R'embedded dataframe (Dataframe)

a <- mtcars$mpg  # extract column --> variable 1 
b <- mtcars$hp # extract column --> variable 2  

cov(a,b) # Covariance 
# [1] -320.7321 --> 음의 방향성
cor(a,b) # Correlation 
# [1] -0.7761684 --> 강한 음의 상관관계 

# Hypothesis : "Correlation of two variables is equal to 0 ?" 
cor.test(a,b,method="pearson") 
# Pearson Correlation Analysis : Continuous Variable 
#   vs Spearman : Based on order 

# ====================================================
# Pearson's product-moment correlation
# 
# data:  a and b
# t = -6.7424, df = 30, p-value = 1.788e-07
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
#  -0.8852686 -0.5860994
# sample estimates:
#        cor 
# -0.7761684
# ====================================================
