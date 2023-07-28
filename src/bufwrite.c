// added

#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[]) {
  printf(2, "start logging...\n");
  bufwrite();
  printf(2, "logging finished\n");
  exit();
}
