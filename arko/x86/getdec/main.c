#include <stdio.h>
#include "getdec.h"

int main() {
    char* s = "a12345b678";

    unsigned int result = getdec(s);
    printf("%d\n", result);
    
    return 0;
}