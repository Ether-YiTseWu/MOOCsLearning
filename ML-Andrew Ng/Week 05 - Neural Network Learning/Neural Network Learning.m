% ======================================================================================================================================== %  
%NNCOSTFUNCTION
Y = zeros(m,max(y));                        % 本題有5000筆資料，輸入層400，隱藏層25。原資料對應的輸出為Y(5000*1)，表5000筆資料輸入後，每筆資料所得到的標籤值
for i=1:m                                   % 但在進行神經網路的計算時，輸出是5000*10的，而y是由5000*10輸出矩陣中，每一行取最大值得那個為預測標籤
    Y(i,y(i))=1;                            % 因此，需先對y進行處理，使之為5000*10的格式，這樣才能計算cost function
end

X = [ones(m,1) X];
a_layer2 = [ones(m,1) sigmoid(X*Theta1');];
a_layer3 = sigmoid(a_layer2*Theta2');

th1 = Theta1(:,2:end).^2;
th2 = Theta2(:,2:end).^2;

J = -1/m.*sum(sum(Y.*log(a_layer3)+(1-Y).*log(1-a_layer3)));
J = J + lambda/2/m.*(sum(sum(th1))+sum(sum(th2)));
% ======================================================================================================================================== %  
for i=1:m                                   % 一個迴圈讀入一筆資料
  a_dataLayer1 = X(i,:);
  z_dataLayer2 = a_dataLayer1*Theta1';
  a_dataLayer2 = sigmoid(z_dataLayer2);
  a_dataLayer2 = [1,a_dataLayer2];
  z_dataLayer3 = a_dataLayer2*Theta2';
  a_dataLayer3 = sigmoid(z_dataLayer3);
% ============================================================ %  
  d_dataLayer3 = a_dataLayer3 - Y(i,:);
% ============================================================ %
  d_dataLayer2 = d_dataLayer3*Theta2(:,2:end).*sigmoidGradient(z_dataLayer2);
% ============================================================ %
  Theta1_grad = Theta1_grad + (d_dataLayer2.*a_dataLayer1')';
  Theta2_grad = Theta2_grad + (d_dataLayer3.*a_dataLayer2')';
end
% ============================================================ %
Theta1_grad = Theta1_grad./m;
Theta2_grad = Theta2_grad./m;

Theta1_grad(:,2:end) = Theta1_grad(:,2:end) + lambda./m*(Theta1(:,2:end));
Theta2_grad(:,2:end) = Theta2_grad(:,2:end) + lambda./m*(Theta2(:,2:end));

%SIGMOIDGRADIENT
g = sigmoid(z).*(ones(size(z))-sigmoid(z))      % remember to add 'sigmoid'