#include <stdio.h>
#include "removerng.h"

int main(int argc, char* argv[]) {
    char* label = "abcdef";
    char low = 'c';
    char up = 'd';

    char* result = removerng(label, low, up);
    printf("%s\n", result);

    return 0;
}