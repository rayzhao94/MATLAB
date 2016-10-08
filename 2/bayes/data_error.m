function [ error ] = data_error( data_set, m_mean, m_cov, f_mean, f_cov, lumuda )
%输入是待测试数据，均值向量，协方差矩阵,似然比
[num, d] = size(data_set);
[V,D] = eig(m_cov);
detm = prod(D(D>0.01));
D(D>0.01) = 1./(D(D>0.01));
invm = V*D*V';

[V,D] = eig(f_cov);
detf = prod(D(D>0.01));
D(D>0.01) = 1./(D(D>0.01));
invf = V*D*V';

error = 0;
for i = 1:num
    P_m = ((2*pi)^(-0.5*(d-1)) / sqrt(detm)) * exp(-0.5 * (data_set(i, 1:(d-1)) - m_mean) * invm * (data_set(i, 1:(d-1)) - m_mean)');
    P_f = ((2*pi)^(-0.5*(d-1)) / sqrt(detf)) * exp(-0.5 * (data_set(i, 1:(d-1)) - f_mean) * invf * (data_set(i, 1:(d-1)) - f_mean)');
    if (P_m / P_f) > lumuda
      class = 1;
    else
      class = 0;
    end
    if class ~= data_set(i, d)
        error = error+1;
    end
end
error = error / num;
end

