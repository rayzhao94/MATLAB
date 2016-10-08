close all
clear
clc

load dataset3;

%%
%PCA

[coeff, score, latent] = pca(dataset3);
lost = zeros(10, 1);
for i = 1:10
    lost(i) = sum( latent(i+1:10))/sum(latent);
end
figure(1);
bar(1:10, latent);
xlabel('Component');
ylabel('Var');
text((1:10)', latent, num2str(latent, '%.2f'), 'HorizontalAlignment','center',... 
'VerticalAlignment','bottom')%, 'FontSize', 15);

figure(2);
bar(1:10, lost);
xlabel('Component Reserved');
ylabel('Loss');
text((1:10)', lost, num2str(lost, '%.2f'), 'HorizontalAlignment','center',... 
'VerticalAlignment','bottom')%, 'FontSize', 15);


%%
sumdist = zeros(6, 1);
for c = 1:6
    [~, ~, sumd] = kmeans(dataset3, c);
    sumdist(c) = sum(sumd);
end
%semilogy(1:8, sumdist);
plot(sumdist);
xlabel('类别数');
ylabel('聚类误差平方');


%%
%id = kmeans(dataset3, 2);
[~, score] = pca(dataset3);
score = score(:,1:2);
id = kmeans(score, 2);

figure;
ind = find(id == 1);
plot(score(ind, 1), score(ind, 2), 'ro');
hold on;
ind = find(id == 2);
plot(score(ind, 1), score(ind, 2), 'bo');
xlabel('First Component');
ylabel('Second Component');
title('Clustering Result With 2 Clusters');
%%
%test
%id = kmeans(dataset3, 2);
[~, score] = pca(dataset3);
score = score(:,1:2);
id = kmeans(score, 2);

figure;
ind = find(id == 1);
plot(score(ind, 1), score(ind, 2), 'ro');
hold on;
ind = find(id == 2);
plot(score(ind, 1), score(ind, 2), 'bo');
xlabel('First Component');
ylabel('Second Component');
title('Clustering Result With 2 Clusters');


%%
load dataset3.txt
[~, score] = pca(dataset3(:, 1:10));
score = score(:, 1:2);
id = dataset3(:, 11);

figure;
ind = find(id == 1);
plot(score(ind, 1), score(ind, 2), 'ro');
hold on;
ind = find(id == 0);
plot(score(ind, 1), score(ind, 2), 'bo');
xlabel('First Component');
ylabel('Second Component');
title('Real Distribution Based on Gender');

%%
load dataset3

d = pdist(dataset3, 'euclidean');
Z = linkage(d, 'complete');
dendrogram(Z, length(dataset3));



