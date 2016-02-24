%% Feature extraction

close all;
clear all;
clc;


load('one1.mat');
load('one2.mat');
load('two1.mat');
load('two2.mat');


[voicedFlagone1, pitchone1]=isvoiced(one1,Fs);


[voicedFlagone2, pitchone2]=isvoiced(one2,Fs);

[voicedFlagtwo1, pitchtwo1]=isvoiced(two1,Fs);


[voicedFlagtwo2, pitchtwo2]=isvoiced(two2,Fs);


d = 15*10^(-3)*Fs;
N=30*10^(-3)*Fs;
w=ones(1,N);
N_fft=1024;
N_mfcc=20;
[mfccfeat1] = mfccfeatures(one1,w,d,N_fft,N_mfcc,Fs);

[mfccfeat2] = mfccfeatures(one2,w,d,N_fft,N_mfcc,Fs);

[mfccfeat3] = mfccfeatures(two1,w,d,N_fft,N_mfcc,Fs);
[mfccfeat4] = mfccfeatures(two2,w,d,N_fft,N_mfcc,Fs);

%mel1=2595*log((mfccfeat1/700)+1);
%mel2=2595*log((mfccfeat2/700)+1);
%mel3=2595*log((mfccfeat3/700)+1);
%mel4=2595*log((mfccfeat4/700)+1);


plot(mfccfeat1,'r');
hold on
plot(mfccfeat2,'g');
hold on
plot(mfccfeat3,'m');
hold on
plot(mfccfeat4,'b');
title('\fontsize{16}\bfFigure 10 : MFCC Coefficients');
xlabel('number of MFCC Coefficients');
ylabel('Value of MFCC Cofficients');
legend( 'one1', 'one2' , 'two1' , 'two2');









