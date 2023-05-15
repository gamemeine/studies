#include <stdio.h>
#include "remrep.h"

int main() {
    char* s = "assssssssssabbccaaaaaaaaaaaa";

    char* result = remrep(s);
    printf("%s\n", result);

    return 0;
}