#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int chain[10000000];
int sq[82];

int get_chain(int x) {
	int i;
	char * s;
	s=(char*) malloc(10);
	int tmp=0;
	
	if (chain[x] !=0 ) {
		return chain[x];
	}
	sprintf(s, "%d", x);
	for (i=0; i < strlen(s); i++) {
		//tmp += (s[i]-48)*(s[i]-48);
		tmp += sq[s[i]-48];
		
	}
	//printf("%d, %d: \n ", x, tmp);
	if (tmp == 89 || tmp == 1) {
		chain[x]=tmp;
		return tmp;
	}
	else {
		chain[x]=get_chain(tmp);
		return chain[x];
	}
	free(s);
}

int main(int argc, char * argv[]) {
	int x, i, record89=0;

	for (i=0; i < 82; i++) {
		sq[i]=i*i;
	}
	for (i=1; i < 10000000; i++) {
		chain[i]=0;
	}

	for (i=1; i < 10000000; i++) {
		/*
		if (get_chain(i)==89) {
			record89++;
		}
		*/
		if (chain[i]==89) {
			record89++;
		}
		else {
			if (get_chain(i) == 89) {
				record89++;
			}
		}
	}
	printf("%d\n", record89);
}
