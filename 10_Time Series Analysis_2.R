# ==========================================
#       ARIMA Model : AR + MA + Integrated 
# ==========================================
# : 정상적 시계열로 변환 

# Before scatter plots 
# --> 평균이 시점에 따라 일정치 않는 모습 
# --> '비정상 시계열' 
#
# =>  차분 수행 : ARIMA(0,1,0)로! 
# 차분을 d번 반복했을 때 비정상 시계열 자료를 정상적 시계열 자료로 만들어 줄 수 있다 .

# 1) ARIMA(1) : 차분 수행 
king.ffl <- diff(king.ts, differences = 1)
plot.ts(king.ffl)


# 2) ARIMA 모델 결정 : acf, pcaf
acf(king.ffl, lag.max=20)
acf(king.ffl, lag.max=20, plot = FALSE)
# 자기 상관 : 자신의 과거 변수가 현재 값과 얼마나 관련있는지 그 정도 
# 0      1      2      3      4 
# 1.000 -0.360 -0.162 -0.050  0.227 
# 5      6      7      8      9 
# -0.042 -0.181  0.095  0.064 -0.116 
# 10     11     12     13     14 
# -0.071  0.206 -0.017 -0.212  0.130 
# 15     16     17     18     19 
# 0.114 -0.009 -0.192  0.072  0.113 
# 20 
# -0.093 

# lag 1 빼곤 모두 -0.3 ~ 0,3 (절단점 : lag 2)
# => ARMA(d:0,q:1) 모델 : ACF 값이 lag2 에서 절단점을 가짐 --> MA(1) 모형 

pacf(king.ffl, lag.max=20)
pacf(king.ffl, lag.max=20, plot = FALSE)
# 1      2      3      4      5      6      7      8      9     10     11     12 
# -0.360 -0.335 -0.321  0.005  0.025 -0.144 -0.022 -0.007 -0.143 -0.167  0.065  0.034 
# 13     14     15     16     17     18     19     20 
# -0.161  0.036  0.066  0.081 -0.005 -0.027 -0.006 -0.037 

# 음의 상관 계수 + 절단점 : lag 4 
# => ARMA(p:3, d:0) :PACP 값이 lag 4 에서 절단 점 --> AR(3)

# 결론: AR 모형 + MA 모형 혼합 -->  ARMA(p,q) 


# +) 내장 함수로 적절한 ARIMA 모형 찾기 
#     : forecast 패키지의 auto.arima
install.packages("forecast")
library(forecast) #  various functions for prediction of time series data 

auto.arima(king)
# ARIMA(0,1,1)** --> 적절한 모형  
# 
# Coefficients:
#   ma1
# -0.7218
# s.e.   0.1208
# 
# sigma^2 = 236.2:  log likelihood = -170.06
# AIC=344.13   AICc=344.44   BIC=347.56


# 4) 예측 
#   : 적절한 모형이 완성되었으니 이제 미래값을 예측해보자 

king.arima <- arima(king, order = c(0,1,1)) 
# king dataset을 arima model로 적합 --> order : 모델의 파라미터를 정의(p,d,q) 
# --> 차분 + MA(1)

king.forecasts <- forecast(king.arima, h=5) # 적합된 ARIMA 모델을 사용하여 미래의 값을 예측

king.forecasts
# Point Forecast    Lo 80    Hi 80    Lo 95     Hi 95
# 43       67.75063 48.29647 87.20479 37.99806  97.50319
# 44       67.75063 47.55748 87.94377 36.86788  98.63338
# 45       67.75063 46.84460 88.65665 35.77762  99.72363
# 46       67.75063 46.15524 89.34601 34.72333 100.77792
# 47       67.75063 45.48722 90.01404 33.70168 101.79958

# 미래왕들 사망 나이는 67.7세로 예측 (추정)
# 신뢰구간은 80%~95%

