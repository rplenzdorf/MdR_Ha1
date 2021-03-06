function F = lin_reg_euler(k,l,m,g,k_reg,M_0,dt,plt)
    clear x dx u du  

    %% Definition des Zeitbereichs
    t_0     = 0;
    t_end   = 100;
    t_k     = t_0:dt:t_end;

    %% Initialisierung der Zustands- und Stellgrößen 
    x(:,1)  = [75; 0];
    dx(:,1) = [x(1,1)-105,0];
    du(1) = k_reg*(-dx(1,1));

    %% Simulation des linearisierten, gergelten Systems mit dem Eulerverfahren
    for i=2:length(t_k)
        du(i) = k_reg*(-dx(1,i-1));
        dx(:,i) = dx(:,i-1) + dt * lin_geregelt(dx(:,i-1),l,m,k,g,k_reg);
    end

    %% Plot der Zustands- und Stellgrößen
    if plt == 1
        plot(t_k, dx(plt,:)+105,'linewidth', 2)% Addition der Führungsgröße da das System linarisiert ist
    elseif plt == 2
        plot(t_k, dx(plt,:),'linewidth', 2)
    elseif plt == 3
        plot(t_k, (du+M_0),'linewidth', 2)
    end
    title(['Euler, dt=',num2str(dt),'s'],"FontSize",16)
    hold on
    grid on
end