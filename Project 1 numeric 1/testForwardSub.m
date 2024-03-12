%test zu der Funktion forwardSub()
%
% Bieber, Okan 874666
% Wahid Far, Okhtay 870485
% 
function x = testForwardSub()
  
  %Beliebiges n im Intevall [2,10] bestimmen
  n = 0;
  while(n <= 1)
    n = round(rand*10);
  end

  %Willkürliche untere Dreiecksmatrix  ausgeben 
  A = tril(round(rand(n,n)*10));
  
  
  % Da die eigentliche Matrix die eigentlich in der Funktion lgs
  % betrachtet wird  und bei den L und R Matrizen die dafür verwendet
  % werden)
  while(min(diag(A)) == 0 )
    A = round(tril(rand(n,n)*10));
  end
  
  %Willkürlichen Vektor mit Dimension n angeben als rechte Seite
  b = round(rand(n,1)*10);
 
  %Ergebnisvektoren bestimmen
  w = forwardSub(A,b);
  v = A\b; 
 
  %Ergebnisvektoren anhand der normen vergleichen
  diff = abs(norm(w)-norm(v));
  
  %Endergebnis
  if (diff ~= 0)
    if (diff >= 0.000001)
      %Bei falschem Ergebnis Problematische Vektoren ausgeben
      disp('0')   
      A
      b
     %Willkührlich gewählter Rundungsfaktor
    elseif(diff <= 0.000001)
      disp('Rundungsfehler')
    end
  else 
    disp('1')   %normen stimmen überein
  end
  
endfunction
