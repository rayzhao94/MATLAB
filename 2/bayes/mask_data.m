function [ male, female, lumuda] = mask_data( data_collect )
%����������ݷ������Ů��1�����У�0����Ů
%�������Ů���ݣ���Ȼ�� f/m
s = size(data_collect);

m_index = find(data_collect(:, s(2)) == 1);
f_index = find(data_collect(:, s(2)) == 0);
[m_num, ~] = size(m_index);
[f_num, ~] = size(f_index);
lumuda = f_num / m_num;
male = data_collect(m_index, 1:(s(2)-1) );
female = data_collect(f_index, 1:(s(2)-1) );

end

