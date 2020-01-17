#include <stdio.h>
#include <malloc.h>

int **triangle = NULL;
int **triangle_scores = NULL;
int levels = 15;

void load_data() {
	char **lineptr;
	size_t *n;
	int i, x = 0, y;
	FILE * datafile=fopen("data.txt", "r");

	n=malloc(sizeof(size_t));
	lineptr=malloc(sizeof(char**));

	*lineptr = NULL; /* let getline allocate enough space */
	while (getline(lineptr, n, datafile) > 0) {
		printf(*lineptr);
		/* parse line */
		triangle = realloc(triangle, (x + 1) * sizeof(int *));
		triangle[x] = malloc((x + 1) * sizeof(int));
		triangle_scores = realloc(triangle_scores, (x+1)*sizeof(int *));
		triangle_scores[x] = malloc((x + 1) * sizeof(int));

		for (y = 0; y <= x; y++) {
			triangle[x][y] = 0;
		}

		y = 0;
		for (i = 0; i < *n ; i++) {
			if ((*lineptr)[i] == '\n') {
				break;
			}
			if ((*lineptr)[i] != ' ') {
				triangle[x][y] *= 10;
				triangle[x][y] += (*lineptr)[i] - '0';
			}
			else {
				y++;
			}
		}
		x++;
		free(*lineptr);
		*lineptr = NULL; /* let getline allocate enough space */
	}
	fclose(datafile);
	free(lineptr);
}

int main(int argc, char *argv[]) {
	int m, n;
	load_data();

	for (m = 0; m < levels; m++) {
		for (n = 0; n <= m; n++) {
			printf("%d ", triangle[m][n]);
		}
		printf("\n");
	}

	triangle_scores=malloc(sizeof(triangle));
	for (m = 0; m < levels; m++) {
		triangle_scores[m]=malloc(sizeof(triangle[m]));
	}

	for (n = 0; n < levels; n++) {
		triangle_scores[levels - 1][n] = triangle[levels - 1][n];
		printf("%d ", triangle_scores[levels - 1][n] );
	}
	for (m = levels - 2; m >= 0; m--) {
		printf("\n");
		for (n = 0; n <= m; n++) {
			if (triangle_scores[m + 1][n] > 
				triangle_scores[m + 1][n + 1]) {
				triangle_scores[m][n] = triangle[m][n] + 
					triangle_scores[m + 1][n];
			}
			else {
				triangle_scores[m][n] = triangle[m][n] + 
					triangle_scores[m + 1][n + 1];
			}
			printf("%d ", triangle_scores[m][n] );
		}
	}
	printf("\n");
}



