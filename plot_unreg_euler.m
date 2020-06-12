function F = plot_unreg_euler(k,l,m,g,k_reg,M_0,dt)
    t_0     = 0;
    t_end   = 100;
    t_k     = t_0:dt:t_end;


    x(:,1)  = [75; 0];
    dx(:,1) = [105-x(1,1),0];
    
    %Simulation
    for i=2:length(t_k)
        x(:,i) = x(:,i-1) + dt * nichtlin_ungeregelt(x(:,i-1),M_0,l,m,k,g);
    end

    % Plot
    plot(t_k, x(1,:),"LineStyle","--")
    hold on
    
    clear x dx
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