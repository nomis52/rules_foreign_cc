#include <assert.h>
#include "volume.h"

int main(int argc, char **argv) {
  int a = volume(2,3,4);
  assert(a == 24);
  return 0;
}
