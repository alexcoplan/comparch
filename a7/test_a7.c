#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

void exA7(void *base);

int main(void)
{
  static uint8_t mem[10 * 1024];

  uint64_t *a = (uint64_t *)(mem + 1000);
  uint64_t *b = (uint64_t *)(mem + 3000);
  uint64_t *c = (uint64_t *)(mem + 5000);

  memset(mem, 0xff, sizeof(mem));

  *c = 42;
  for (unsigned i = 0; i <= 100; i++) {
    b[i] = i;
  }

  for (unsigned i = 101; i < 250; i++) {
    assert(a[i] == UINT64_MAX);
    assert(b[i] == UINT64_MAX);
    assert(c[i] == UINT64_MAX);
  }

  exA7(mem);

  for (unsigned i = 0; i <= 100; i++) {
    assert(a[i] == b[i] + *c);
  }

  for (unsigned i = 101; i < 250; i++) {
    assert(a[i] == UINT64_MAX);
    assert(b[i] == UINT64_MAX);
    assert(c[i] == UINT64_MAX);
  }

  printf("OK\n");
  return 0;
}
