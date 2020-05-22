function F = lin_geregelt(x,u,l,m,k,g,k_reg)

F   = [0 1; 0.1016-k_reg/(l^2*k) -k/l*m]*x+[0; 1/(l^2 *m)]*u;

end

