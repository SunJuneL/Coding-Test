#include <stdio.h>
#include <string>

using namespace std;

enum {
    // n의 최대값
    MAX_N = 1000001,
};

// 소수인지 판별할 배열
bool isPrimeNumber[MAX_N];

// 에라토스테네스의 체를 이용해 소수들을 구하는 함수
void eratosthenes() {
    // 2부터 MAX_N - 1까지의 값을 true로 저장
    for (int i = 2; i < MAX_N; i++) {
        isPrimeNumber[i] = true;
    }
    
    // 2부터 제한된 값 까지 확인하며 소수의 배수를 거름 (에라토스테네스의 체)
    for (int i = 2; i * i < MAX_N; i++) {
        if (isPrimeNumber[i] == true) {
            for (int j = 2; i * j < MAX_N; j++) {
                isPrimeNumber[i * j] = false;
            }
        }
    }
}

// 소수들의 합(골드바흐 추측)을 구하는 함수
void goldbach(int n) {
    // limit의 값은 n의 절반
    int limit = n / 2;
    
    // 3부터 limit까지의 값 i와, n에서 i를 뺀 값 j를 소수인지 확인하여, 둘 다 소수라면 식을 print후 리턴
    for (int i = 3; i <= limit; i += 2) {
        int j = n - i;
        if (isPrimeNumber[i] == true && isPrimeNumber[j] == true) {
            printf("%d = %d + %d\n", n, i, j);
            return;
        }
    }

    // 골드바흐의 추측이 틀렸다면, 틀렸다는 문구 String을 print후 리턴
    printf("Goldbach's conjecture is wrong.\n");
}

// 정답을 출력할 함수
void answer() {
    while (true) {
        // 테스트케이스로 값 n이 입력됨
        int n;
        scanf("%d", &n);
        
        // n 값이 6 미만이라면 입력을 멈춤
        if (n < 6) {
            break;
        }
        
        // 테스트케이스 n이 골드바흐의 추측대로인지 확인
        goldbach(n);
    }
}

int main() {
    eratosthenes();
    answer();
}
