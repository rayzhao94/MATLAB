clear;
clc;
data_test = xlsread('test.xlsx'); %female = 0, male = 1; 
data_train = xlsread('train.xlsx'); %female = 0, male = 1; 

feature = 1:10;
%feature = [3 5];
model = svmtrain(data_train(:, 11), data_train(:,feature));
[~, accuracy10, ~] = svmpredict(data_test(:, 11), data_test(:,feature), model);

feature1 = 1:10;
maintain = 10:-1:3;
feature1 = R_SVM(data_train, feature1, maintain);
model = svmtrain(data_train(:, 11), data_train(:,feature1), '-t 0');
[~, acc_train3, ~] = svmpredict(data_train(:, 11), data_train(:,feature1), model);
[~, accuracy3, ~] = svmpredict(data_test(:, 11), data_test(:,feature1), model);

feature2 = 1:10;
maintain = [10, 5, 2];
feature2 = R_SVM(data_train, feature2, maintain);
model = svmtrain(data_train(:, 11), data_train(:,feature2), '-t 0');
[~, accu_train2, ~] = svmpredict(data_train(:, 11), data_train(:,feature2), model);
[~, accuracy2, ~] = svmpredict(data_test(:, 11), data_test(:,feature2), model);
% 
% %pca ±¾Õ÷ÌáÈ¡
% %ÑµÁ·
feature_num = 2;
[coeff, Z_train, latent] = pca(data_train(:, 1:10), 'NumComponents', feature_num);
Z_test = bsxfun(@minus, (data_test(:, 1:10)), mean(data_train(:,1:10)))*coeff;
model = svmtrain(data_train(:, 11), Z_train, '-t 0');
[~, acc_train_pca, ~] = svmpredict(data_train(:, 11), Z_train, model);
[~, accuracy_pca, ~] = svmpredict(data_test(:, 11), Z_test, model);



