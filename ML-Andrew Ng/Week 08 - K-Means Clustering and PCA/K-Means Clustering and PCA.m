% ============================================
% FINDCLOSESTCENTROIDS
for i = 1:length(idx)
    min = 1000;
    index = 0;
    for j = 1:K
        distance = sum((centroids(j,:) - X(i,:)).^2);
        if distance < min
            min = distance;
            index = j;
        end
    end
    idx(i) = index;
end

% COMPUTECENTROIDS
for i = 1:K
    tmp = X(idx == i,:);
    centroids(i,:) = mean(tmp);
end

% PCA
sigma = (X'*X)/m;
[U S V] = svd(sigma);