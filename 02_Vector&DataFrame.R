
# Vector : 가장 기본적인 데이터 구조 
#   -> 여러개의 이질적 원소를 가지는 하나의 변수 

V <- c(10,20,30) 
list("Tom", 2, 'a') # R의 벡터는 리스트 형태
names(V) <- c("Moe", "Larry", "Curly") # 이름 부여 가능 

print(V[1]) # Moe : index는 1부터 시작 
print(V["Moe"])
print(V$Moe)

L <- c(V[2:3])
print(L)



