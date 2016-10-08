function [ X_mean, cov_matrix ] = PD_function( train_set )
%input 是某一类的数据[X1,X2,X3]，输出是均值向量和协方差矩阵
[~, col] = size(train_set);
X_mean = mean(train_set);
for i = 1:col
    train_set(:, i) = (train_set(:, i) - X_mean(i));
end
cov_matrix = (train_set' * train_set)/length(train_set);
end

