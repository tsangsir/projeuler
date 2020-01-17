#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char *argv[]) {
	unsigned char *digits;
	int x, y, sum, numdigits, p;

	p = 1000;
	numdigits = log(2) * p / log(10) + 1;

	digits = malloc(sizeof(unsigned char) * numdigits);
	digits[0] = 1;
	for (y = 1; y <= numdigits; y++) {
		digits[y] = 0;
	}

	for (x = 1; x <= p; x++) {
		for (y = numdigits - 1; y >= 0; y--) {
			digits[y] <<= 1;
			if (digits[y] >= 10) {
				digits[y] -= 10;
				digits[y+1] += 1;
			}
		}
	}
	sum = 0;
	printf("2^%d=", p);
	for (y = numdigits - 1; y >= 0; y--) {
		printf("%d", digits[y]);
		sum += digits[y];
	}
	printf("\nSum of digits=%d\n" , sum);
}

