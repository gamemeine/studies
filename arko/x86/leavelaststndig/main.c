#include <stdio.h>
#include "leavelaststndig.h"

int main() {
    char* label = "abcde";
    int n = 1;

    char* result = leavelaststndig(label, n);
    printf("%s\n", result);

    return 0;
}