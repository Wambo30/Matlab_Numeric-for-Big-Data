%Funktion zur Rückwärtssubstitution 
%
% Bieber, Okan 874666
% Wahid Far, Okhtay 870485
%
%Input: 
% -Eine invertierbare rechte obere Dreiecksmatrix R^(n x n)
% -Einen Vektor b R^(n)
%
%Output:
% -Einen Ergebnisvektor x R^(n)
%
function x = backwardSub (R, b)

%Dimension 
n = length(b);

%Ergebnisvektorspeicher reservieren
x = zeros(n,1);

x(n) = b(n)/R(n, n);%Letzter Vektoreintrag

%Ablauf von unten nach oben
%Werte auf die rechte Seite schieben
for(l = n-1:-1:1 )%ZEILE
  x(l) = b(l); 
  for(k = l+1:n )%SPALTE
    x(l) = x(l) - R(l,k)* x(k);%Die zugehörigen xi Werte berechnen    
  end
  x(l) = x(l)/R(l, l);%Durch Vorfaktor Teilen 
end
  
 
endfunction
