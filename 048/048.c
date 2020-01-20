#include <stdio.h>

int main(int argc, char * argv[]) {
	long int result1=0, result2, tmp1, tmp2;
	int i, j;

	for (i=1; i<=1000;i++) {
		tmp1 = i;
		tmp2 = 0;
		for (j=1; j < i; j++) {
			tmp1 = (tmp1 * i) ;
			tmp2 = (tmp2 * i) ;
			if (tmp2 > 100000) {
				tmp2 = tmp2 % 100000;
			}
			if (tmp1 > 100000) {
				tmp2 += (int)(tmp1 / 100000);
				tmp1 = tmp1 % 100000;
				printf("(%ld, %ld)", tmp2, tmp1);
			}
		}
		printf("%d: %u, %u - ", i, tmp2, tmp1);
		result1 = (result1 + tmp1) ;
		result2 = (result2 + tmp2) ;
		if (result1 > 100000) {
			result2 += (int)(result1 / 100000);
			result1 = result1 % 100000;
		}
		printf("result: %ld, %ld\n", result1, result2);
	}
	printf("%ld, %ld\n", result2, result1);
}
