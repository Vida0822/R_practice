
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
