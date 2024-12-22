% Define symbolic variable for z
syms z n

% Define the unit step function
u = heaviside(n);

% Define the signal x[n]
x1_n = (1/2)^n * u + (1/4)^n * u;

% Compute the Z-transform
X1_z = ztrans(x1_n, n, z);

% Display the Z-transform
disp('The Z-transform of the signal is:');
disp(X1_z);

% Plot ROC
% First term: ROC for (1/2)^n * u[n] is |z| > 1/2
% Second term: ROC for (1/4)^n * u[n] is |z| > 1/4

% Plotting ROC (Region of Convergence)
theta = linspace(0, 2*pi, 100); % Angle from 0 to 2pi

% ROC for the first term |z| > 1/2
roc1_radius = 1/2;
roc2_radius = 1/4;

figure;
hold on;

% Plot unit circle
plot(cos(theta), sin(theta), 'k--', 'LineWidth', 1);
text(0.6, 0.1, '|z|=1', 'Color', 'black');

% Plot ROC for |z| > 1/2
roc1 = roc1_radius * exp(1i * theta);
plot(real(roc1), imag(roc1), 'r-', 'LineWidth', 1.5);
fill(real(roc1), imag(roc1), 'r', 'FaceAlpha', 0.2); % Shade the area outside |z|=1/2
text(0.3, 0, '|z| > 1/2', 'Color', 'red');

% Plot ROC for |z| > 1/4
roc2 = roc2_radius * exp(1i * theta);
plot(real(roc2), imag(roc2), 'b-', 'LineWidth', 1.5);
fill(real(roc2), imag(roc2), 'b', 'FaceAlpha', 0.2); % Shade the area outside |z|=1/4
text(0.1, 0, '|z| > 1/4', 'Color', 'blue');

% Axis settings
axis equal;
title('ROC of the Z-transform');
xlabel('Re(z)');
ylabel('Im(z)');
grid on;

hold off;
