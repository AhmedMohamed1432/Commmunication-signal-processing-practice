clc;
clear;
%%
%%PARMETERS IDENTIFICATION
fm = 2;
fc = 5;
fs = 1000;
kf= pi;
t = (0:1/fs:5)';

%%MESSAGE SIGNAL
m=  cos(2*pi*fm*t);
subplot(3,1,1);
plot(t,m);
title('message signal');

%%
%%FM MODULATION
FeqDev=0.5; %%Frequency Deviation
s = fmmod(m,fc,fs,FeqDev);
subplot(3,1,2);
plot(t,s);
title('modulated signal');

%%
%%FM DEMODULATION
z = fmdemod(s,fc,fs,kf);
subplot(3,1,3);
plot(t,z);
title('demodulated signal');