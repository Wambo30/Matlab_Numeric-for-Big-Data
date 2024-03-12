
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% testfkt mit gegebener fkt f1 und f2

x_1 = [0.1,0.1]';
x_2 = [5,5]';
x_3 = [20,20]';
tol = 1e-3;
itMax = 1000;
f = @(x) [x(1)^2+x(2)-4;x(2)*exp(-x(1))-2];
Jf = @(x) [2*x(1),1;-x(2)*exp(-x(1)),exp(-x(1))];

[x_neu , it] = Newton (f, Jf, x_1, tol, itMax)
disp ('test mit x_1 fertig');
[x_neu , it] = Newton (f, Jf, x_2, tol, itMax)
disp ('test mit x_2 fertig');
[x_neu , it] = Newton (f, Jf, x_3, tol, itMax)
disp ('test mit x_3 fertig');