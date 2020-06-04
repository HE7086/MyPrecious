/// swap values with XOR, no extra space
/// won't work if a == b
#define swap_xor(a, b) (((a) ^= (b)), ((b) ^= (a)), ((a) ^= (b)))

/// watch out for overflows for this variation
#define swap_add(a, b) ((((a) -= (b)), ((b) += (a)), ((a) = (b) - (a))))
