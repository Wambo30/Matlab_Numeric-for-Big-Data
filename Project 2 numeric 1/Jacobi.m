function x = Jacobi (A, b, x, tol, itMax)
 
%Initialisierung
n = length(b);
x_alt = x ;
it = 0;
err = norm(b - A*x);

%Abbruchbedingung
while ( (err/norm(b)) > tol && it < itMax )
  
  %x_neu ( x ) berechnen
  for i = 1:n 
    x(i) = (b(i) - A(i,[1:i-1, i+1:n] )*x_alt([1:i-1,i+1:n]) )/ A(i,i);
  end
  
  %Werte aktualisieren
  x_alt = x;  %neue x weiterbenutzt
  err = norm(b - A*x); 
  it = it + 1;
  
end

end