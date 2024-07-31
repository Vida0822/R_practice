# =======================================
#       분해 시계열
# =======================================
# : 시계열 자료에 영향을 주는 요인(추세, 계절, 순환, 불규칙 등)들을 데이터에서 제외한 후 회귀분석


# 1) Read Data and visualize
# 패키지 설치 (필요한 경우에만)
install.packages("tseries")
install.packages("TTR")

library(tseries) # various functions for analysis of time series data 
library(TTR) # utils 

# 영국 왕 42명의 사망시 나이 (비계절성을 띄는 불규칙 요소 ) --> 불규칙 요소 제거해야함 
king <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat", skip=3)
king.ts <- ts(king) # transform to time series data 
par(mfrow=c(1, 1), mar=c(3, 2, 2, 1) + 0.1)  # 여백 조정
plot(king.ts, main="King's Death Ages", xlab="Index", ylab="Age")


# 2) 3년마다 평균을 내서 그래프를 부드럽게 표현 --> 불규칙성 ↓
king.sma3 <- SMA(king.ts, n=3) # TTR - 이동 평균 (기간 : 3년)
plot.ts(king.sma3)

# 3) 8년마다 평균을 내서 그래프를 부드럽게 표현 --> 불규칙성 ↓
king.sma8 <- SMA(king.ts, n=8) # TTR - 이동 평균 (기간 : 3년)
plot.ts(king.sma8)




