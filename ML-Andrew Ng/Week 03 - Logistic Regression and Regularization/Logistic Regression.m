% no regulation
% ============================================================ %
%SIGMOID
g = 1./(1+exp(-z))      %remember to add .

%COSTFUNCTION
hof_theta = (1./(1+exp(sum((-theta'.*X)'))))';
J = -1/m*sum(y.*log(hof_theta) + (1.-y).*log(1.-hof_theta));        % Logistic Regression Cost

grad = (hof_theta - y)'*X/m;
grad = grad';                                                       % Logistic Regression Gradient

%PREDICT
judge = (1./(1+exp(sum((-theta'.*X)'))))';
for i = 1:length(judge)
    if judge(i) >= 0.5
        p(i) = 1;
    else
        p(i) = 0;
    end
end      

% regulation
% ============================================================ %
%COSTFUNCTIONREG
hof_theta = (1./(1+exp(sum((-theta'.*X)'))))';
J = -1/m*sum(y.*log(hof_theta) + (1.-y).*log(1.-hof_theta));
J = J + lambda/2/m.*sum(theta(2:3).*theta(2:3))                     % Regularized Logistic Regression Cost

grad = (hof_theta - y)'*X/m;
grad = grad';
grad(2:3) = grad(2:3) + lambda/m.*theta(2:3)                        % Regularized Logistic Regression Gradient

% plot
% ============================================================ %
%PLOTDATA 
pos = find(y == 1); 
neg = find(y == 0);

plot(X(pos, 1), X(pos, 2) ,'k+');
plot(X(neg, 1), X(neg, 2) ,'ko');
