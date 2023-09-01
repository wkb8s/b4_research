#include <stdint.h>
#include <stdio.h>
#include <unistd.h>
#include <inttypes.h>

uint64_t rdtsc(void) {
  unsigned int lo, hi;
  __asm__ __volatile__("rdtsc" : "=a"(lo), "=d"(hi));
  return ((uint64_t)hi << 32) | lo;
}

int main() {
  uint64_t num = 100;
  printf("%" PRIu64 "\n", num);
  printf("%" PRIx64 "\n", num);
  printf("\n");

  printf("%" PRIu64 "\n", rdtsc());
  printf("%" PRIx64 "\n", rdtsc());
  sleep(1);
  printf("%" PRIu64 "\n", rdtsc());
  printf("%" PRIx64 "\n", rdtsc());
  sleep(1);
  printf("%" PRIu64 "\n", rdtsc());
  printf("%" PRIx64 "\n", rdtsc());
  sleep(1);
  printf("%" PRIu64 "\n", rdtsc());
  printf("%" PRIx64 "\n", rdtsc());
}

