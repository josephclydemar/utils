#include "debugging.h"
#include "logging.h"

int main(void) {
  uint32_t x = 7, y = 4;
  ASSERT("MAIN", x < y, "Hello, World!!");
  DEBUG_LOG("MAIN", "(x: %u, y: %u)", x, y);
}
