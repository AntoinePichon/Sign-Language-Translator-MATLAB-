clear all;
close all;
clc;

fs=44100; %frequence d'echantillonage (Hz)
nbit=16;   % nombre de bits par echantillon
mode=2   %pour dire stéreo
D=2,        % durée d'enregistrement (s)
enregistrement=audiorecorder(fs,nbit, mode);
recordblocking(enregistrement, D);
x=getaudiodata(enregistrement);

load('NB');
load('train_nb');

[matFtr]=train_classifier(NB,train_nb,fs);

[N]=real_time_classification(x,matFtr);


