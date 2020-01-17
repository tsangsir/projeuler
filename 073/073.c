#include <stdio.h>

int is_reduce_proper(int n, int d) {
    int r = d - (d / n) * n;
    if (r == 0) {
        return 0;
    }
    else if (r == 1) {
        return 1;
    }
    else {
        return is_reduce_proper(r, n);
    }
}
int main(int argc, char*arvg[]) {
    double lb = 1./3, ub = 1./2;
    int cnt;
    int ln, un, d, chk;

    for (d=1; d <= 12000; d++) {
    //for (d=1; d <= 8; d++) {
        ln = lb * (double)d + 1;
        un = ub * (double)d;
        for (chk = ln; chk <= un; chk++) {
           cnt += is_reduce_proper(chk, d);
        }
        //printf("d=%d, cnt = %d\n", d, cnt);
    }
    printf("d=%d, cnt = %d\n", d, cnt);
}
		



