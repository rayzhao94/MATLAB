function [ xishu,r_error ] = risk_error( data_set, m_mean, m_cov, f_mean, f_cov, lumuda )
%最小风险决策与总错误率的关系
[num, d] = size(data_set);
xishu = zeros(1, 17);
xishu(1,1) = 2^-6;
r_error = zeros(2, 17);
for k = 1:17
TP = 0;
TN = 0;
FP = 0;
FN = 0;

for i = 1:num
    P_m = (2*pi)^(-0.5*d) * sqrt(det(m_cov)) * exp(-0.5 * (data_set(i, 1:2) - m_mean) * m_cov^(-1) * (data_set(i, 1:2) - m_mean)');
    P_f = (2*pi)^(-0.5*d) * sqrt(det(f_cov)) * exp(-0.5 * (data_set(i, 1:2) - f_mean) * f_cov^(-1) * (data_set(i, 1:2) - f_mean)');
    
    if (P_m / P_f) > lumuda * xishu(k)
      if data_set(i, 3) == 1
         TP = TP +1;
      else
         FP = FP +1;
      end
    else
      if data_set(i, 3) == 0
         TN = TN +1;
      else
         FN = FN +1;
      end
    end
end
r_error(2,k) = (FN)/(TP+FN);
r_error(1, k) = FP/(FP+TN);
if k ~= 17
xishu(k+1) = xishu(k) * 2;
end
end

figure
semilogx(xishu,r_error(1,:),'b-*');
hold on;
semilogx(xishu,r_error(2,:),'r-*');
%axis([0 18 0.5 0.6]);
title('min-risk Bayes decision\prime s influence on FPR & FNR');
xlabel('Decision index');
ylabel('FNR & FPR');


end

