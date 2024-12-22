% MATLAB code to compute the Continuous-Time Fourier Transform (CTFT) and
% Inverse Fourier Transform of the unit step function u(x), with all plots
% displayed in a single figure.

clc;            % Clear the command window
clear all;      % Clear all variables
close all;      % Close all figures

% Define symbolic variables and the unit step function
syms x f t;     % Declare x (time), f (frequency in Hz), and t (time) as symbolic variables

% Define the unit step function u(x)
u = heaviside(x);  % heaviside(x) represents the unit step function in MATLAB

% Compute the Fourier Transform using frequency f (not omega)
F_f = fourier(u, x, 2 * pi * f);  % Compute the Fourier Transform of u(x) in terms of f (Hz)

% Compute the Inverse Fourier Transform
f_t = ifourier(F_f, f, t);  % Compute the Inverse Fourier Transform to obtain f(t)

% Define the time range for plotting the original signal and inverse FT result
t_vals = linspace(-10, 10, 1000);  % Time values from -10 to 10 for plotting
u_vals = heaviside(t_vals);        % Evaluate the unit step function over the time range
f_t_vals = double(subs(f_t, t, t_vals));  % Evaluate the Inverse Fourier Transform result

% Define the frequency range and evaluate the Fourier Transform
f_vals = linspace(-10, 10, 1000);  % Frequency values from -10 to 10 for plotting (in Hz)
F_vals = double(subs(F_f, f, f_vals));  % Evaluate the Fourier Transform

% Create a single figure with all subplots
figure;

% Plot 1: Original Unit Step Function
subplot(4, 1, 1);
plot(t_vals, u_vals, 'b', 'LineWidth', 1.5);
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
plot(t_vals, f_t_vals, 'b', 'LineWidth', 1.5);
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