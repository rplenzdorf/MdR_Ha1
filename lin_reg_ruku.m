function F = lin_reg_ruku(k,l,m,g,k_reg,M_0,dt,plt)

    t_0     = 0;
    t_end   = 100;

    t_k     = t_0:dt:t_end;

    clear x dx

    x(:,1)  = [75; 0];
    dx(:,1) = [x(1,1)-105,0];
    du(1) = k_reg*(-dx(1,1));
    
    for i = 2:length(t_k)
        du(i) = k_reg*(-dx(1,i-1));
        k_1     = lin_geregelt(dx(:,i-1),l,m,k,g,k_reg);
        k_2     = lin_geregelt(dx(:,i-1) + 1/2 * dt * k_1,l,m,k,g,k_reg);
        k_3     = lin_geregelt(dx(:,i-1) + 1/2 * dt * k_2,l,m,k,g,k_reg);
        k_4     = lin_geregelt(dx(:,i-1) + dt * k_3,l,m,k,g,k_reg);

        dx(:,i)  = dx(:,i-1) + 1/6 * dt * (k_1 + 2*k_2 + 2*k_3 + k_4);
    end

    if plt == 1
        plot(t_k, dx(plt,:)+105)
    elseif plt == 2
        plot(t_k, dx(plt,:))
    elseif plt == 3
        plot(t_k, du+M_0)
    end
    title(['RK4, dt=',num2str(dt),'s'])
    grid on
    hold on