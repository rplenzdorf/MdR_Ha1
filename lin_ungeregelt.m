function F = lin_ungeregelt(x,u,l,m,k,g)

    % Definition des linearisierten Systems mit der Systemmatrix A und der
    % Stellmatrix B
    F   = [0 1; -g/l *cosd(105) -k/(l*m)]*x+[0; 1/(l^2 *m)]*u;

end
