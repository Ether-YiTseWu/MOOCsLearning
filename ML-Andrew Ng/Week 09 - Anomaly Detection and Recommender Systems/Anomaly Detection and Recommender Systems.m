% ============================================
% ESTIMATEGAUSSIAN
for i = 1:n
    mu(i) = mean(X(:,i));
end

for i = 1:n
    sum = 0;
    for j = 1:m
        tmp = (X(j,i) - mu(i))^2;
        sum = sum + tmp;
    end
    sigma2(i) = sum / m;
end

% SELECTTHRESHOLD
predictions = pval < epsilon;
TruePos = sum((predictions == 1) &(yval == 1));
FalsePos = sum((predictions == 1) &(yval == 0));
FalseNeg = sum((predictions == 0) &(yval == 1));

precision = TruePos/(TruePos+FalsePos);
recall = TruePos/(TruePos+FalseNeg);
    
F1 = 2*precision*recall/(precision+recall);

% COFICOSTFUNC
% X 的列向量數:資料筆數(ex:電影)、行向量數:資料的屬性數，特徵數(ex:動作、愛情片)
% R 的列向量數:資料筆數(ex:電影)、行向量數:有幾個客戶在該系統的範疇中
% Theta 是每個客戶專屬的參數，由此參數可以推出該用戶對某資料(ex:電影)的評價
% Y 是用戶對某資料的評價(ex:star數)
for i = 1:size(X,1)                                      % i表示遍歷各筆資料(ex:電影)的屬性(ex:動作、愛情片)
    for j = 1:size(Theta,1)                              % 
        if R(i,j) == 1                                   % == 1 的位置是有被用戶評分的電影
            J = J + 1/2*(X(i,:)*Theta(j,:)'-Y(i,j))^2 ;  % X*Theta會跑出該筆資料的預測評價(ex:star數)
        end
    end
end

for i = 1:size(X,1)                                      % i表示遍歷各筆資料(ex:電影)的屬性(ex:動作、愛情片)
    index = find(R(i, :)==1);                            % 找出對i資料來說，有誰對此資料有評價
    X_grad(i,:) = (X(i,:)*Theta(index, :)' - Y(i, index))*Theta(index, :);
    X_grad(i,:) =  X_grad(i,:)+lambda*X(i,:);
end

for j = 1:size(Theta,1)
    index = find(R(:, j)==1);
    Theta_grad(j,:) = X(index,:)'*(X(index,:)* Theta(j,:)' - Y(index, j));
    Theta_grad(j,:)=Theta_grad(j,:)+lambda*Theta(j,:);
end