function F = nichtlin(x,u,l,m,k,g)
    
    % Definition der nichtlineraren Funktion, späte für das geregelte und
    % ungeregelte System verwendet
    F   = [x(2); -g/l*sind(x(1))-k/(l*m)*x(2)]+[0; 1/(l^2 *m)]*u;

end

