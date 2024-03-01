/*
 * exo1.c - String allocation and copy exercise
 *
 * Author(s) : Nathan Rayburn
 */

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

char *allocate_string(const char *string, int length) {
    char *alloc = calloc(length, sizeof(char));
    for(int i = 0; i<length;++i){
    	alloc[i] = string[i];
    }
    return alloc;
}

int main(int argc, char **argv) {
    printf("Welcome to ASM\n");

    char* string;

    string = allocate_string("hi\0", 3);

    printf("%s",string);

    free(string);
    return 0;
}
