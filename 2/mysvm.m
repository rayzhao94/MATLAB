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
train_sample = train_set(:, 1:(s(2)-1));
train_label = train_set(:, s(2));
test_sample = test_set(:, 1:(s(2)-1));
test_label = test_set(:, s(2));

train_label(train_label == 0) = -1;
test_label(test_label==0) = -1;

bestn = 0;
bestmse = 987654321;
for i = -10:6
    cmd = ['-t 0 -v 5 -s 0 -c ', num2str((2^i)), ' -q'];
    mse = svmtrain(train_label, train_sample, cmd);
    if(mse <= bestmse)
        bestmse = mse;
        bestn = i;
    end
end

cmd = ['-t 0 -s 0 -c ', num2str((2^bestn)), ' -q'];
sv = svmtrain(train_label, train_sample, cmd);
rate_train = svmpredict(train_label, train_sample, sv);
rate_train = length(find(rate_train ~= train_label))/length(rate_train);
rate_test = svmpredict(test_label, test_sample, sv);
rate_test = length(find(rate_test ~= test_label))/length(rate_test);








