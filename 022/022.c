#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ROWLEN 80000
#define MAXNAMES 10000

static int
cmpstringp(const void *p1, const void *p2)
{
   return strcmp(* (char * const *) p1, * (char * const *) p2);
}

int main(int argc, char * argv[]) {
	char * names[MAXNAMES] ;
	char * buffer=(char*)malloc(ROWLEN);
	char * buffer_strtok;
	int bytes_read=1;
	size_t bytes_wanted;
	int row_idx=0;
	int i=0, j;
	int total_names;
	int score, total_score=0;

	FILE *f=fopen("names.txt", "r");
	buffer = (char *) malloc(ROWLEN * sizeof(char *));
	fscanf(f, "%s", buffer);

	names[i]=strtok_r(buffer, ",", &buffer_strtok);
	while (names[i]) {
		i++;
		names[i]=strtok_r(NULL, ",", &buffer_strtok);
	}
	total_names=i;
	qsort(names, total_names, sizeof(char *), cmpstringp);
	for (i=0; i<total_names; i++) {
		score=0;
		for (j=1; names[i][j] != '"'; j++) {
			score += names[i][j]-64;
		}
		//printf("%d: %s, score=%d\n", i+1, names[i], score);
		total_score += (i+1) * score;
	}
	printf ("%d\n", total_score);
	free(buffer);

}



