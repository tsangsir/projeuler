/* cc 686.c -lm -O3 */

#include <stdio.h>
#include <math.h>

int main(int argc, char * argv[]) {
	long double log_1_pt_23 = log10(1.23);
	long double log_1_pt_24 = log10(1.24);
	long double log_2 = log10(2);
	long double log_4 = log10(4);
	long double log_8 = log10(8);
	long double log_16 = log10(16);

	long double total = 0;
	long int iter = 0;
	long int found_count = 0;

	long double log_12_pt_3_minus_log_2 = log10(12.3) - log10(2);
	long double log_12_pt_4_minus_log_2 = log10(12.4) - log10(2);
	long double log_12_pt_3_minus_log_4 = log10(12.3) - log10(4);
	long double log_12_pt_4_minus_log_4 = log10(12.4) - log10(4);
	long double log_12_pt_3_minus_log_8 = log10(12.3) - log10(8);
	long double log_12_pt_4_minus_log_8 = log10(12.4) - log10(8);


	do {
		if (total > log_12_pt_3_minus_log_2 ) {
			if (total < log_12_pt_4_minus_log_2 ) {
				found_count++;
			}
			total += log_2 - 1;
			iter ++;
		}
		else if (total > log_12_pt_3_minus_log_4 ) {
			if (total < log_12_pt_4_minus_log_4 ) {
				found_count++;
			}
			total += log_4 - 1;
			iter += 2;
		}
		else if (total > log_12_pt_3_minus_log_8 ) {
			if (total < log_12_pt_4_minus_log_8 ) {
				found_count++;
			}
			total += log_8 - 1;
			iter += 3;
		}
		else {
			total += log_16 - 1;
			iter += 4;
		}
	} while (found_count < 678910) ;
	printf("%ld\n", iter);
}


	
