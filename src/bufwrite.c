// added
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"

#define N 5

void forktest(void) {
  int n, pid;

  printf(1, "fork test\n");

  for (n = 0; n < N; n++) {
    pid = fork();
    if (pid < 0)
      break;
    if (pid == 0)
      exit();
  }

  if (n == N) {
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }

  for (; n > 0; n--) {
    if (wait() < 0) {
      printf(1, "wait stopped early\n");
      exit();
    }
  }

  if (wait() != -1) {
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
}

/* #define MAX 1000000 */
/* void calculate_pi() { */
/*   int x; */
/*   for (int i = 0; i < MAX; i++) { */
/*     for (int j = 0; j < MAX; j++) { */
/*       for (int k = 0; k < MAX; k++) { */
/*         x += 1000; */
/*         x /= 10; */
/*         x /= 10; */
/*         x /= 10; */
/*         x -= 1; */
/*       } */
/*     } */
/*   } */
/* } */

int main(int argc, char *argv[]) {
  forktest();
  /* calculate_pi(); */
  exit();
}
