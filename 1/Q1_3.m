stdpoint = 5;
sizeof_male = size(male,2);
sizeof_female = size(female,2);
male_avr = mean(male');
female_avr = mean(female');   
cov_male = cov(male');
cov_female = cov(female');
mark = [];
ROC = [];
for stdpoint = 0.1:0.1:10
    True_male = 0;
    True_female = 0;
    False_male = 0;
    False_female = 0;
    k = (sizeof_female/(sizeof_male+sizeof_female))/(sizeof_male/(sizeof_male+sizeof_female))/stdpoint;
for i = 1:1:size(dataset,2)
    x = dataset(:,i);
    pmale_jug = 1/(2*pi*det(cov_male)^0.5)*exp(-0.5*(x - male_avr')'*cov_male^(-1)*(x-male_avr')); %ÕýÌ¬·Ö²¼
    pfm_jug = 1/(2*pi*det(cov_female)^0.5)*exp(-0.5*(x - female_avr')'*cov_female^(-1)*(x-female_avr'));
    if((pmale_jug/pfm_jug) > k)
        tmark = 1;
    else
        tmark = 0;
    end
    if(i > 78)
        if(tmark == 1)
            True_male = True_male+1;
        else
            False_female = False_female+1;
        end
    else
        if(tmark == 0)
            True_female = True_female+1;
        else
            False_male = False_male+1;
        end
    end
    mark = [mark,tmark];
end
    sensitivity = True_female/(True_female+False_male);
    specificity = True_male/(True_male+False_female);
    ROC = [ROC,[sensitivity;1-specificity]];
end
plot(ROC(2,:),ROC(1,:),'b-')