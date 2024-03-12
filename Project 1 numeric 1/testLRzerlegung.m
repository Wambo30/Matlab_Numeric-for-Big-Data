%test zu der Funktion LRzerlegung()
%
% Bieber, Okan 874666
% Wahid Far, Okhtay 870485
% 
function x = testLRzerlegung()
  
  %beliebige Dimension bestimmen
  n = 0 ;
  while( n <= 1 )
    n = round(rand*10);
  end 
  
  %Beliebige Matrix bestimmen
  A = round(rand(n,n)*10);
  
  %Eingenimplementierte Funktion
  [L,R,P] = LRzerlegung(A);
  
  %Von Matlab implementierte Funktion
  [T,U]=lu(A);
  
  %L Matrix zurück permutieren  
  for (i = 1:n)
    z = T(i,:);
    T(i,:)= T(P(i),:);
    T(P(i),:) = z;
    
    %Rückpermutation des Permutationsvektors
    f = P(i);
    P(i) = P(P(i));
    P(P(i)) = f;
  end
  
  %Eingentlicher check
  if ((L =~ T) || (R ~= U) )
    disp('0')     %Die Ergebnisse stimmen überein 
    A
  else
    disp('1')     %Die Ergebnisse stimmen nicht überein
  end
    
endfunction
