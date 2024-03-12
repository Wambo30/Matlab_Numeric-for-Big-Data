function t = testLgs()
  
  % Dimensionsvariable bestimmen 
  
  n = 3;
  while(n <= 1)
    n = round(rand*10);
  end
  
  %Matrix bestimmen
  A = round(rand(n,n)*10);
  
  %Rechte Seite bestimmen 
  b = round(rand(n,1)*10);
      
  
  %Ergebnis durch die Funtion lgs ausgeben lassen 
  w = lgs(A,b);
  
    %Ergebnis durch matlab ausgeben lassen 
  v = A\b;

  diff = abs(norm(w)- norm(v));
  
  diff;
  %Auswertung
  if (diff ~= 0)
    if (diff >= 0.0001)
      disp('0')   % Das Ergenis ist Falsch 
      A
      b
      diff
    elseif(diff <= 0.0001)
      disp('rundungsfehler')
      v;
      w;
      diff
    end
  else 
    disp('1')   % Das Ergebnis ist Richtig 
  end
  
  
endfunction
