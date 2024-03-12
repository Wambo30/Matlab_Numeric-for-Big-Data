function  NewtonFraktale (nStart, tol, itMax)
%Funktion zum NewtonFraktal
% Bieber, Okan 874666
% Wahid Far, Okhtay 870485
%
%Input:  nStart = Faktor zur Intervallunterteilung 
%        tol    = Abbruchbedingung welche fürs Newtonverfahren benötigt wird 
%        itMax  = Abbruchbedingung welche fürs Newtonverfahren benötigt wird 
%
%Output: Grafik des sogenannten NewtonFraktals


%Implementierung der gegebenen Funktion und der Ableitung
f = @(x1,x2) [x1.^3-3*x1*x2.^2-1; -x2.^3+3*x1.^2*x2];
Jf= @(x1,x2) [3*x1.^2-3, -6*x1*x2; 6*x1*x2, -3*x2.^2+3*x1.^2];



%Achseneinteilung der Graphik 
x = linspace(1,-1,nStart);  
y = linspace(-1,1,nStart);  

root = [0;0];
M = zeros(nStart,nStart);
Nullstellen = zeros(3,2);
Zeile = 1;                       

for i = 1:nStart
  for j = 1:nStart
    
    
    prevRoot = root;
    [root,it] = Newton(f,Jf,[x(i);y(j)],tol,itMax);
    
    %Test ob die Funktion divergiert 
    if it == itMax
      M(j,i) = 0;
    end
   
    %Hier wird der Nullstelle einem Farbwert zugeordnet
    switch round(root'*10)
      
      case round(Nullstellen(1,:)*10)
        M(j,i) = 1;
      case round(Nullstellen(2,:)*10)
        M(j,i) = 2;
      case round(Nullstellen(3,:)*10)
        M(j,i) = 3;
      otherwise
        
        %Diese Abschnit trägt noch unbekannte Nullstellen in die NS-Matrix ein 
        Nullstellen(Zeile,:) = root ;
        switch Zeile
          
          case 1
            M(j,i) = 1;
          case 2
           M(j,i)  = 2;
          case 3
            M(j,i) = 3;
        end    
        % Die Variable "Zeile" steht für die Zeile der Nullstellenmatrix  
        Zeile = Zeile+1;
      end  
      
     
  end
end

%Grafik manipulieren
M=20*M;               
img=image(x,y,M)
colorbar
set(gca,'fontsize',15)
print img.jpg 
end
