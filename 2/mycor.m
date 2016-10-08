cor3 = zeros(1, 10);
pva3 = zeros(1, 10);
for i = 1:10
    [r, p] = corrcoef(dataset3(:, i), dataset3(:, 11));
    cor3(i) = r(1,2);
    pva3(i) = p(1,2);
end

cor4 = zeros(1, 10);
pva4 = zeros(1, 10);
for i = 1:10
    [r, p] = corrcoef(dataset4(:, i), dataset4(:, 11));
    cor4(i) = r(1,2);
    pva4(i) = p(1,2);
end