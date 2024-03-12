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
 
  x(l) = x(l) - R(l,l+1:n)*x(l+1:n);%Die zugehörigen xi Werte berechnen    
  
  x(l) = x(l)/R(l, l);%Durch Vorfaktor Teilen 
end
  
 
endfunction
