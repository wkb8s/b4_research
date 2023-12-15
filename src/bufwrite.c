// added
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "flags.h"

char buf[8192];
int stdout = 1;

void calculation() {
  volatile int x = 0;
  for (int i = 0; i < CALC_LOOP; i++)
    x++;
}

void smallwrite(void) {
  int fd;
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE | O_RDWR);
  if (fd >= 0) {
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for (i = 0; i < 100; i++) {
    if (write(fd, "aaaaaaaaaa", 10) != 10) {
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit();
    }
    if (write(fd, "bbbbbbbbbb", 10) != 10) {
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
  close(fd);
  fd = open("small", O_RDONLY);
  if (fd >= 0) {
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
  if (i == 2000) {
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);

  if (unlink("small") < 0) {
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
}

void largewrite(void) {
  int i, fd, n;

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE | O_RDWR);
  if (fd < 0) {
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for (i = 0; i < MAXFILE; i++) {
    ((int *)buf)[0] = i;
    if (write(fd, buf, 512) != 512) {
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);

  fd = open("big", O_RDONLY);
  if (fd < 0) {
    printf(stdout, "error: open big failed!\n");
    exit();
  }

  n = 0;
  for (;;) {
    i = read(fd, buf, 512);
    if (i == 0) {
      if (n == MAXFILE - 1) {
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if (i != 512) {
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if (((int *)buf)[0] != n) {
      printf(stdout, "read content of block %d is %d\n", n, ((int *)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
  if (unlink("big") < 0) {
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
}

void calc_write_mix() {
  int pid, pi;

  for (pi = 0; pi < FORK_NUM; pi++) {
    pid = fork();
    if (pid < 0) {
      printf(1, "fork failed\n");
      exit();
    }

    // child
    if (pid == 0) {
      // half processes execute calculation()
      if (getpid() <= 3 + CALC_NUM) {
        printf(1, "calculation() called\n");
        calculation();
      }
      // the other processes execute write()
      else {
        printf(1, "writetest() called\n");
        sleep(12);
        calculation();
        /* largewrite(); */
        /* smallwrite(); */
      }
      exit();
    }
  }

  // parent wait child
  for (pi = 0; pi < FORK_NUM; pi++) {
    wait();
  }
}

void fork_calc() {
  int pid, pi;

  for (pi = 0; pi < FORK_NUM; pi++) {
    pid = fork();
    if (pid < 0) {
      printf(1, "fork failed\n");
      exit();
    }

    // child
    if (pid == 0) {
      // wait until all processes are forked
      waitfork();

      calculation();
      exit();
    }
  }

  // parent wait child
  for (pi = 0; pi < FORK_NUM; pi++)
    wait();
}

void yieldrepeat(void) {
  for (int i = 0; i < FORK_NUM; i++) {
    // if child
    if (fork() == 0) {
      // wait until all processes are forked
      waitfork();
      /* calculation(); */
      for (int j = 0; j < 500; j++) {
        bufwrite(); // need include yield() in sys_bufwrite()
      }
      exit(); // don't forget
    }
  }

  for (int i = 0; i < FORK_NUM; i++) {
    wait();
  }
}

void writerepeat(void) {
  for (int i = 0; i < FORK_NUM; i++) {
    // if child
    if (fork() == 0) {
      // wait until all processes are forked
      waitfork();
      for (int j = 0; j < 5; j++) {
        smallwrite();
      }
      exit(); // don't forget
    }
  }

  for (int i = 0; i < FORK_NUM; i++) {
    wait();
  }
}

int main(int argc, char *argv[]) {
  if (IS_YIELD_REPEAT) {
    /* writerepeat(); */
    yieldrepeat();
  }

  if (IS_CALCULATION)
    fork_calc();

  if (IS_LARGEWRITE)
    largewrite();

  exit();
}
