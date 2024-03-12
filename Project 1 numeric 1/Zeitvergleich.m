% Bieber, Okan 874666
% Wahid Far, Okhtay 870485

function Zeitvergleich(n)

x = 2.^(1:n)  
y = 1:n
for (i = 1:n)% länge der x achse bestimmen
  
  A = round(rand(x(i),x(i))*10);
  b = round(rand(x(i),1)*10);
  
  
  tic
  lgs(A,b);
  t1 = toc;
  
  tic
  A\b;
  t2 = toc;
  
  diff = t1-t2;
  
  y(i) = diff;
  
end

  plot(x,y);
endfunction
