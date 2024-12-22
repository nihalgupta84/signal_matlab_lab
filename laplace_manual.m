% Define the time variable and the Laplace variable 's'
% Approximate the time range instead of going to infinity
t_max = 50;  % A large upper limit to approximate infinity
s = 1;  % Example Laplace variable (you can change this value)

% Define the functions
a = 2;  % Example parameter for e^(a*t)
w = 5;  % Example frequency for sin(w*t)

% Define the integrals for Laplace Transforms with bounded t_max
L_f_exp = integral(@(t) exp(a*t) .* exp(-s*t), 0, t_max);  % Laplace transform of e^(a*t)
L_f_sin = integral(@(t) sin(w*t) .* exp(-s*t), 0, t_max);  % Laplace transform of sin(w*t)
L_f_step = integral(@(t) 1 .* exp(-s*t), 0, t_max);        % Laplace transform of u(t)

% Display the results of the Laplace transforms
disp('Numerical Laplace Transform of e^(a*t):')
disp(L_f_exp)

disp('Numerical Laplace Transform of sin(w*t):')
disp(L_f_sin)

disp('Numerical Laplace Transform of unit step function:')
disp(L_f_step)


% Define the Laplace domain functions for e^(a*t), sin(w*t), and u(t)
syms s a w t

% Laplace transform of e^(a*t), sin(w*t), and u(t)
L_f_exp = 1/(s - a);  % Known Laplace of e^(a*t)
L_f_sin = w/(s^2 + w^2);  % Known Laplace of sin(w*t)
L_f_step = 1/s;  % Known Laplace of unit step function

% Use known inverse Laplace transforms from tables
f_exp = exp(a*t);  % Known inverse of 1/(s - a) is e^(a*t)
f_sin = sin(w*t);  % Known inverse of w/(s^2 + w^2) is sin(w*t)
f_step = heaviside(t);  % Known inverse of 1/s is u(t) (unit step)

% Display the known inverse Laplace results
disp('Inverse Laplace of 1/(s - a):')
disp(f_exp)

disp('Inverse Laplace of w/(s^2 + w^2):')
disp(f_sin)

disp('Inverse Laplace of 1/s:')
disp(f_step)
