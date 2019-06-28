%%% For one variable
%-----------------------------------------------------------------------%
% WARMUPEXERCISE
A = eye(5);

% PLOTDATA function
plot(x,y, 'rx', 'MarkerSize', 10);
xlabel('population');
ylabel('revenue');

% COMPUTECOST
J = sum((X*theta - y).^2)/2/m;                          % hint : write the dimensions of these matrix or vector, thinking will become clear.

% GRADIENTDESCENT
theta = theta - alpha/m*((X*theta - y)'*X)';


%%% For multiple variables
%-----------------------------------------------------------------------%