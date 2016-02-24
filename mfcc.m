function [mfcc2] = mfcc(x,w,d,N_fft,N_mfcc,Fs)
% This function returns the mfcc features




[ H, f] = compute_filter_bank( 20, N_fft, [300 3700], Fs);

[X,f,t] = stft(x,w,d,N_fft,Fs);
P=size(H,1);
n=size(X,2);
M=zeros(P,N_fft);
E=ones(P,n);

mfcc2=zeros(N_mfcc,n);

for i = 1:n
    for j = 1:P
        
    M(j,:)=transpose(X(:,i)).*H(j,:);
    
    E(j,i)=sum(M(j,:).*conj(M(j,:)));
    
    
    
   
    
   end 
end

for j = 1:n-1
for i = 1:N_mfcc

        
        mfcc2(i,j)=sqrt(2/P)*sum(log(E(:,j)).*cos(pi/P*i*(transpose(1:P)-0.5)));
        
        
end 
end
end
    
