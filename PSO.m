function[xm,fv,Pbest] = PSO(fitness,N,c1,c2,w,M,D)
% c1,c2��ѧϰ����
% w������Ȩ��
% M������������
% D�������ռ�ά��
% N����ʼ��Ⱥ�������Ŀ


%% ��ʼ����Ⱥ�ĸ��壨�����������޶�λ�ú��ٶȵķ�Χ��
format long;
for i = 1:N
    for j=1:D
        x(i,j) = randn; % �����ʼ��λ��
        v(i,j) = randn; % �漴��ʼ���ٶ�
    end
end


%% �ȼ���������ӵ���Ӧ�ȣ�����ʼ��pi��pg
for i=1:N
    p(i) = fitness(x(i,:));
    y(i,:) = x(i,:);
end
pg = x(N,:);  % pgΪȫ������
for i=1:(N-1)
    if(fitness(x(i,:))<fitness(pg))
        pg = x(i,:);
    end
end


%% ������Ҫѭ�������չ�ʽ���ε�����ֱ�����㾫��Ҫ��
for t=1:M
    for i=1:N  % �����ٶȡ�λ��
        v(i,:)=w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:));
        x(i,:)=x(i,:)+v(i,:);
        if fitness(x(i,:)) < p(i)
            p(i)=fitness(x(i,:));
            y(i,:)=x(i,:);
        end
        if p(i) < fitness(pg)
            pg=y(i,:);
        end
    end
    Pbest(t)=fitness(pg);
end

%% ������
xm=pg';
fv=fitness(pg);