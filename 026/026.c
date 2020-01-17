#include <stdio.h>

void initialize(int slots[]) {
	int i;
	slots[0]=1;
	for (i=1;i<=9999;i++) {
		slots[i]=0;
	}
}

int main(int argc, char *argv[]) {
	int slots[10000] ;
	int i;
	int longest=0;
	int winner;
	int tmp;
	int dig_cnt;

	for (i=1; i <10000; i++) {
		dig_cnt = 0;
		initialize(slots);
		tmp = 10000 % i;
		//printf("%d: ", i);
		while(slots[tmp]==0) {
			slots[tmp]=1;
			tmp = tmp * 10 % i;
			dig_cnt += 1;
			//printf("%d", tmp);
		}
		if (dig_cnt > longest) {
			longest = dig_cnt;
			winner = i;
			printf("%d - Digit Count: %d\n", i, dig_cnt);
		}
	}
	printf ("Winner is: %d\n", winner);
}



	
