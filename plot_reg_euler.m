function F = plot_reg_euler(k,l,m,g,k_reg,M_0,dt)
    t_0     = 0;
    t_end   = 100;
    t_k     = t_0:dt:t_end;


    x(:,1)  = [75; 0];
    dx(:,1) = [105-x(1,1),0];

    for i=2:length(t_k)
        dx(:,i) = dx(:,i-1) + dt * lin_geregelt(dx(:,i-1),l,m,k,g,k_reg);
    end

    % Plot
    plot(t_k, -dx(1,:)+105)
    title(['Euler, dt=',num2str(dt),'s'])
    hold on
    grid on
    
    clear x dx
    x(:,1)  = [75; 0];
    dx(:,1) = [105-x(1,1),0];
    u(1) = 0;

    %Simulation
    for i=2:length(t_k)
        u = k_reg*(105-x(1,i-1))+M_0;
        x(:,i) = x(:,i-1) + dt * nichtlin_ungeregelt(x(:,i-1),u,l,m,k,g);
    end

    % Plot
    plot(t_k, x(1,:))

end
