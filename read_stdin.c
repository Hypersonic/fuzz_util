#include "read_stdin.h"
#include <stdio.h>

char *read_stdin()
{
    size_t len = 1024, l = 0;
    char *contents = malloc(len);
    int c;
    while ((c = getc(stdin)) != EOF) {
        contents[l++] = c;
        if (l == len) {
            if (NULL == realloc(contents, len*2)) {
                return NULL;
            }
            len *= 2;
        }
    }
    contents[l] = '\0';
    return contents;
}
