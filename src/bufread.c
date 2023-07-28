// added

#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[]) {
  int ret = bufread();
  printf(2, "bufread : %d\n", ret);
  exit();
}
