function F = lin_nichtreg_euler(k,l,m,g,k_reg,M_0,dt,plt)
    t_0     = 0;
    t_end   = 100;
    t_k     = t_0:dt:t_end;


    x(:,1)  = [75; 0];
    dx(:,1) = [x(1,1)-105,0];
    u(1) = M_0;
    
    %Simulation
    for i=2:length(t_k)
        u(i) = M_0;
        dx(:,i) = dx(:,i-1) + dt * lin_ungeregelt(dx(:,i-1),0,l,m,k,g);
    end


    % Plot
    if plt == 1
        plot(t_k, dx(plt,:)+105,"LineStyle","--")
    elseif plt == 2
        plot(t_k, dx(plt,:)+105,"LineStyle","--")
    elseif plt == 3
        plot(t_k, u,"LineStyle","--")
    end
    grid on
end