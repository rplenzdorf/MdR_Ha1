function F = nichtlin_reg_euler(k,l,m,g,k_reg,M_0,dt,plt)
    clear x dx u du  

    %% Definition des Zeitbereichs
    t_0     = 0;
    t_end   = 100;
    t_k     = t_0:dt:t_end;

    %% Initialisierung der Zustands- und Stellgrößen 
    x(:,1)  = [75; 0];
    dx(:,1) = [105-x(1,1),0];
    u(1) = k_reg*(105-x(1,1))+M_0;
    
    %% Simulation des nichtlinearen ungeregelten Systems mit dem Eulerverfahren
    for i=2:length(t_k)
        u(i) = k_reg*(105-x(1,i-1))+M_0;
        x(:,i) = x(:,i-1) + dt * nichtlin(x(:,i-1),u(i),l,m,k,g);
    end

    %% Plot der Zustands- und Stellgrößen
    if plt == 1
        plot(t_k, x(plt,:),'linewidth', 2)
    elseif plt == 2
        plot(t_k, x(plt,:),'linewidth', 2)
    elseif plt == 3
        plot(t_k, u,'linewidth', 2)
    end
    hold on
end