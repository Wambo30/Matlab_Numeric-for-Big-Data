%Funktion zur forwärtssubstitution 
%
% Bieber, Okan 874666
% Wahid Far, Okhtay 870485
%
%Input:
% -Eine linke untere Dreiecksmatrix R ( R^(n x n) )
% -Ein Vektor b  R^(n)
%
%Output:
% -Ein Ergebnisvektor x R^(n)
%
function x = forwardSub (R, b)

%Dimension bestimmen
n = length(b);

%Ergebisvektor reservieren
x = zeros(n,1);

x(1) = x(1) + b(1)/R(1,1);    %Erster Vektoreintrag

for (i = 2:n)%ZEILE
  
  x(i)=b(i);                  %rechte Seite 
  
  for (k = 1:i-1)%SPALTE
    x(i) = x(i)-R(i,k)*x(k);  %bereits errechneter x Wert mit Vorfaktor
  end 
  x(i) = x(i)/R(i,i);         %Vorfaktor vom gesuchten Wert bestimmen
end

endfunction
