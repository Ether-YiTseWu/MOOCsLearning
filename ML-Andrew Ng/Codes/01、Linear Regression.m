% For one variable
% ============================================================ %
% WARMUPEXERCISE
A = eye(5);

% PLOTDATA
plot(x,y, 'rx', 'MarkerSize', 10);
xlabel('population');
ylabel('revenue');

% COMPUTECOST
J = sum((X*theta - y).^2)/2/m;                          % hint : write the dimensions of these matrix or vector, thinking will become clear.

% GRADIENTDESCENT
theta = theta - alpha/m*((X*theta - y)'*X)';
% ============================================================ %


% For multiple variables
% ============================================================ %
% COMPUTECOSTMULTI
J = sum((X*theta - y).^2)/2/m;

% GRADIENTDESCENTMULTI
theta = theta - alpha/m*((X*theta - y)'*X)';            % same as one variable, has versatility

% NORMALEQN
theta = inv(X'*X)*X'*y;                                 % same as one variable, has versatility

% FEATURENORMALIZE
mu = mean(X);
sigma = std(X);
for i = 1:length(X(1,:))
    X_norm(:,i) = (X_norm(:,i) - mu(i))/sigma(i);       % For feature normalization, your code should work for a dataset with any number of examples and features
end                                                     % That is, X can be a matrix of any size
% ============================================================ %