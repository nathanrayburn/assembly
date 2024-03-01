/*
 * exo3.c - Endianness determination exercise
 *
 * Author(s): Nathan Rayburn
 */

#include <stdio.h>

int check_endianness() {
    int i = 1;
    return (*((char *)&i) == 1);
}

int main(int argc, char **argv) {
    if (check_endianness())
        printf("This machine is little-endian.\n");
    else
        printf("This machine is big-endian.\n");
    
    return 0;
}