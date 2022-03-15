function [w] = draw_pp(A, T, init_div)
% draw_pp - draws phase portrait of 2nd order linear system
% and returns it's eigenvectors

% eigenvalue calculation
[w J] = eig(A);

% initial conditions
a = 0:(pi/init_div):(2*pi); 
X1 = [cos(a); sin(a)];
X2 = X1./[max(abs(X1)); max(abs(X1))];

% simulate for each initial value
M = size(X2, 2);
figure; hold on; grid on;
for i=1:M
    % select the next initial condition
    x0=X2(:,i);
    
    % put x0 into the workspace, so that the model can use it
    assignin('base', 'x0', x0); 
    
    % simulate
    sim('linear_2nd_order',T);
    
    % plot the phase trajectories
    plot(y(:,1), y(:,2));
    plot(10*[0, w(1, 1)], 10*[0, w(1, 2)], 'k-',...
        10*[0, w(2, 1)], 10*[0, w(2, 2)], 'k-', 'LineWidth', 2);
    
    % add title with eigenvalues
    title(['lambda A = ', num2str(J(1,1)), ', ', num2str(J(2,2))]);
    
    xlabel('x1');ylabel('x2');
    xlim([-1 1]); ylim([-1 1]);
end

end
