function [N]=real_time_classification(data,matFtr)

N=0;




data2=transpose(data(:,1));
C=[];
i=0;
for i=20000:80000
    if data2(1,i)>0.002
        C=[C i];
    end
end

test=[N;C(1);C(length(C))];
[matFte]=train_classifier(data2,test);

[m,n]=size(matFtr);

F=zeros(2,n);
for i = 1:n
    for j =2:m
    
    F(1,i) = F(1,i) + sqrt((matFtr(j,i)-matFte(j,1))*(matFtr(j,i)-matFte(j,1)));
    
    
    end
    
end 

F(2,:)=matFtr(1,:);


[pasbesoin,idx] = sort(F(1,:));
 
G = F(:,idx);

H=G(2,(1:10));
d=0;
for i = 0:20;
    k=sum(ismember(H,[i]));
    if (k>d)
        d=k;
        N=i;
    end
    
end
image = imread([num2str(N),'.jpg']);

figure; imshow(image);
end





