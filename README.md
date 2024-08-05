### R Practice 
Learn Statistics, Data Analysis, Mashine Learning Based On R Programming <br> 
I used R Studio for GUI and Script editting 😊

{{toc}}

---

h1. 이슈 개요

h2. 1. 결함 요약

* [NGFW 2.1.6.0] 제품 정보 조회 시 패치 된 버전과 다른 버전이 출력 되는 현상

h2. 2. 재현 절차

* V2.1.6.0 버전으로 패치 후, [환경 설정] > [제품 정보]를 확인합니다.

h2. 3. 예상 결과

'V2.1.6.0'이 출력 되어야 합니다.

```bash
SNIPER NGFW V2.1.6.0
SNIPER NGFW Gateway V2.1.6.0
Model Info: SNIPER NGFW V2.1.6.0 3510
```

h2. 4. 실제 결과

'V2.1.0.4'가 출력됩니다.

```bash
SNIPER NGFW V2.1.0.4
SNIPER NGFW Gateway V2.1.0.4
Model Info: SNIPER NGFW V2.1.0.4 3510
```

h2. 5. 발생 버전

```bash
Sniper> trap_buf -r

Sniper NGFW machine = x86_64

MODEL    NGFW 3510

SNIPER NGFW Gateway V2.1.6.0
 * Kernel  V2.1.6.0_815_0791e485 2024.07.22 00:38:06
 * Ramdisk V2.1.6.0_861_0fbfae15 2024.07.22 02:31:03
 * Openapp V2.1.6.0_40_375f24c2 2024.07.22 02:31:03
 * Winsapp V2.1.6.0_5541_8dac1ee6 2024.07.22 02:31:03
```

h2. 6. 장비 및 접속 정보
 
* 장비 정보 : 3510 
* 장비 주소 : 10.0.5.56

* 다른 테스트 장비도 동일 현상 나타납니다. 

h2. 7. TC ID

* 

---

h1. 결함 분석 및 해결 

h2. 1. 원인 (사유)

* 

h2. 2. 수정 방향

* 

h2. 3. 수정 확인

* 

h2. 4. 해결 버전

* 

---

h1. 품질 테스트 결과 확인 사항

h2. 1. 수정 확인

* 

h2. 2. 확인 버전 

* 

h2. 3. 확인 장비

* 장비 HW 정보 : 
* 장비 IP 주소 : 

h2. 4. Release Note

* 
