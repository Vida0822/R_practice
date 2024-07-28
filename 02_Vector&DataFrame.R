
# Vector : 가장 기본적인 데이터 구조 
#   -> 여러개의 이질적 원소를 가지는 하나의 변수 
#   => '열(Column)' 

V <- c(10,20,30) 
list("Tom", 2, 'a') # R의 벡터는 리스트 형태
names(V) <- c("Moe", "Larry", "Curly") # 이름 부여 가능 

print(V[1]) # Moe : index는 1부터 시작 
print(V["Moe"])
print(V$Moe)

L <- c(V[2:3]) # 하위 벡터 생성 
print(L)

# 데이터 추가 
V <- c(V, 40)
V[length(V)+1] <- 50

# 데이터 프레임 : 표 형태의 데이터 구조 (Data set!)
#            => 리스트 : 근데 원소가 각각 길이가 동일한 벡터 




