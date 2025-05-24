#include "debugging.h"
#include "logging.h"

int main(void) {
  uint32_t x = 7, y = 4;
  ASSERT_FATAL("MAIN", x > y, "Hello, World!!");
  INFO_LOG("MAIN", "(x: %u, y: %u)", x, y);
}
