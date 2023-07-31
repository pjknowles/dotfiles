#include <iostream>
#include <cmath>
#include <stdlib.h>
using namespace std;

#define MAXIT 100

double func(double x){
	return 2 * sin(x) - x;
}

double secant(double x1, double x2, double xacc){
	double fl, f;
	double root;
	double xl;
	double swap;
	double dx;

	fl = func(x1);
	f = func(x2);
	if (abs(fl) > abs(f)){
		root = x1;
		xl = x2;
		swap = fl;
		fl = f;
		f = swap;
	}
	else{
		xl = x1;
		root = x2;
	}

	for (int i=1; i<=MAXIT; i++){
		dx = (xl - root) * f / (f-fl);
		xl = root;
		fl = f;
		root = root + dx;
		f = func(root);
		if (abs(dx) < xacc || f == 0.)
			return root;
		if (i == MAXIT)
			return 1000;
	}
}

int main(){
	double x1, x2, acc, ans;

	cout << "Enter x1: ";
    cin >> x1;
    cout << "Enter x2: ";
    cin >> x2;
    cout << "Enter accuracy: ";
    cin >> acc;

	ans = secant(x1, x2, acc);
	if (ans == 1000){
		cout << "Max iterations reached" << endl;
    	return 1;
    }
    else{
        cout << "The root is: " << ans << endl;
        return 0;
    }
}
