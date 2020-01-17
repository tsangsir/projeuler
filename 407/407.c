#include <stdio.h>

unsigned long long M(unsigned long a) {
	//printf("%ld, %llu\n", a, a*a);
	printf("%lld\n", 1000L);
	return a*a;
}

int main(int argc, char *argv[]) {
	printf("%llu\n", M(1e3));
}

