function x = lgs(A,b)
 
 %Tests ob die Eingabe bültig ist 
 %if(det(A) == 0)
 % error('Diese eingabe ist ungueltig Matrix muss regulaer sein')
 %end 
  
  
 if(length(A) ~= length(b) )
  error('Die dimensionen stimmen nicht ueberein!')
 end
 
 [L,R,P]= LRzerlegung(A);
 
 n = length(b);

 b = b(P);
 
 c = forwardSub(L,b);
 x = backwardSub(R,c);

endfunction
