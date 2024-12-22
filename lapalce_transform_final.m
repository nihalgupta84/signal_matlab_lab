% Reset the symbolic engine to avoid errors
reset(symengine);

%% Section 1: Symbolic Laplace Transforms

% Define symbolic variable for time 't', Laplace variable 's', and parameters 'a' and 'w'
syms t s a w

% Define functions: e^(a*t), sin(w*t), and heaviside(t)
f_exp = exp(a*t);        % Exponentially increasing function
f_sin = sin(w*t);        % Sine function
f_step = heaviside(t);   % Unit step function

% Compute Laplace Transforms
L_f_exp = laplace(f_exp, t, s);  % Laplace transform of e^(a*t)
L_f_sin = laplace(f_sin, t, s);  % Laplace transform of sin(w*t)
L_f_step = laplace(f_step, t, s);% Laplace transform of heaviside(t)

% Display Laplace Transform results
disp('Symbolic Laplace Transforms:');
disp('Laplace Transform of e^(a*t):'); disp(L_f_exp);
disp('Laplace Transform of sin(w*t):'); disp(L_f_sin);
disp('Laplace Transform of heaviside(t):'); disp(L_f_step);

%% Section 2: Symbolic Inverse Laplace Transforms

% Define Laplace domain expressions
L_f_exp = 1/(s - a);          % Laplace of e^(a*t)
L_f_sin = w/(s^2 + w^2);      % Laplace of sin(w*t)
L_f_step = 1/s;               % Laplace of heaviside(t)

% Compute Inverse Laplace Transforms
f_exp_inv = ilaplace(L_f_exp, s, t);   % Inverse Laplace of e^(a*t)
f_sin_inv = ilaplace(L_f_sin, s, t);   % Inverse Laplace of sin(w*t)
f_step_inv = ilaplace(L_f_step, s, t); % Inverse Laplace of heaviside(t)

% Display Inverse Laplace Transform results
disp('Symbolic Inverse Laplace Transforms:');
disp('Inverse Laplace of 1/(s - a):'); disp(f_exp_inv);
disp('Inverse Laplace of w/(s^2 + w^2):'); disp(f_sin_inv);
disp('Inverse Laplace of 1/s:'); disp(f_step_inv);

%% Section 3: Numerical Laplace Transforms using Integral

% Define numerical parameters
t_max = 50;   % Upper limit for time approximation (for infinity)
s_num = 1;    % Example Laplace domain variable (can be adjusted)

% Define numerical functions
a_num = 2;    % Example parameter for e^(a*t)
w_num = 5;    % Example frequency for sin(w*t)

% Numerical integration to compute Laplace Transforms
L_f_exp_num = integral(@(t) exp(a_num*t) .* exp(-s_num*t), 0, t_max);  % Numerical Laplace of e^(a*t)
L_f_sin_num = integral(@(t) sin(w_num*t) .* exp(-s_num*t), 0, t_max);  % Numerical Laplace of sin(w*t)
L_f_step_num = integral(@(t) 1 .* exp(-s_num*t), 0, t_max);            % Numerical Laplace of heaviside(t)

% Display Numerical Laplace Transform results
disp('Numerical Laplace Transforms:');
disp('Numerical Laplace Transform of e^(a*t):'); disp(L_f_exp_num);
disp('Numerical Laplace Transform of sin(w*t):'); disp(L_f_sin_num);
disp('Numerical Laplace Transform of unit step function:'); disp(L_f_step_num);

%% Section 4: Known Inverse Laplace Transforms from Tables

% Re-define symbolic variables for clarity
syms t s a w

% Use known Inverse Laplace transforms from tables
f_exp_known = exp(a*t);        % Inverse of 1/(s - a) is e^(a*t)
f_sin_known = sin(w*t);        % Inverse of w/(s^2 + w^2) is sin(w*t)
f_step_known = heaviside(t);   % Inverse of 1/s is heaviside(t)

% Display known Inverse Laplace results
disp('Known Inverse Laplace Transforms from Tables:');
disp('Inverse Laplace of 1/(s - a):'); disp(f_exp_known);
disp('Inverse Laplace of w/(s^2 + w^2):'); disp(f_sin_known);
disp('Inverse Laplace of 1/s:'); disp(f_step_known);
