sizeof_male = size(male,2);
sizeof_female = size(female,2);
male_avr = mean(male');
female_avr = mean(female');
cov_male = cov(male');
cov_female = cov(female');
mark = [];
for i = 1:1:size(ourdata,2)
    x = ourdata(:,i);
    pmale_jug = 1/(2*pi*det(cov_male)^0.5)*exp(-0.5*(x - male_avr')'*cov_male^(-1)*(x-male_avr')); %正态分布
    pfm_jug = 1/(2*pi*det(cov_female)^0.5)*exp(-0.5*(x - female_avr')'*cov_female^(-1)*(x-female_avr'));
    post_pmale_jug = pmale_jug*sizeof_male / (sizeof_female + sizeof_male)/(pmale_jug*sizeof_male / (sizeof_female + sizeof_male)  +pfm_jug*sizeof_female / (sizeof_female + sizeof_male));  %后验 
    post_pfm_jug = pfm_jug*sizeof_female / (sizeof_female + sizeof_male)/(pmale_jug*sizeof_male / (sizeof_female + sizeof_male)+pfm_jug*sizeof_female / (sizeof_female + sizeof_male));
    if(post_pmale_jug > post_pfm_jug)%判断
        jugg = 1;
    else
        jugg = 0;
    end
    mark = [mark,jugg];
end

err_num = 0;%错误数量
for j = 1 : size(ourdata,2)
    flag = mark(j);
    if(j < 64)
        if(mark(j) == 0)
            err_num = err_num + 1;
        end;
    else
        if(mark(j) == 1)
            err_num = err_num + 1;
        end;
    end;
end;
p_err = err_num / size(ourdata,2)%错误率

        