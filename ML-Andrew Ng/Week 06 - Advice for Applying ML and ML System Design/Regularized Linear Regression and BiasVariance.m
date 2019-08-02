% =========================================================================
%LINEARREGCOSTFUNCTION
a = X * theta;
J = sum((a-y).^2)/2/m + lambda/2/m*(sum((theta).^2) - theta(1).^2);

grad = ((a-y)'*X/m)' + lambda/m.*theta;
grad(1) = grad(1) - lambda/m.*theta(1);

%POLYFEATURES
for i = 1:numel(X)
    for j = 1:p
        X_poly(i, j) = X(i)^j;
    end
end

%LEARNINGCURVE
for i = 1:m
    theta = trainLinearReg(X(1:i,:), y(1:i), lambda);
    error_train(i) = linearRegCostFunction(X(1:i,:), y(1:i), theta, 0);
    error_val(i) = linearRegCostFunction(Xval, yval, theta, 0);
end

%VALIDATIONCURVE
for i = 1:length(lambda_vec)
    lambda = lambda_vec(i);
    theta = trainLinearReg(X, y, lambda);
    error_train(i) = linearRegCostFunction(X, y, theta, 0);
    error_val(i) = linearRegCostFunction(Xval, yval, theta, 0);
end