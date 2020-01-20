#include <stdio.h>
#include <math.h>
#include <malloc.h>


void add_prime_factor(int * pflist, int * addlist, int pfcnt, int alcnt) {
	if (pfcnt % 10 == 9) {
		pflist = realloc(pflist,
			sizeof(int)*(pfcnt + 10));
		}
	}

int * prime_factorize(int x) {
	/* will actaully be array size - 1 because index 0 not used */
	int i, sqrtx;
	int *pf, ii;
	static int array_size = 0; 
	static int** prime_factors;
	static int* prime_factor_count;

	printf("prime_factorize: x=%d\n", x);
	if (array_size >= x && prime_factor_count[x] != -1)
		return prime_factors[x];

	if (array_size == 0 ) {
		prime_factors = (int **) malloc(sizeof(int *) * (x + 1));
		prime_factor_count = (int *) malloc(sizeof(int) * (x + 1));
		for (i = array_size; i <= x; i++) {
			prime_factors[i] = malloc(sizeof(int) * (10));
			prime_factor_count[i] = -1;
		}
		array_size = x;
	}
	else if (array_size < x) {
		prime_factors = (int **) realloc(
			prime_factors, sizeof(int *) * (x + 1));
		prime_factor_count = (int *) realloc(
			prime_factor_count, sizeof(int) * (x + 1));
		for (i = array_size; i <= x; i++) {
			prime_factors[i] = malloc(sizeof(int) * (10));
			prime_factor_count[i] = -1;
		}
		array_size = x;
	}

	sqrtx = sqrt(x);
	for (i = 2; i <= sqrt(x); i++) {
		if (prime_factor_count[i] == -1) {
			prime_factorize(i);
		}
		if (prime_factor_count[i] == 1) {
			if (( x % i) == 0) {
				if (prime_factor_count[x] % 10 == 9) {
				prime_factors[x] = realloc(prime_factors[x],
					sizeof(int)*(prime_factor_count[x] + 10));
				}
				prime_factors[x][++prime_factor_count[x]] = i;
				pf=prime_factorize(x/i);
				for (ii=0; pf[ii] != -1; ii++) {
					if (prime_factor_count[x] % 10 == 9) {
					prime_factors[x] = realloc(prime_factors[x],
						sizeof(int)*(prime_factor_count[x] + 10));
					}
					prime_factors[x][++prime_factor_count[x]] = pf[ii];
				}
			}
		}
	}
	if (prime_factor_count[x] == -1) {
		prime_factors[x][0] = x;
		prime_factor_count[x] = 1;
		prime_factors[x][1]=-1;
	}
	else {
		prime_factor_count[x]++;
		if (prime_factor_count[x] % 10 == 9) {
			prime_factors[x] = realloc(prime_factors[x],
				sizeof(int)*(prime_factor_count[x] + 10));
		}
		prime_factors[x][prime_factor_count[x]]=-1;
	}
	for (i=0; i < prime_factor_count[x];i++) {
		printf("Found factor of %d: %d\n", x, prime_factors[x][i]);
	}

	return prime_factors[x];
}

int main(int argc, char * argv[]){
	int n = 10000;
	int i;

	int* pf = prime_factorize(n);
	pf = prime_factorize(n);

	for (i=0; pf[i] != -1; i++) {
		printf("%d, ",  pf[i]);
	}
	printf("\n");
}
					
