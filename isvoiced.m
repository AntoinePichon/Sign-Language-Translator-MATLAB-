function [voicedFlag, pitch] = isvoiced(x,Fs)
%This function the voiced/unvoiced flag and the pitch
%This function returns : 
% -> voicedFlag = 1 if x is voiced
%    voicedFlag = 0 if x is unvoiced
%
% -> pitch contains the pitch in Hz

n=length(x);
[gam_x, p]=autocorr(x,n);
[gam_P,P]=max(gam_x(n+floor(Fs/500):n+floor(Fs/50)));
gamzero=gam_x(n);
if ((gam_P/gamzero)>=0.6)
    voicedFlag=1;
    pitch=Fs/P;
else
    voicedFlag=0;
pitch=0;
end

end
