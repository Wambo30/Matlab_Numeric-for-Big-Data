function best = relax(a,n,save_plot)
%Input:  save_plot = true oder false (1 oder 0) Soll plot gespeichert werden?
%        n         = Dimension der Matrix A und den Vektoren b und x
%        a         = Parameter um Intervall einzugrenzen
%
%Output: best = der für diesen Fall optimalste Relaxionsparameter 

%Werte für die SOR-Funktion erstellen
A = full(gallery('tridiag',n,-1,2,-1))
b = ones(n,1);
x = b;
relax = a:0.01:1.99;

%Ausgabevektor erstellen
m = length(relax);
y = zeros(m,1);

%Laufvariable
t = 0;

%y-Achse erstellen
for i = 1:m
  [~,y(i)] = SOR(A,b,x,relax(i),1e-2,200);
  t = t+1   %Schritt anzeigen
end

%Optimalen Relaxionsparameter bestimmen
[~,index] = min(y);
best = relax(index); %    (index - 1)/100;
 
 
% Grafik manipulation 
relax_opt = semilogy(relax,y,'linewidth',2);  
set(gca,'fontsize',15)                      %%Korrekturbedarf
xlabel ('Omega')
ylabel ('Iterationen')
title (['Optimaler Relaxionsparameter = ',num2str(best)])


% Bei bedarf plot speichern
if save_plot
  print relax_opt.pdf 
end


end
