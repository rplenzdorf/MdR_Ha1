function F = lin_nichtreg_euler(k,l,m,g,k_reg,M_0,dt)
    t_0     = 0;
    t_end   = 100;
    t_k     = t_0:dt:t_end;


    x(:,1)  = [75; 0];
    dx(:,1) = [105-x(1,1),0];
    
    %Simulation
    for i=2:length(t_k)
        dx(:,i) = dx(:,i-1) + dt * lin_ungeregelt(dx(:,i-1),0,l,m,k,g);
    end


    % Plot
    plot(t_k, -dx(1,:)+105,"LineStyle","--")
    grid on
end