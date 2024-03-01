/*
 * exo2.c - Manipulation d'opérateurs logiques
 *
 * Author(s) : Nathan Rayburn
 */

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

#include <libleds.h>


int main(int argc, char **argv) {
    init_reg_leds();

    uint32_t leds = get_reg_leds();
    printf("leds = %x\n", leds);
    const uint32_t mask = 0xFF000000;
    uint32_t MSB = leds & mask;
    printf("MSB = %x\n", MSB);

    leds ^= ~mask; // Invert all the bits except the MSB
    printf("Inverted leds = %x\n", leds);

    leds &= mask | 0x00FFFFFF; // Keep the MSB, clear other bits
    printf("leds with MSB = %x\n", leds);
    set_reg_leds(leds);

    return 0;
}
