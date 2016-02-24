function [P]=proba(train,test,K)
z=0;
for q=1:length(test)

[m,n]=size(train);
A=zeros(2,n);
for i = 1:n
    for j =2:m
    
    A(1,i) = A(1,i) + sqrt((train(j,i)-test(j,q))*(train(j,i)-test(j,q)));
    
    
    end
    
end 

A(2,:)=train(1,:);


[pasbesoin,idx] = sort(A(1,:));
 
B = A(:,idx);

D=B(2,(1:K));
c=0;
d=0;
for i = 0:30;
    k=sum(ismember(D,[i]));
    if (k>d)
        d=k;
        c=i;
    end
end

if (c==test(1,q))
    z=z+1;
end
end

P=z/length(test);
    
