function u = aufgabe3(h) 
%Input : h
 
f = @(x) 1/(x^2);
%--------------------------------------------
n = 1/h;

%Matrix A bestimmen
A = full(gallery('tridiag',n-1,-1,2,-1));
A = A/h.^2;

x = zeros(n+1,1);   %x-Werte für die Funktion festlegen
b = ones(n-1,1);    %"Rechte Seite", Speicher einrichten 
u = ones(n-1,1);    %Ergebnis, Speicher einrichten


for j = 1:n+1
  x(j)=(j-1)*h;
end

%X-Werte in die Funktion einsetzen
for i = 1:n-1
  b(i) =  f(x(i+1))
end

%Ergebnis berechnen
[u,~]=SOR(A,b,u,1.6,1e-10,200);
u = [0;u;0]       %Randbpunkte bestimmen

%Ergebnis plotten
plot(u,'linewidth',2)
set(gca,'fontsize',15)                      %%Korrekturbedarf



 
end
