#ifndef PCG_RNG
#define PCG_RNG 1
#include <stdint.h>

typedef struct { uint64_t state;  uint64_t inc; } pcg32_random_t;

#define PCG32_INITIALIZER { 0x853c49e6748fea9bULL, 0xda3e39cb94b95bdbULL };

extern uint32_t pcg32_random();
extern void pcg32_srandom(int seed);

#endif
