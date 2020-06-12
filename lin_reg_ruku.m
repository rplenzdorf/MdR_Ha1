function F = lin_reg_ruku(k,l,m,g,k_reg,M_0,dt)

    t_0     = 0;
    t_end   = 100;

    t_k     = t_0:dt:t_end;


    x(:,1)  = [75; 0];
    dx(:,1) = [105-x(1,1),0];
    u(1) = 0;
    for i = 2:length(t_k)

        u = k_reg*(105-x(1,i-1))+M_0;

        k_1     = nichtlin_ungeregelt(x(:,i-1),u,l,m,k,g);
        k_2     = nichtlin_ungeregelt(x(:,i-1) + 1/2 * dt * k_1,u,l,m,k,g);
        k_3     = nichtlin_ungeregelt(x(:,i-1) + 1/2 * dt * k_2,u,l,m,k,g);
        k_4     = nichtlin_ungeregelt(x(:,i-1) + dt * k_3,u,l,m,k,g);

        x(:,i)  = x(:,i-1) + 1/6 * dt * (k_1 + 2*k_2 + 2*k_3 + k_4);
    end

    plot(t_k, x(1,:))
    title(['RK4, dt=',num2str(dt),'s'])
    grid on