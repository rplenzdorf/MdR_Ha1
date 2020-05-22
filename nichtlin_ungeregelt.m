function F = nichtlin_ungeregelt(x,u,l,m,k,g)

F   = [0 1; -g/l -k/l*m]*[sind(x(1)); x(2)]+[0; 1/(l^2 *m)]*u;

end

