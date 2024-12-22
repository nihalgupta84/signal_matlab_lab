% Define symbolic variable z
syms z n

% Define the Z-transform X(z)
X_z = (1 + 2*z^(-1) + z^(-2)) / (1 - 3*z^(-1) + 2*z^(-2));

% Perform long division
% Break X(z) into separate terms as derived: 1/2 + (1/2)z^(-1) + (7/2) * z^(-1) * (1 / (1 - 3*z^(-1) + 2*z^(-2)))

X_divided = 1/2 + (1/2)*z^(-1) + (7/2) * z^(-1) * (1 / (1 - 3*z^(-1) + 2*z^(-2)));

% Compute the inverse Z-transform of the simplified X(z)
x_n = iztrans(X_divided, z, n);

% Display the inverse Z-transform
disp('The inverse Z-transform of the signal is:');
disp(x_n);

% Plot the result
n_values = 0:10;  % Define the range of n for plotting
x_n_values = subs(x_n, n, n_values);  % Substitute values of n into x_n

% Plot the inverse Z-transform result
figure;
stem(n_values, x_n_values, 'filled');
title('Inverse Z-transform of X(z)');
xlabel('n');
ylabel('x[n]');
grid on;
