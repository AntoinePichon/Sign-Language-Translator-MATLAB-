function [Cm]= confusion(train,test,K)
Cm=zeros(31,31);

for t = 0 :30
    
  for u = 1:length(test)
      
      if (test(1,u)==t)
          
          [m,n]=size(train);
A=zeros(2,n);
for i = 1:n
    for j =2:m
    
    A(1,i) = A(1,i) + sqrt((train(j,i)-test(j,u))*(train(j,i)-test(j,u)));
    
    
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

Cm(t+1,c+1)=Cm(t+1,c+1)+1;
      end
  end
end
for i = 1:31
    Cm(i,:)=Cm(i,:)/sum(Cm(i,:));
end
end
    
    