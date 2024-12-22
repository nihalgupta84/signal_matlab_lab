% MATLAB code to represent and approximate Fourier series for a sine wave,
% a square wave, and a sawtooth wave in a single figure with subplots.

% Clear environment and close figures
clc;            % Clear command window
clear all;      % Clear all variables from workspace
close all;      % Close all figures

% Define Parameters for all signals
A = 10;                  % Amplitude of the waves
T_sine = pi;             % Period of the sine wave
T_square = 2*pi;         % Period of the square wave
T_sawtooth = pi;         % Period of the sawtooth wave
N = 10;                  % Number of harmonics to include in Fourier approximation
t = linspace(-2*T_square, 2*T_square, 1000);  % Time vector from -2T to 2T

% Plot 1: Fourier Series Representation of a Sine Wave
f_sine_original = A * sin(2 * t);   % Original sine wave f(t) = 10 * sin(2t)

% Since this is already a sine wave of frequency 2, its Fourier series
% representation is exactly the same as the original sine wave.
f_sine_approx = f_sine_original;

% Plot the Sine Wave and its Fourier Series Approximation
figure;
subplot(3, 1, 1);        % Create first subplot (3 rows, 1 column, position 1)
hold on;
plot(t, f_sine_original, 'b', 'LineWidth', 1.5);  % Plot original sine wave in blue
plot(t, f_sine_approx, 'r--', 'LineWidth', 1.5);  % Plot Fourier series approximation in red dashed line
title('Fourier Series Representation of a Sine Wave');
xlabel('Time (t)');
ylabel('Amplitude');
legend('Original Sine Wave', 'Fourier Series Representation');
grid on;
hold off;

% Plot 2: Fourier Series Approximation of a Square Wave
f_square_original = A * square(2 * pi * t / T_square);  % Original square wave definition

% Fourier Series Approximation for the square wave
f_square_approx = zeros(size(t));  % Initialize the approximation
for n = 1:2:(2*N - 1)
    bn = (40 / (n * pi));           % Coefficient for odd harmonics
    f_square_approx = f_square_approx + bn * sin(n * (2 * pi / T_square) * t);  % Summing odd harmonics
end

% Plot the Square Wave and its Fourier Series Approximation
subplot(3, 1, 2);        % Create second subplot (3 rows, 1 column, position 2)
hold on;
plot(t, f_square_original, 'b', 'LineWidth', 1.5);  % Plot original square wave in blue
plot(t, f_square_approx, 'r--', 'LineWidth', 1.5);  % Plot Fourier series approximation in red dashed line
title('Fourier Series Approximation of a Square Wave');
xlabel('Time (t)');
ylabel('Amplitude');
legend('Original Square Wave', 'Fourier Approximation');
grid on;
hold off;

% Plot 3: Fourier Series Approximation of a Sawtooth Wave
% Original Sawtooth Wave Definition
f_sawtooth_original = mod(t + T_sawtooth, 2 * T_sawtooth) * (A / T_sawtooth) - A;  % Adjusted for periodic repetition

% Fourier Series Approximation for the sawtooth wave
f_sawtooth_approx = zeros(size(t));  % Initialize the approximation
for n = 1:N
    bn = (20 * (-1)^(n + 1)) / (n * pi);  % Coefficient calculation for the sawtooth wave
    f_sawtooth_approx = f_sawtooth_approx + bn * sin(2 * n * t);  % Summing harmonics
end

% Plot the Sawtooth Wave and its Fourier Series Approximation
subplot(3, 1, 3);        % Create third subplot (3 rows, 1 column, position 3)
hold on;
plot(t, f_sawtooth_original, 'b', 'LineWidth', 1.5);  % Plot original sawtooth wave in blue
plot(t, f_sawtooth_approx, 'r--', 'LineWidth', 1.5);  % Plot Fourier series approximation in red dashed line
title('Fourier Series Approximation of a Sawtooth Wave');
xlabel('Time (t)');
ylabel('Amplitude');
legend('Original Sawtooth Wave', 'Fourier Approximation');
grid on;
hold off;

% Explanation of each subplot:
% 1. First subplot represents the original sine wave and its Fourier series approximation.
%    The approximation is identical to the original signal, as sine waves already represent their own Fourier series.
%
% 2. Second subplot shows the original square wave along with its Fourier series approximation using odd harmonics.
%    As more harmonics are added, the approximation becomes closer to the ideal square wave.
%
% 3. Third subplot shows the original sawtooth wave along with its Fourier series approximation.
%    The more harmonics are included, the better the Fourier series represents the sawtooth waveform.
