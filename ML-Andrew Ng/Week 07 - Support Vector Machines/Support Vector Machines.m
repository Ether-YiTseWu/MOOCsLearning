% ================================
% GAUSSIANKERNEL
sim = exp(-((x1-x2)'*(x1-x2))/(2*sigma^2));

% DATASET3PARAMS
wrong = 100;
C_sample = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30, 100];

for i = 1:length(C_sample)
    
    for j = 1:length(C_sample)      % train and acquire the error
        model = svmTrain(X, y, C_sample(i), @(x1, x2) gaussianKernel(x1, x2, C_sample(j)));
        predictions = svmPredict(model, Xval);
        error = mean(double(predictions ~= yval));
        
        if (error < wrong)          % find the smallest error when using some C in C_sample
            wrong = error;
            C = C_sample(i);
            sigma = C_sample(j);
        end
        
    end
end

% PROCESSEMAIL
for index = 1:1899
        if strcmp(vocabList{index},str) == 1
          word_indices = [word_indices ; index];
        end
end

% EMAILFEATURES
for i = 1:length(word_indices)
    x(word_indices(i)) = 1;
end