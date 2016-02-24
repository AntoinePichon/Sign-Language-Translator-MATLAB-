function [gam_x, p] = autocorr(x,maxP)
%This function computes the autocorrelation estimator of equation (3)
%for lags p = [-maxP+1, ..., 0, 1, ..., maxP-1]
%
% This function returns : 
% -> gam_x, which is a vector of length 2*maxP+1 elements
%  containing the autocorrelation values
% -> p is a vector containing the different lags at which
%  the autocorrelation is computed

y=xcorr(x,'unbiased');
gam_x=y(length(x)-maxP+1:length(x)+maxP-1);
p=(-maxP+1:maxP-1);
end
