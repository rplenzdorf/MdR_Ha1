function F = nichtlin_ungeregelt(x,u,l,m,k,g)

F   = [x(2); -g/l*sind(x(1))-k/(l*m)*x(2)]+[0; 1/(l^2 *m)]*u;

end

