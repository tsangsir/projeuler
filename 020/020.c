#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	unsigned int *digits;
	int x, y, sum, numdigits, p, hidigit;

	p = 100;
	numdigits = 200; /* How to estimate number of digits in 100! ? */

	digits = malloc(sizeof(unsigned int) * numdigits);
	digits[0] = 1;
	hidigit = 1;
	for (y = 1; y <= numdigits; y++) {
		digits[y] = 0;
	}

	for (x = 1; x <= p; x++) {
		for (y = 0; y < hidigit; y++) {
			digits[y] *= x;
		}
		for (y = 0; y < hidigit; y++) {
			if (x == 11) {
				printf("%d\n", digits[y]);
			}
			if (digits[y] >= 100) {
				if (y > numdigits - 2) {
					printf("Too few digits, x=%d\n", x);
					exit(1);
				}
				digits[y+2] += digits[y] / 100;
				digits[y] -= (digits[y] / 100) * 100;
				if (hidigit < y + 3) {
					hidigit = y + 3;
				}
			}
			if (digits[y] >= 10) {
				if (y > numdigits - 1) {
					printf("Too few digits, x=%d\n", x);
					exit(1);
				}
				digits[y+1] += digits[y] / 10;
				digits[y] -= (digits[y] / 10) * 10;
				if (hidigit < y + 2) {
					hidigit = y + 2;
				}
			}
		}
	}
	sum = 0;
	printf("%d!=", p);
	for (y = numdigits - 1; y >= 0; y--) {
		printf("%d", digits[y]);
		sum += digits[y];
	}
	printf("\nSum of digits=%d\n" , sum);
}

