#include <stdio.h>
#include "increasing.h"

int main() {
    char s1[] = "hasta la vista, baby";

    int result = increasing(s1);
    printf("%s\n%d\n", s1, result);

    char s2[] = "cba";
    result = increasing(s2);
    printf("%s\n%d\n", s2, result);

    return 0;
}