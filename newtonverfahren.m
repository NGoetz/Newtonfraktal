%einfaches Newtonverfahren
function x0 = newton(f,Df,x0,e)
if nargin < 3
 error('f, Df, x0 are required parameter!');
end

if (!exist('var', 'e') || e < 1e-5) 
  e = 1e-5;
 end

% maximale schrittweite von 20, dann abbrechen
n = 0;
while e <= abs(f(x0)) && n < 20
  x0 = x0-f(x0)/Df(x0);
  n=n+1;
end
end
%by Niklas Götz