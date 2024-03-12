function [x_neu , it] = Newton (f, Jf, x_alt, tol, itMax)
%Funktion zur berechnung des Newtonverfahrens 
% Bieber, Okan 874666
% Wahid Far, Okhtay 870485
%Input:  - f    =  Funktion welche zum berechnen des Newtonverfahrens verwendet wird 
%        - Jf   =  Ableitung/Jacobimatrix der Funktion f
%        - x_alt=  Anfangsvektor bei dem das Newtonverfahren starten soll
%        - tol  =  Abbruchbedingung(Falls Genauigkeit ausreichend)
%        - itMax=  Abbruchbedingung(Im Falle von divergenz)     
%
%Output: Ergebnis des Newtonverfahren für 3 verschiedene Anfangsvektoren

%Variablen Allozieren
it = 0;
err = 1;

  
  while(err > tol && it < itMax)
    
    %Berechnung der Differenz
    delta = lgs( Jf(x_alt(1),x_alt(2)) ,-f(x_alt(1),x_alt(2)) );
    x_neu = x_alt + delta ; 

    it = it+1;                    %Iterationszahl mitzählen
    err = norm(x_alt-x_neu);      %Fehler bestimmen
    x_alt = x_neu;                %Genauerern Vektor dem alten zuweisen
      
  end
  
  
end
