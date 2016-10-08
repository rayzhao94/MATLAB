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
if layer == 3
    hidden = [3 4 3];
else
    hidden = 10;
end

net = feedforwardnet(hidden);
% ind1 = crossvalind('Kfold', length(train_sample));
% train_sample = train_sample(ind1, :);
% train_label = train_label(ind1,:);
net = train(net, train_sample', train_label');
test_pre = net(test_sample');
test_pre(test_pre>0.5) = 1;
test_pre(test_pre<0.5) = 0;
test_err = test_pre'-test_label;
rate_test = length(find(test_err ~= 0))/length(test_err);

train_pre = net(train_sample');
train_pre(train_pre>0.5) = 1;
train_pre(train_pre<0.5) = 0;
train_err = train_pre' - train_label;
rate_train = length(find(train_err ~= 0))/length(train_err);
%err = length(err'~=0)/length(err');



