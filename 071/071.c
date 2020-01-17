#include <stdio.h>

int main(int argc, char*arvg[]) {
    double target = 3./7;
    long d, n;
    long closestn = 0;
    double closest = 1;
    double diff;

    for (d=1; d <= 1000000; d++) {
    //for (d=1; d <= 100; d++) {
        n = target * (double)d;
        diff = target - (double) n / d;
        //printf("n=%d, target - n / d = %f\n", n, diff);
        if (diff < closest && diff > .00000000001) {
            closest = diff;
            closestn = n;
            printf("n=%d, target - n / d = %.11f\n", closestn, closest);
        }
    }
}
		



