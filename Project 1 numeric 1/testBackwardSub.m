%test zu der Funktion backwardSub()
%
% Bieber, Okan 874666
% Wahid Far, Okhtay 870485
% 
function x = testBackwardSub
  
  %Ein beliebiges n finden im Intevall [2-10]
  n = 0;
  while( n <= 1 )
   n = round(rand*10);
  end 
  
  %Eine reguläre rechte obere Dreicksmatrix bestimmen(nxn)
  A = round(triu(rand(n,n)*10));
  
  %Da bei der LRzerlegung eine Matrix wiedergegeben wird welche
  %auf der Diagonale keine null besitzt
  while(min(diag(A)) == 0 )
    A = round(triu(rand(n,n)*10));
  end
  
  %beliebeige rechte Seite wiedergeben
  b = round(rand(n,1)*10);
   
  %Ergebnis der eigenen Implementierung
  w = backwardSub(A,b);
  
  %Ergebnis der Matlab Implementierung
  v = A\b;
  
  %Ergebnisse vergleichen indem die Norm beider Vektoren verglichen wird 
  diff = abs(norm(w)-norm(v));
  
  %Endergebnis 
  if (diff ~= 0)%wenn die Vektoren nicht 100% übereinstimmen
    
    if(diff >= 0.000001)
    %Ausgabe der Matrix und des Vektors bei denen der Fehler 
    %aufgetreten ist zur weiteren Untersuchung
      disp('0')     
      A                     
      b
    elseif(diff <= 0.000001)    %willkührlich gewählte Grenze für Rundungsfehler
      disp('Rundungsfehler')
    end
  else
    disp('1')    %Die Vektoren stimmen überein
  end

 endfunction 
 