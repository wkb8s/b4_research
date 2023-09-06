// added
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"

#define N 100
#define MAX 1000000000

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

void calculation() {
  volatile int x = 0;
  for (int i = 0; i < MAX; i++)
    x++;
}

int main(int argc, char *argv[]) {
  /* fork(); */
  /* fork(); */
  /* fork(); */
  /* forktest(); */

  /* if (getpid() < 8) */
    calculation();

  /* sleep(300); */
  exit();
}
