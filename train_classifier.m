function [matF] = train_classifier(data,train,F)
% This function return matF, a matrix containing features for every element
% of the train set.

Ltrain=size(train,2);
F=16000;
time_N=30;
time_d=15;
N=(F*time_N)/1000;
w=ones(1,N);
d=F*time_d/1000;
N_mfcc=12;
N_fft=1024;
matF=ones(N_mfcc,Ltrain);

for i=1:Ltrain
    matF(1,i)=train(1,i);
    A=data(train(2,i):train(3,i));
    B=mfccfeatures(A,w,d,N_fft,N_mfcc,F);
    matF(2:N_mfcc,i)=B(2:N_mfcc);
end

end

