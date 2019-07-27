% ======================================================================================================================================== %  
%NNCOSTFUNCTION
Y = zeros(m,max(y));                        % ���D��5000����ơA��J�h400�A���üh25�C���ƹ�������X��Y(5000*1)�A��5000����ƿ�J��A�C����Ʃұo�쪺���ҭ�
for i=1:m                                   % ���b�i�毫�g�������p��ɡA��X�O5000*10���A��y�O��5000*10��X�x�}���A�C�@����̤j�ȱo���Ӭ��w������
    Y(i,y(i))=1;                            % �]���A�ݥ���y�i��B�z�A�Ϥ���5000*10���榡�A�o�ˤ~��p��cost function
end

X = [ones(m,1) X];
a_layer2 = [ones(m,1) sigmoid(X*Theta1');];
a_layer3 = sigmoid(a_layer2*Theta2');

th1 = Theta1(:,2:end).^2;
th2 = Theta2(:,2:end).^2;

J = -1/m.*sum(sum(Y.*log(a_layer3)+(1-Y).*log(1-a_layer3)));
J = J + lambda/2/m.*(sum(sum(th1))+sum(sum(th2)));
% ======================================================================================================================================== %  
for i=1:m                                   % �@�Ӱj��Ū�J�@�����
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