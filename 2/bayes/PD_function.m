function [ X_mean, cov_matrix ] = PD_function( train_set )
%input ��ĳһ�������[X1,X2,X3]������Ǿ�ֵ������Э�������
[~, col] = size(train_set);
X_mean = mean(train_set);
for i = 1:col
    train_set(:, i) = (train_set(:, i) - X_mean(i));
end
cov_matrix = (train_set' * train_set)/length(train_set);
end

