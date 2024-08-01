# ===============================================
#     Principal Component Analysis : 주성분 분석 
# ===============================================
# 서로 상관성이 높은 변수들을 선형 결합해 제 k 주성분으로 변수 축소 

# USArrests : 50개 주의 인구당 체포된 세가지 강력 범죄 수 + 각 주마다 도시에 거주하는 비율 

# 1) scatter plot 
library(datasets)
data("USArrests")
pairs(USArrests, panel = panel.smooth, main="US Arrest Data")
# 4개의 변수들 (3개의 범죄 + 인구수) 내 조합을 시각화 
# --> Murder과 UrbanPop 사이 관련성이 적어보임 


# 2) Summary : 주성분 수 결정 

# 주성분 분석 
us.prin <- princomp(USArrests, cor = TRUE) # 상관 행렬 기반(변수들간 척도 차이 큼) 주성분 분석 
summary(us.prin)
# Importance of components:
#                         Comp.1    Comp.2    Comp.3     Comp.4
# Standard deviation     1.5748783 0.9948694 0.5971291 0.41644938
# Proportion of Variance 0.6200604 0.2474413 0.0891408 0.04335752
# Cumulative Proportion  0.6200604 0.8675017 0.9566425 1.00000000
# > Comp.2 > 85% --> 주성분 변수를 2개 활용해 전체 데이터의 86.8%를 설명할 수 있다 

# screeplot 
screeplot(us.prin, npcs=4, type="lines")
# > Comp 2 이후부터 뚝 떨어짐 


# 3) Loading : 각 주성분(1~4)에 기여하는 변수 각각의 가중치 
loadings(us.prin)
# Loadings:
#           Comp.1 Comp.2 Comp.3 Comp.4
# Murder    0.536  0.418  0.341  0.649
# Assault   0.583  0.188  0.268 -0.743
# UrbanPop  0.278 -0.873  0.378  0.134
# Rape      0.543 -0.167 -0.818       
# > 제 1 주성분 : 네개의 변수가 평균적으로 기여 / 제 2 주성분 : 계수 부호가 각각 다름  
#    ㄴ 4개의 변수 모두 포함 (대체로 양의 상관관계)       ㄴ 높은 음의 계수 부호 나타내는 강간, 인구수 포함!  
#                  Comp.1 Comp.2 Comp.3 Comp.4
# SS loadings      1.00   1.00   1.00   1.00
# Proportion Var   0.25   0.25   0.25   0.25
# Cumulative Var   0.25   0.50   0.75   1.00


# 4) scores : 각 주성분 (Comp1~4) 선형식을 통해 각 지역(record) 별로 얻은 결과 
us.prin$scores
#                   Comp.1      Comp.2      Comp.3       Comp.4
# Alabama         0.98556588  1.13339238  0.44426879  0.156267145
# Alaska          1.95013775  1.07321326 -2.04000333 -0.438583440
# Arizona         1.76316354 -0.74595678 -0.05478082 -0.834652924
# Arkansas       -0.14142029  1.11979678 -0.11457369 -0.182810896
# California      2.52398013 -1.54293399 -0.59855680 -0.341996478
# Colorado        1.51456286 -0.98755509 -1.09500699  0.001464887
# Connecticut    -1.35864746 -1.08892789  0.64325757 -0.118469414
# Delaware        0.04770931 -0.32535892  0.71863294 -0.881977637



# 5) 제 1,2 주성분으로 데이터 분석 (축소된 변수로 군집 분석 )
arrests.pca <- prcomp(USArrests, center = TRUE, scale. = TRUE ) # 표준화 (평균 = 1, 표준편차 = 1) --> 주성분 분석

# 6) 시각화 
biplot(arrests.pca, scale=0)
