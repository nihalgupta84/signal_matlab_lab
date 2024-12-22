% MATLAB code to approximate the Fourier series of a sawtooth wave
clc;
clear all;
close all;
% Parameters
A = 10;                 % Amplitude of sawtooth wave
T = pi;                 % Period of the sawtooth wave
N = 10;                 % Number of harmonics to include
t = linspace(-2*T, 2*T, 1000);  % Time vector from -2T to 2T

% Original Sawtooth Wave Definition
f_original = (2*A/T) * t;   % f(t) = (20/pi) * t for t in [-pi, pi]
f_original = mod(t + T, 2*T) * (A / T) - A;  % Adjusted for periodic repetition

% Fourier Series Approximation
f_approx = zeros(size(t));  % Initialize the approximation

% Loop through harmonics to approximate the Fourier series
for n = 1:N
    bn = (20 * (-1)^(n + 1)) / (n * pi);
    f_approx = f_approx + bn * sin(2 * n * t);
end

% Plotting
figure;
hold on;
plot(t, f_original, 'b', 'LineWidth', 1.5);  % Original sawtooth wave
plot(t, f_approx, 'r--', 'LineWidth', 1.5);  % Fourier series approximation
title('Fourier Series Approximation of a Sawtooth Wave');
xlabel('Time (t)');
ylabel('Amplitude');
legend('Original Sawtooth Wave', 'Fourier Approximation');
grid on;
hold off;
