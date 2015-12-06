%Anwendung des Newtonverfahrens als 
%Fraktalerzeuger in der Gausschen Ebene

e = 5e-3; % fehlertoleranz
h = 0.05; % gitterweite

f = @(x) x^3-1;
Df = @(x) 3*x^2;

% nullstellen
x0 = 1;
x1 = -0.5 + 0.5*i*sqrt(3);
x2 =  -0.5 - 0.5*i*sqrt(3);

[X,Y] = meshgrid(-2: h:2, -2 :  h : 2);
% für jeden bildpunkt die newtonfolge auswerten
Z = arrayfun(@(x,y) newton(f, Df, x + i*y,e),X,Y); 
R = zeros(size(Z));

% setzen der farben für entpsrechenden konvergenzpunkt
R(abs(Z-x0)<e)=1;
R(abs(Z-x1)<e)=2;
R(abs(Z-x2)<e)=3;

X = reshape(X,[1,length(X)^2]);
Y = reshape(Y,[1,length(Y)^2]);
R = reshape(R,[1,length(R)^2]);

% plotten des ergebnisses
scatter(X,Y,2,R,'filled');
title('Gauss-Ebene');
xlabel('Realteil');
ylabel('Imaginaerteil');
%by Niklas Götz