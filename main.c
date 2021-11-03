#include "NumClass.h"
#include <stdio.h>


int main() {
    int isPrime(int n);
    int isArmstrong(int n);
    int isStrong(int n);
    int isPalindrome(int n);
    int x, y;
    scanf("%d %d", &x, &y);

    if(x<=y) {
        printf("%s", "The Armstrong numbers are:");
        for(int i=x ; i<=y ; i++) {
            if(isArmstrong(i)==1)
                printf(" %d", i);
        }
        printf("\n");
        printf("%s", "The Palindromes are:");
        for(int i=x ; i<=y ; i++) {
            if(isPalindrome(i)==1)
                printf(" %d", i);
        }
        printf("\n");
        printf("%s", "The Prime numbers are:");
        for(int i=x ; i<=y ; i++) {
            if(isPrime(i)==1)
                printf(" %d", i);
        }
        printf("\n");
        printf("%s", "The Strong numbers are:");
        for(int i=x ; i<=y ; i++) {
            if(isStrong(i))
                printf(" %d", i);
        }
    }
    else {
         printf("%s", "The Armstrong numbers are:");
        for(int i=y ; i<=x ; i++) {
            if(isArmstrong(i)==1)
                printf(" %d", i);
        }
        printf("\n");
        printf("%s", "The Palindromes are:");
        for(int i=y ; i<=x ; i++) {
            if(isPalindrome(i)==1)
                printf(" %d", i);
        }
        printf("\n");
        printf("%s", "The Prime numbers are:");
        for(int i=y ; i<=x ; i++) {
            if(isPrime(i)==1)
                printf(" %d", i);
        }
        printf("\n");
        printf("%s", "The Strong numbers are:");
        for(int i=y ; i<=x ; i++) {
            if(isStrong(i))
                printf(" %d", i);
        }
    }
}
