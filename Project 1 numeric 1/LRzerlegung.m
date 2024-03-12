%Funktion zur LR-Zerlegung
%
%Input: 
% -Eine (n x n)  Matrix A (A ist regul�r)
% -Ein (n x 1) Vektor b als rechte seite
%
%Output:
% -Eine linke untere Dreiecksmatrix L (n x n)
% -Eine rechte obere Dreicksmatrix R (n x n)
% -Ein durch die Pivotisierung permutierter Vektor P (n x 1)
%
function [L,R,P] = LRzerlegung (A)

%Dimensionen bestimmen
[n] = length(A);

%Speicher reservieren
L = zeros(n,n);
R = zeros(n,n);

P = [1:n]';%Permutationsvektor 

for (j = 1:(n-1) )%SPALTEN
  
  if( A(j,j) ~= max(abs(A(j:n,j))) )
  
    [~,l] = max(abs(A(j:n,j))); %nur ausgabe der zeile mit h�chsten wert
    l = l+ (j-1); %Korrekturfaktor
    
    %Permutation
    
    %Die Matrix A und der Vektor P werden gleichzeitig 
    %permutiert und am ende wieder aufgesplittet
    B = [A,P];
    
    %Eigentliche Permutation
    z = B(l,:);
    B(l,:) = B(j,:);
    B(j,:) = z;
    
    if 0
    z = A(l,:);
    A(l,:) = A(j,:);
    A(j,:) = z;
    
    z = P(l,:);
    P(l,:) = P(j,:);
    P(j,:) = z;
    end
    
    %Zur�ckaufsplitten in A und P 
    A = B(:,1:n);
    P = B(:,n+1);
  end
  
  %Elimination
  %Die Werte werden in die Ausgangsmatrix eingetragen
  
  for (i= (j+1):n)%ZEILEN
    A(i,j) = A(i,j)/A(j,j);%Eintrag in L, pr�fung 
    for(k = (j+1):n )
      A(i,k) = A(i,k) - A(i,j)*A(j,k);%Eintrag in R
    end
  end
  
end

%L aus umgeformten A bestimmen 
L = tril(A);

%Diagonale von L auf 1 setzten
for (f = 1:n)
  L(f,f) = 1;
end

%R aus umgeformten A bestimmen
R = triu(A)
  
endfunction
