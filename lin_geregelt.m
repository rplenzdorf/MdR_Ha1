function F = lin_geregelt(x,l,m,k,g,k_reg)

F   = [0 1; -g/l *cosd(105)-k_reg/(l^2*m) -k/l*m]*x;

end

