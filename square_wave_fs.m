% MATLAB code to approximate the Fourier series of a square wave

% Parameters
A = 10;                 % Amplitude of square wave
T = 2*pi;               % Period of the square wave
N = 10;                 % Number of harmonics to include
t = linspace(-2*T, 2*T, 1000);  % Time vector from -2T to 2T

% Original Square Wave Definition
f_original = A * square(2*pi*t/T);

% Fourier Series Approximation
f_approx = zeros(size(t));  % Initialize the approximation

% Loop through odd harmonics to approximate the Fourier series
for n = 1:2:(2*N - 1)
    bn = (40 / (n * pi));
    f_approx = f_approx + bn * sin(n * (2*pi/T) * t);
end

% Plotting
figure;
hold on;
plot(t, f_original, 'b', 'LineWidth', 1.5);  % Original square wave
plot(t, f_approx, 'r--', 'LineWidth', 1.5);  % Fourier series approximation
title('Fourier Series Approximation of a Square Wave');
xlabel('Time (t)');
ylabel('Amplitude');
legend('Original Square Wave', 'Fourier Approximation');
grid on;
hold off;
