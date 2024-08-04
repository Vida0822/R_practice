# ===============================================
#   Association Analysis  : 연관 분석 
# ===============================================
# > 특정 특성, 변수들간의 연관 관계를 분석하여 '규칙'으로 나타낸다. 

# 데이터 준비 
install.packages("arules")
library(arules)
data("Groceries")

# 거래 내역 확인 : 각 거래내역 별 포함된 품목들
inspect(Groceries[1:3])
#     items                                                      
# [1] {citrus fruit, semi-finished bread, margarine, ready soups}
# [2] {tropical fruit, yogurt, coffee}                           
# [3] {whole milk}     

# 학습 (규칙 생성)
rules <- apriori(Groceries, parameter=list(support=0.01, confidence=0.3))
# Apriori
# 
# Parameter specification:
#   confidence minval smax arem  aval originalSupport maxtime support minlen maxlen target
# 0.3    0.1    1 none FALSE            TRUE       5    0.01      1     10  rules
# ext
# TRUE
# 
# Algorithmic control:
#   filter tree heap memopt load sort verbose
# 0.1 TRUE TRUE  FALSE TRUE    2    TRUE
# 
# Absolute minimum support count: 98 
# 
# set item appearances ...[0 item(s)] done [0.00s].
# set transactions ...[169 item(s), 9835 transaction(s)] done [0.00s].
# sorting and recoding items ... [88 item(s)] done [0.00s].  --> 88개 아이템 
# creating transaction tree ... done [0.00s].
# checking subsets of size 1 2 3 4 done [0.00s].
# writing ... [125 rule(s)] done [0.00s].     --> 125개의 연관규칙 
# creating S4 object  ... done [0.00s].

# > 규칙의 수가 너무 적으면 지지도와 신뢰도를 낮추고, 너무 많으면 지지도와 신뢰도를 높인다. 


# 유용한 규칙 선별 
inspect(sort(rules, by=c("lift"), decresing=TRUE[1:20]))
# > 다양한 관련 수치를 출력한 후 규칙 분석 기준을 재설정 또는 유용 정보 추출 
#       lhs                                          rhs                support    confidence coverage   lift     count
# [1]   {citrus fruit, other vegetables}          => {root vegetables}  0.01037112  0.3591549  0.02887646 3.295045 102  
# [2]   {tropical fruit, other vegetables}        => {root vegetables}  0.01230300  0.3427762  0.03589222 3.144780 121  
# [3]   {beef}                                    => {root vegetables}  0.01738688  0.3313953  0.05246568 3.040367 171
# [4]   {citrus fruit, root vegetables}           => {other vegetables} 0.01037112  0.5862069  0.01769192 3.029608 102 
# [5]   {tropical fruit, root vegetables}         => {other vegetables} 0.01230300  0.5845411  0.02104728 3.020999 121
# [6]   {other vegetables, whole milk}            => {root vegetables}  0.02318251  0.3097826  0.07483477 2.842082 228  
# [7]   {whole milk, curd}                        => {yogurt}           0.01006609
# [8]   {root vegetables, rolls/buns}             => {other vegetables} 0.01220132
# [9]   {root vegetables, yogurt}                 => {other vegetables} 0.01291307
# [10]  {tropical fruit, whole milk}              => {yogurt}           0.01514997
# [11]  {yogurt, whipped/sour cream}              => {other vegetables} 0.01016777
# [12]  {other vegetables, whipped/sour cream}    => {yogurt}           0.01016777

# > 상위 5개 규칙의 lift > 3 : rhs 제품만 구매할 확률에 비해 lhs 제품을 샀을 때 rh3 제품도 구매할 확률이 약 3배 가량 높다 
#   => 제품들간 결합상품 할인쿠폰, 품복배치 변경 등 제안 

