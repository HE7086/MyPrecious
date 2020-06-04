/* Count Set Bits using Lookup Table
 * For best performance,
 * use a table having same length with the input type's max value
 * But it's very space inefficient
 * Generally, it is sufficient to count every byte/4 bit
 * */

#include <array>
#include <vector>
#include <stdint.h>

using namespace std;

/// count set bits in a byte
static size_t count(uint8_t value) {
  // lookup table for 4 bit
  static const array<uint8_t, 16> lookupTable{0, 1, 1, 2, 1, 2, 2, 3,
                                              1, 2, 2, 3, 2, 3, 3, 4};

  return lookupTable[value & 0xfu] + lookupTable[value >> 0x4u];
}

/// count set bits in a 32-bit integer
static size_t count(uint32_t value) {
#define B2(n) n, n + 1, n + 1, n + 2
#define B4(n) B2(n), B2(n + 1), B2(n + 1), B2(n + 2)
#define B6(n) B4(n), B4(n + 1), B4(n + 1), B4(n + 2)
#define B8(n) B6(n), B6(n + 1), B6(n + 1), B6(n + 2)
  // using macro generated table for 8 bit
  static const array<uint8_t, 256> lookupTable{B8(0)};

  return lookupTable[value & 0xff] + lookupTable[(value >> 8) & 0xff] +
         lookupTable[(value >> 16) & 0xff] + lookupTable[value >> 24];
}

/// generate lookupTable for specific value length in bit
/// generateTable(8) generates table for a byte
static vector<uint8_t> generateTable(size_t length) {
  vector<uint8_t> vec(1 << length);
  vec[0] = 0;
  for (size_t i = 1; i < 1 << length; ++i) {
    vec[i] = (i & 1u) + vec[i >> 1u];
  }
  return vec;
}
