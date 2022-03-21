clc;
clear;
fm = 2;
fc = 5;
fs = 1000;
t = (0:1/fs:10);
m=  cos(2*pi*fm*t); %%message signal
kf= pi;
subplot(4,1,1);
plot(t,m);
title('message signal');
%%s = fmmod(m,fc,fs,kf);
s=cos((2*pi*fc*t)+(kf/fm)*sin(2*pi*fm*t)); %%Modulated signal
subplot(4,1,2);
plot(t,s);
title('modulated signal');
N= awgn(s,100); %%Adding white Gaussian noise to the signal
subplot(4,1,3);
plot(t,N);
title('Noise signal');
z = fmdemod(N,fc,fs,kf); %% demodulated signal
subplot(4,1,4);
plot(t,z);
title('demodulated signal');