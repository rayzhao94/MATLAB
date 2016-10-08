function [ err ] = FLD( data_train, data_test )
%Fisher 线性判别函数
%分出男女
s = size(data_train);
dimension = s(2)-1;
male_train = data_train(data_train(:,dimension+1) == 1, 1:dimension);
female_train = data_train(data_train(:,dimension+1) == 0, 1:dimension);
mean_m = mean(male_train);
mean_f = mean(female_train);
%计算Sf,Sm
male_train = bsxfun(@minus, male_train, mean_m);
Sm = male_train' * male_train;

female_train = bsxfun(@minus, female_train, mean_f);
Sf = female_train' * female_train;

Sw = Sm +Sf;
[V,D] = eig(Sw);
D(D>0.01) = 1./(D(D>0.01));
invSw = V*D*V';

w = invSw * (mean_m - mean_f)';
w0 = -0.5 * (mean_m + mean_f) * invSw * (mean_m - mean_f)';

accuracy = 0;
for i = 1:length(data_test)
    temp = w' * data_test(i, 1:dimension)' + w0;
    if (temp > 0 && data_test(i, s(2)) == 1) || (temp < 0 && data_test(i, dimension+1) == 0);
        accuracy = accuracy+1;
    end
end

accuracy = accuracy / length(data_test);
err = 1-accuracy;
end

