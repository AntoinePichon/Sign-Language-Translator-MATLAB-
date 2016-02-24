%Classification
close all;
clear all;
clc;


load('data_1.mat');
load('data_2.mat');
load('train_1.mat');
load('train_2.mat');
load('test_1.mat');
load('test_2.mat');


[matFtr1]=train_classifier(data_1,train_1);
[matFtr2]=train_classifier(data_2,train_2);
[matFte1]=train_classifier(data_1,test_1);
[matFte2]=train_classifier(data_2,test_2);

[P1]=proba(matFtr1,matFte1,10);

[P2]=proba(matFtr2,matFte2,10);

[Cm1]= confusion(matFtr1,matFte1,10);

[Cm2]= confusion(matFtr2,matFte2,10);

figure(1);
imagesc(Cm1);
title('\fontsize{16}\bfFigure 11 : confusion matrix test_1')
xlabel('find class')
ylabel('real class')

figure(2);
imagesc(Cm2);
title('\fontsize{16}\bfFigure 12 : confusion matrix test_2')
xlabel('find class')
ylabel('real class')


P_1=1/30*trace(Cm1);

P_2=1/30*trace(Cm2);








    
    