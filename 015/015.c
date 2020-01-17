#include <stdio.h>

long long **routes;
int x_dim = 10;
int y_dim = 20;

void init_routes() {
	int x, y;
	routes = malloc(sizeof(long long*) * (x_dim + 1));
	for (x = 0; x <= x_dim; x++){
		routes[x] = malloc(sizeof(long long) * (y_dim + 1));
		for (y = 0; y <= y_dim; y++) {
			routes[x][y] = -1;
		}
	}
}
	
long long get_route_count(unsigned char x, unsigned char y) {
	if (routes[x][y] != -1) {
		return routes[x][y];
	}
	if (x == 0 || y == 0) {
		routes[x][y] = 1;
		return 1;
	}
	routes[x][y] = get_route_count(x - 1, y) + get_route_count(x, y - 1);
	if (x_dim >= y && y_dim >= x) {
		routes[y][x] = routes[x][y];
	}
	return routes[x][y];
}

int main(int argc, char *argv[]) {
	init_routes();
	printf("Routes of a %dx%d grid: %lld\n", 
			x_dim, y_dim, get_route_count(x_dim, y_dim));
}
