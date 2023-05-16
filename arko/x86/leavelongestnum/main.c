#include <stdio.h>
#include "leavelongestnum.h"

int main() {
    char* s = "123a456b789";

    char* result = leavelongestnum(s);
    printf("%s\n", result);

    return 0;
}