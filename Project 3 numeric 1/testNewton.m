function  Ergebnis = testNewton 
%Testfunktion zum Testen der Newtonfunktion 
% Bieber, Okan 874666
% Wahid Far, Okhtay 870485
%
%Output: Ergebnis des Newtonverfahren für 3 verschiedene Anfangsvektoren
  
  %Spezifisch gewählte Anfangsvektoren 
  x0 = [ 1,1 ; -1,-1 ; -2,3 ; 3,-1 ];
  
  % Implementierung der Funktionen aus der Aufgabenstellung 
  f = @(x1,x2) [x1^2+x2-4; x2*e^(-x1)-2];
  Jf= @(x1,x2) [2*x1,1;-x2*x1*e^(-x1), e^(-x1)];
  
  
  tol   = 1e-5;   %Toleranzwert für die Abbruchbedingung vom Newtonverfahren
  itMax = 100;    %Maximal erlaubte Anzahl der Iterationen
  
  
  %Durchführen des Newtonverfahrens für die oben angegebenen Anfangsvektoren
  for i = 1:4
    [Loesung,it]=Newton(f,Jf,x0(i,:)',tol,itMax);
    Loesung       % Ausgabe der Lösungen
    
    %Im Falle von Divergenz
    if itMax ==it 
      disp('Divergenz')     
    end
    
  end
end
