function feature = R_SVM(data_train, feature, maintain)
male = data_train(data_train(:, 11) == 1, 1:10);
female = data_train(data_train(:, 11) == 0, 1:10);

male_mean = mean(male);
female_mean = mean(female);
mjj = male_mean - female_mean; %1*10
for i = 2:length(maintain)
    model = svmtrain(data_train(:, 11), data_train(:,feature));
    w = bsxfun(@times, model.sv_coef, full(model.SVs));
    w = sum(w); %1*10
    [~, max_contribute] = sort(abs(w .* mjj(feature)), 'descend');
    feature = feature(max_contribute(1:maintain(i)));
end

end