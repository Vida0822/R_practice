# ==========================================
#     NonMetric MDS : 데이터가 순서 척도 
# ==========================================
# > 거리의 속성과 같도록 변환하여 '거리'를 생성 후 적용 
# 거리 데이터가 아닌 데이터들의 유사성, 집단 관계 시각화  
# ex) 나와 특정 사람의 '유사성' : 단순 거리로 표현 안됨! 여러가지 특성값이 존재 
#     --> 해당 특성값들(다차원)을 분석해 2차원 평면에 plot으로 표현하는 것 -> 유사도 확인

# 1) isoMDS

# 데이터 불러오기 
library(MASS)
data(swiss)
head(swiss)
#                 Fertility Agriculture Examination Education Catholic Infant.Mortality
# Courtelary        80.2        17.0          15        12     9.96             22.2
# Delemont          83.1        45.1           6         9    84.84             22.2
# Franches-Mnt      92.5        39.7           5         5    93.40             20.2
# Moutier           85.8        36.5          12         7    33.77             20.3
# Neuveville        76.9        43.5          17        15     5.16             20.6
# Porrentruy        76.1        35.3           9         7    90.57             26.6
# > '가깝고 멀다(유사/비유사)'의 개념이 모호함
#   : "어느정도 교육 수준 점수가 비슷해야 유사한 집단으로 보는거야?"

# 거리 행렬로 변환 
swiss.x <- as.matrix(swiss[,-1]) # 첫 번째 열을 제외한 나머지 열 --> 행렬로 변환 
swiss.dist <- dist(swiss.x) # 데이터의 각 행 간의 유클리드 거리 계산 --> 거리 행렬 생성
swiss.mds <- isoMDS(swiss.dist) # 다차원 척도법을 수행 : 고차원 데이터 축소해 2차원 좌표 

# 시각화 
plot(swiss.mds$points, type="n") # points : 거리행렬의 '좌표정보' ([{x,y}, ...])
text(swiss.mds$points, labels=as.character(1:nrow(swiss.x))) # 숫자 레이블 부여
abline(v=0,h=0, lty=2, lwd=0.5)







