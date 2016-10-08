close all;
clear;
clc;
addpath('./svm');
addpath('./bayes');
load dataset3.txt;
load dataset4.txt;

err_net_10 = [];
err_net_3 = [];
err_bayes = [];
err_svm = [];
err_fld = [];
times = 1000;

%%
% temp_rate1 = [];
% temp_rate2 = [];
% temp_rate3 = [];
% temp_rate4 = [];
% temp_rate5 = [];
% is_all_data = 0;
% is_10_d = 1;
% for i = 1:times
%     layer = 1;
%     mynnet;
%     temp_rate1 = [temp_rate1; rate_train rate_test];
%     layer  = 3;
%     mynnet;
%     temp_rate2 = [temp_rate2; rate_train rate_test];
%     bayes;
%     temp_rate3 = [temp_rate3; rate_train rate_test];
%     mysvm;
%     temp_rate4 = [temp_rate4; rate_train, rate_test];
%     myfld;
%     temp_rate5 = [temp_rate5; rate_train, rate_test];
% end
% err_net_10 = mean(temp_rate1);
% err_net_3 = mean(temp_rate2);
% err_bayes = mean(temp_rate3);
% err_svm = mean(temp_rate4);
% err_fld = mean(temp_rate5);
% save error err_net_10 err_net_3 err_bayes err_svm err_fld temp_rate1 temp_rate2 temp_rate3 temp_rate4 temp_rate5

%%
temp_rate11 = [];
temp_rate22 = [];
temp_rate33 = [];
temp_rate44 = [];
temp_rate55 = [];
is_all_data = 0;
is_10_d = 0;
for i = 1:times
    layer = 1;
    mynnet;
    temp_rate11 = [temp_rate11; rate_train rate_test];
    layer  = 3;
    mynnet;
    temp_rate22 = [temp_rate22; rate_train rate_test];
    bayes;
    temp_rate33 = [temp_rate33; rate_train rate_test];
    mysvm;
    temp_rate44 = [temp_rate44; rate_train, rate_test];
    myfld;
    temp_rate55 = [temp_rate55; rate_train, rate_test];
end
err_net_10 = [err_net_10; mean(temp_rate11)];
err_net_3 = [err_net_3; mean(temp_rate22)];
err_bayes = [err_bayes; mean(temp_rate33)];
err_svm = [err_svm; mean(temp_rate44)];
err_fld = [err_fld; mean(temp_rate55)];
%save error1 err_net_10 err_net_3 err_bayes err_svm err_fld temp_rate1 temp_rate2 temp_rate3 temp_rate4 temp_rate5 temp_rate11 temp_rate22 temp_rate33 temp_rate44 temp_rate55

%%
% is_all_data = 1;
% is_10d = 1;
% layer = 1;
% mynnet;
% err_net_10 = [err_net_10; rate_train, rate_test];
% layer = 3;
% mynnet;
% err_net_3 = [err_net_3; rate_train, rate_test];
% bayes;
% err_bayes = [err_bayes; rate_train, rate_test];
% mysvm;
% err_svm = [err_svm; rate_train, rate_test];
% myfld;
% err_fld = [err_fld; rate_train, rate_test];
% save error err_net_10 err_net_3 err_bayes err_svm err_fld temp_rate1 temp_rate2 temp_rate3 temp_rate4 temp_rate5 temp_rate11 temp_rate22 temp_rate33 temp_rate44 temp_rate55

%%
is_all_data = 1;
is_10_d = 0;
layer = 1;
mynnet;
err_net_10 = [err_net_10; rate_train, rate_test];
layer = 3;
mynnet;
err_net_3 = [err_net_3; rate_train, rate_test];
bayes;
err_bayes = [err_bayes; rate_train, rate_test];
mysvm;
err_svm = [err_svm; rate_train, rate_test];
myfld;
err_fld = [err_fld; rate_train, rate_test];
%save error1 err_net_10 err_net_3 err_bayes err_svm err_fld temp_rate1 temp_rate2 temp_rate3 temp_rate4 temp_rate5 temp_rate11 temp_rate22 temp_rate33 temp_rate44 temp_rate55

