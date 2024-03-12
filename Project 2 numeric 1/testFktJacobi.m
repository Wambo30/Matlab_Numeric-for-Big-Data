%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%test 1

A=[3 1; 2 4]
b= [ 1;2]
x=[ 3 ;4]
tol= 0.0001
itMax= 1000

loesungsvektor = Jacobi (A, b, x, tol, itMax)
matlabloesung= A\b
disp('test 1 vorbei');
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%test2

A=[4 -2 1 ; -1 5 -2; 1 1 3]
b=[2; 4; 6]
x=[1;2;1]
tol= 0.0001
itMax= 5

loesungsvektor = Jacobi (A, b, x, tol, itMax)
matlabloesung= A\b
disp('test 2 vorbei');
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
