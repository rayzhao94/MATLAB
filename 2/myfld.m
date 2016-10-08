if is_all_data == 1
    train_set = dataset3;
else
    m = dataset3(dataset3(:,11)==1, :);
    f = dataset3(dataset3(:,11)==0, :);
    ind = crossvalind('Kfold', length(m));
    train_set = m(ind(1:10), :);
    ind = crossvalind('Kfold', length(f));
    train_set = [train_set; f(ind(1:10), :)];
end
if is_10_d == 0
    ind = [1 2 3 4 5 11];
    train_set = train_set(:, ind);
    test_set = dataset4(:, ind);
else
    test_set = dataset4;
end
s = size(train_set);

rate_train = FLD(train_set, train_set);
rate_test = FLD(train_set, test_set);











