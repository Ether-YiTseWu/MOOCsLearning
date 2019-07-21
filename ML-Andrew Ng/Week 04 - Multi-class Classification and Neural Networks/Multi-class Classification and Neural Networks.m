% ============================================================ %
%LRCOSTFUNCTION
hof_theta = (1./(1+exp(sum((-theta'.*X)'))))';
J = -1/m*sum(y.*log(hof_theta) + (1.-y).*log(1.-hof_theta));
J = J + lambda/2/m.*sum(theta(2:3).*theta(2:3))

grad = (hof_theta - y)'*X/m;
grad = grad';
grad(2:3) = grad(2:3) + lambda/m.*theta(2:3)

%ONEVSALL
for c = 1:num_labels
    initial_theta = zeros(n + 1, 1);
    options = optimset('GradObj', 'on', 'MaxIter', 50);
    all_theta(c,:) = fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)),initial_theta, options);
end

%PREDICT
X = [ones(m,1) X];

aLayer1 = sigmoid(Theta1*(X'));
aLayer1 = [ones(1,size(aLayer1,2));aLayer1];     % must use size(aLayer1,2), can't write 5000

aLayer2 = sigmoid(Theta2*aLayer1);
[A p] = max(aLayer2);
p = p';                                          % this code just make p have better readability

%PREDICTONEVSALL
judge = sigmoid(all_theta*(X'));
[A p] = max(judge);
p = p';                                          % this code just make p have better readability

