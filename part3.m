clear all; % Resets matlab workspace
close all; % Close every open figure
clc; % clear the command window


%% Start of your processing
% Read the samples from HelloWorld.wav

[x,Fs]=wavread('HelloWorld.wav');

Ts=1/Fs;

t=0:Ts:(length(x)-1)*Ts;
figure (1);
plot(t,x);
title('\fontsize{16}\bf Figure 1 : Signal x(t)')
xlabel('t')
ylabel('x(t)')

%% Question 1 :

t1=0.01:Ts:0.04;

x1=[x(find(t==0.01):find(t==0.04))];

figure (2);
plot(t1,x1);
title('\fontsize{16}\bfFigure 2 : Signal x1(t)')
xlabel('t')
ylabel('x1(t)')

%This part of x(t) is unvoiced(no-periodic)

%% Question 2

t2=0.2:Ts:0.23;

x2=[x(find(t==0.20):find(t==0.23))];

figure (3);
plot(t2,x2);
title('\fontsize{16}\bf Figure 3 : Signal x2(t)')
xlabel('t')
ylabel('x2(t)')

%This part of x(t) is voiced(periodic)

%% Question 3

th=0:Ts:0.4;

xh=[x(find(t==0):find(t==0.4))];

figure (4);
plot(th,xh);
title('\fontsize{16}\bfFigure 4 : signal xH(t)')
xlabel('t')
ylabel('xH(t)')

%% Question 4

f=1:length(x1);
f=f/length(x1)-1/2;
f=f*Fs;

figure (5);
semilogy(f,fftshift(abs(fft(x1))))
title('\fontsize{16}\bfFigure 5 : Magnitude Spectrum of x1(t)')
xlabel('f')
ylabel('Magnitude Spectrum of x1(t)')

figure (6);
semilogy(f,fftshift(abs(fft(x2))))
title('\fontsize{16}\bfFigure 6 : Magnitude Spectrum of x2(t)')
xlabel('f')
ylabel('Magnitude Spectrum of x2(t)')


%Magnitude of x1 is significantly lower than the magnitude of x2
%La plage de fréquence représentative est plus large pour x1 que pour x2

%% Question 5 :

% Voir stft.m

%% Question 6 :

% Voir spectro.m

%% Question 7 :

% Spectro 1 :

d=441;
N_fft=1024;
N=441;
w=transpose(hamming(N));

[Sx1, f, t] = spectro(x,transpose(hamming(441)),d,N_fft,Fs);
figure (7);
imagesc(t,f,10*log10(Sx1));
title('\fontsize{16}\bfFigure 7 : Spectrogram 1')
xlabel('t')
ylabel('f')
ylim([0 20000]);
% Spectro 2 :

d=441;
N_fft=1024;
N=441;
w=ones(1,N);

[Sx2, f, t] = spectro(x,ones(1,441),d,N_fft,Fs);
figure (8);
imagesc(t,f,10*log10(Sx2));
title('\fontsize{16}\bfFigure 8 : Spectrogram 2')
xlabel('t')
ylabel('f')
ylim([0 20000]);

% Spectro 3 :

d=441;
N_fft=1024;
N=882;
w=transpose(hamming(N));


[Sx3, f, t] = spectro(x,transpose(hamming(882)),d,N_fft,Fs);
figure (9);
imagesc(t,f,10*log10(Sx3));
title('\fontsize{16}\bfFigure 9 : Spectrogram 3')
xlabel('t')
ylabel('f')
ylim([0 20000]);









