#include <stdio.h>
#include <string.h>

char *zero_to_nineteen[] = {
	"zero",
	"one",
	"two",
	"three",
	"four",
	"five",
	"six",
	"seven",
	"eight",
	"nine",
	"ten",
	"eleven",
	"twelve",
	"thirteen",
	"fourteen",
	"fifteen",
	"sixteen",
	"seventeen",
	"eighteen",
	"nineteen"
	};


char *tens[] = {
	"zero",
	"ten",
	"twenty",
	"thirty",
	"forty",
	"fifty",
	"sixty",
	"seventy",
	"eighty",
	"ninety"
	};

char hundred[] = "hundred";
char thousand[] = "thousand";

char * convert(char *buffer, unsigned short n){
	unsigned char last_1, last_2;
	unsigned char tens_dig, hundreds_dig, thousands_dig;
	unsigned char needs_and;
	needs_and = 0;
	/*
	if (n > 99999) {
		strcpy(buffer, "I don't know!");
		return buffer;
	}
	*/
	if (n == 0) {
		strcpy(buffer, zero_to_nineteen[n]);
		return buffer;
	}
	hundreds_dig = n / 100;
	last_2 = n - hundreds_dig * 100;

	thousands_dig = hundreds_dig / 10;
	hundreds_dig -= (thousands_dig * 10);
	if (thousands_dig > 0) {
		strcat(buffer, zero_to_nineteen[thousands_dig]);
		/*strcat(buffer, " ");*/
		strcat(buffer, thousand);
		needs_and = 1;
	}
	if (hundreds_dig > 0) {
		strcat(buffer, zero_to_nineteen[hundreds_dig]);
		/*strcat(buffer, " ");*/
		strcat(buffer, hundred);
		needs_and = 1;
	}
	if (last_2 > 0) {
		if (needs_and) {
			strcat(buffer, "and");
		}
		if (last_2 < 20) {
			strcat(buffer, zero_to_nineteen[last_2]);
			if (last_2 != 0) {
				needs_and = 1;
			}
		}
		else {
			tens_dig = last_2  / 10;
			last_1 = last_2 - tens_dig * 10;
			strcat(buffer, tens[tens_dig]);
			if (last_1 != 0) {
				/*strcat(buffer, " ");*/
				strcat(buffer, zero_to_nineteen[last_1]);
			}
		}
	}
	
	return buffer;
}

int main(int argc, char* argv[]) {
	unsigned short n;
	char buffer[100]="";
	int total = 0;

	for (n = 1; n <= 1000; n++) {
		buffer[0]='\0';
		convert(buffer, n);
		total += strlen(buffer);
		printf ("%d: %s\n", n, buffer);
	}
	printf ("%d\n", total);
}






