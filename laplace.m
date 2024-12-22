reset(symengine);


% Define symbolic variable for time 't', Laplace variable 's', and parameters 'a' and 'w'
syms t s a w

% Define the exponentially increasing function: e^(at)
f_exp = exp(a*t);

% Define the sine function: sin(w*t)
f_sin = sin(w*t);

% Define the unit step function using Heaviside function: heaviside(t)
f_step = heaviside(t);

% Compute the Laplace transform of the exponentially increasing function
L_f_exp = laplace(f_exp, t, s);

% Compute the Laplace transform of the sine function
L_f_sin = laplace(f_sin, t, s);

% Compute the Laplace transform of the unit step function
L_f_step = laplace(f_step, t, s);

% Display the result of the Laplace transform for e^(a*t)
disp('Laplace Transform of e^(a*t):')
disp(L_f_exp)

% Display the result of the Laplace transform for sin(w*t)
disp('Laplace Transform of sin(w*t):')
disp(L_f_sin)

% Display the result of the Laplace transform for the unit step function
disp('Laplace Transform of heaviside(t):')
disp(L_f_step)


% Define symbolic variable for Laplace domain 's', time 't', and parameters 'a' and 'w'
syms s t a w

% Define the Laplace transforms for different functions
L_f_exp = 1/(s - a);         % Laplace of e^(a*t)
L_f_sin = w/(s^2 + w^2);     % Laplace of sin(w*t)
L_f_step = 1/s;              % Laplace of heaviside(t)

% Inverse Laplace Transforms
f_exp = ilaplace(L_f_exp, s, t);  % Inverse Laplace of exponentially increasing function
f_sin = ilaplace(L_f_sin, s, t);  % Inverse Laplace of sine function
f_step = ilaplace(L_f_step, s, t); % Inverse Laplace of unit step function

% Display results
disp('Inverse Laplace Transform of 1/(s - a):')
disp(f_exp)

disp('Inverse Laplace Transform of w/(s^2 + w^2):')
disp(f_sin)

disp('Inverse Laplace Transform of 1/s:')
disp(f_step)
