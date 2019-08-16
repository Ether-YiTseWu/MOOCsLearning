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
% X ���C�V�q��:��Ƶ���(ex:�q�v)�B��V�q��:��ƪ��ݩʼơA�S�x��(ex:�ʧ@�B�R����)
% R ���C�V�q��:��Ƶ���(ex:�q�v)�B��V�q��:���X�ӫȤ�b�Өt�Ϊ��då��
% Theta �O�C�ӫȤ�M�ݪ��ѼơA�Ѧ��Ѽƥi�H���X�ӥΤ��Y���(ex:�q�v)������
% Y �O�Τ��Y��ƪ�����(ex:star��)
for i = 1:size(X,1)                                      % i��ܹM���U�����(ex:�q�v)���ݩ�(ex:�ʧ@�B�R����)
    for j = 1:size(Theta,1)                              % 
        if R(i,j) == 1                                   % == 1 ����m�O���Q�Τ�������q�v
            J = J + 1/2*(X(i,:)*Theta(j,:)'-Y(i,j))^2 ;  % X*Theta�|�]�X�ӵ���ƪ��w������(ex:star��)
        end
    end
end

for i = 1:size(X,1)                                      % i��ܹM���U�����(ex:�q�v)���ݩ�(ex:�ʧ@�B�R����)
    index = find(R(i, :)==1);                            % ��X��i��ƨӻ��A���ֹ惡��Ʀ�����
    X_grad(i,:) = (X(i,:)*Theta(index, :)' - Y(i, index))*Theta(index, :);
    X_grad(i,:) =  X_grad(i,:)+lambda*X(i,:);
end

for j = 1:size(Theta,1)
    index = find(R(:, j)==1);
    Theta_grad(j,:) = X(index,:)'*(X(index,:)* Theta(j,:)' - Y(index, j));
    Theta_grad(j,:)=Theta_grad(j,:)+lambda*Theta(j,:);
end