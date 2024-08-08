# ===============================================
#   Reshape 패키지를 활용한 데이터 마트 생성  
# ===============================================

head(airquality)
#     Ozone Solar.R Wind Temp Month Day
# 1    41     190  7.4   67     5   1
# 2    36     118  8.0   72     5   2
# 3    12     149 12.6   74     5   3
# 4    18     313 11.5   62     5   4
# 5    NA      NA 14.3   56     5   5
# 6    28      NA 14.9   66     5   6


# reshape 패키지: 데이터 마트 구성 원리 실습 
install.packages("reshape")
library(reshape)

# 1) melt() : 쉬운 casting을 위해 적당한 형태로 만들어주는 함수 (최대 확장)
aqm = melt(airquality, id = c("Month", "Day"), na.rm=T)
# -> 데이터 마트를 만들 때 받아온 데이터를 처리과정을 통해 분석에 적절하게 활용할 수 있는 자료로 변환 
#       Month Day variable value
# 1       5   1    Ozone    41
# 2       5   2    Ozone    36
# 3       5   3    Ozone    12
# 4       5   4    Ozone    18
# 5       5   6    Ozone    28
# 6       5   7    Ozone    23
# 7       5   8    Ozone    19
# 8       5   9    Ozone     8
# 9       5  11    Ozone     7
#           :
#           :
# 170     6  27  Solar.R    47
# 171     6  28  Solar.R    98
# 172     6  29  Solar.R    31
# 173     6  30  Solar.R   138
# 174     7   1  Solar.R   269
# 175     7   2  Solar.R   248
# 176     7   3  Solar.R   236


# 2) cast() : 데이터를 원하는 형태로 계산 또는 변형 
cast(aqm, Day ~ Month ~ variable , , variable = Ozone)
# -> 요약 변수, 파생 변수 ! 

#   Month
# Day  5  6   7   8  9
# 1   41 NA 135  39 96
# 2   36 NA  49   9 78
# 3   12 NA  32  16 73
# 4   18 NA  NA  78 91
# 5   NA NA  64  35 47
# 6   28 NA  40  66 32
# 7   23 29  77 122 20

#   Month
# Day  5   6   7   8   9
# 1  190 286 269  83 167
# 2  118 287 248  24 197
# 3  149 242 236  77 183
# 4  313 186 101  NA 189
# 5   NA 220 175  NA  95
# 6   NA 264 314  NA  92