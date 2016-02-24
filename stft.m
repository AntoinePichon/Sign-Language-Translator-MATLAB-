function [X,f,t] = stft(x,w,d,N_fft,Fs)
% This function computes the stft for m = [0, d, 2d, 3d...]
% This function outputs are : 
%-> X, which is a matrix of n_fft lines and M columns
%   M is the number of elements of m
%   X(i,j) is the value of the spectrogram for time t(i) and frequency f(j)
% -> f, is a column vector of the frequencies (in Hz)
% -> t, is a row vector containing the times of the beginning of the
% windows



L=length(x);
M=floor(L/d)+1;
N=length(w);
X=zeros(N,M);
w=w(:);

for j=0:M-1
    for i=1:N
        if j*d+i <= L
            X(i,j+1) = x(j*d+i);
        else X(i,j+1) = 0;
        end
    end
end
    
   
for j=0:M-1
    X(:,j+1) = (X(:,j+1).*w);
end


X=fft(X,N_fft);
mu=0:(1/N_fft):((N_fft-1)/N_fft);
f=mu*Fs;


t=((0:1:M-1)*d);

    end


    









