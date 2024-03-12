function x = GS (A,b,x,tol,itMax)

%Initialisierung
n = length(b);
x_alt = x ;
it = 0;
err = norm(b - A*x);

%Abbruchbedingung
while ( (err/norm(b)) > tol && it < itMax)
  
  %Vektor x berechnen
  for i = 1:n       %Zeilen von x durchgehen 
     x(i) = (b(i) - A(i,[1:i-1, i+1:n] )*x([1:i-1,i+1:n]) )/ A(i,i);
  end 

  %Werte Aktualisieren
  err = norm( b - A*x );
  it = it + 1;
  
end 
  
end
