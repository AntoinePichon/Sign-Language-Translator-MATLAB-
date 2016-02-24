function [mfccfeat] = mfccfeatures(x,w,d,N_fft,N_mfcc,Fs)



[mfcc2]=mfcc(x,w,d,N_fft,N_mfcc,Fs);

n=size(mfcc2,1);
mfccfeat=zeros(1,n);

for i = 1:n
    mfccfeat(1,i)=mean(mfcc2(i,:));
    
end
    