% MATLAB code to numerically approximate the Continuous-Time Fourier Transform (CTFT) and
% Inverse Fourier Transform of the unit step function u(x), with all plots
% displayed in a single figure.

clc;            % Clear the command window
clear variables; % Clear all variables
close all;      % Close all figures

% Define the time range for the original signal
x_vals = linspace(-10, 10, 1000);  % Time values from -10 to 10 for plotting
u_vals = heaviside(x_vals);        % Evaluate the unit step function over the time range

% Numerical approximation of Fourier Transform
f_vals = linspace(-10, 10, 1000);  % Frequency values from -10 to 10 for plotting (in Hz)
F_vals = zeros(size(f_vals));      % Initialize Fourier Transform values

for k = 1:length(f_vals)
    f = f_vals(k);
    F_vals(k) = integral(@(x) heaviside(x) .* exp(-1j * 2 * pi * f * x), 0, 10, 'ArrayValued', true);  % Integrate from 0 to 10
end

% Numerical approximation of Inverse Fourier Transform
t_vals = linspace(-10, 10, 1000);  % Time values from -10 to 10 for plotting
f_t_vals = zeros(size(t_vals));    % Initialize Inverse Fourier Transform values

for k = 1:length(t_vals)
    t = t_vals(k);
    f_t_vals(k) = integral(@(f) interp1(f_vals, F_vals, f, 'linear', 0) .* exp(1j * 2 * pi * f * t), -10, 10, 'ArrayValued', true);  % Use interp1 for smoother evaluation
end

% Create a single figure with all subplots
figure;
set(gcf, 'Color', 'w'); % Set figure background to white for better visibility

% Plot 1: Original Unit Step Function
subplot(4, 1, 1);
plot(x_vals, u_vals, 'b', 'LineWidth', 1.5);
title('Original Unit Step Function u(t)');
xlabel('Time (t)');
ylabel('u(t)');
grid on;
ylim([-0.2, 1.2]);  % Set y-axis limits to better visualize the step

% Plot 2: Magnitude of Fourier Transform
subplot(4, 1, 2);
plot(f_vals, abs(F_vals), 'b', 'LineWidth', 1.5);
title('Magnitude of Fourier Transform of u(t)');
xlabel('Frequency (f) [Hz]');
ylabel('|F(f)|');
grid on;

% Plot 3: Phase of Fourier Transform
subplot(4, 1, 3);
plot(f_vals, angle(F_vals), 'r', 'LineWidth', 1.5);
title('Phase of Fourier Transform of u(t)');
xlabel('Frequency (f) [Hz]');
ylabel('Phase of F(f) (radians)');
grid on;

% Plot 4: Inverse Fourier Transform Result (Reconstructed Signal)
subplot(4, 1, 4);
plot(t_vals, real(f_t_vals), 'b', 'LineWidth', 1.5);
title('Inverse Fourier Transform of F(f) (Reconstructed Unit Step Function u(t))');
xlabel('Time (t)');
ylabel('f(t)');
grid on;
ylim([-0.2, 1.2]);  % Set y-axis limits to better visualize the step

% Explanation of Each Plot:
% 1. The first subplot shows the original unit step function u(t), with a transition from 0 to 1 at t = 0.
% 2. The second subplot shows the magnitude of the Fourier Transform, |F(f)|, representing the frequency-domain characteristics of u(t).
% 3. The third subplot shows the phase of the Fourier Transform, providing information about the phase shift for each frequency component.
% 4. The fourth subplot shows the reconstructed unit step function from the Inverse Fourier Transform, which should match the original u(t).