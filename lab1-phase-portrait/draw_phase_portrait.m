function [eig] = draw_phase_portrait(A, T, sim)
%DRAW_PHASE_PORTRAIT Draws a phase portrait of 2nd order linear system based on simulink model
%   Creates a new figure and draws the phase portrait
%   Input: 
%       A: matrix A of linear 2nd order dynamic system
%       T: time of simulation
%       sim: path to the simulink model
%   Output: 
%       eig: eigenvalues of matrix A

[w J] = eig(A);
figure; hold on; grid on;
a = 0: (pi/10): (2*pi);
X1 = [cos(a) sin(a)];
X2 = X1 ./ [max(abs(X1)); max(abs(X1))]; M = size(X2, 2);
for l = 1:M
    x0 = X2(:, l);
    sim('model', T);
    plot(x(:, 1), x(:, 2), 'k-');
    plot([0, w(1,1)], [0, w(2,1)], 'k-', [0, w(1,2)], [0, w(2,2)], 'k-');
    title(['lambda(A)=[', num2str(J(1,1)),',',num2str(J(2,2)),']']);
    xlabel('x1');ylabel('x2');
end


end

