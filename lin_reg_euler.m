function F = lin_reg_euler(k,l,m,g,k_reg,M_0,dt,plt)
    t_0     = 0;
    t_end   = 100;
    t_k     = t_0:dt:t_end;


    x(:,1)  = [75; 0];
    dx(:,1) = [x(1,1)-105,0];
    u(1) = M_0;

    for i=2:length(t_k)
        u(i) = k_reg*(105-dx(1,i-1))+M_0;
        dx(:,i) = dx(:,i-1) + dt * lin_geregelt(dx(:,i-1),l,m,k,g,k_reg);
    end

    % Plot
    if plt == 1
        plot(t_k, dx(plt,:)+105)
    elseif plt == 2
        plot(t_k, dx(plt,:)+105)
    elseif plt == 3
        plot(t_k, u)
    end
    title(['Euler, dt=',num2str(dt),'s'])
    hold on
    grid on
end