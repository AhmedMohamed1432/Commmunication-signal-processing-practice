clc;
clear;
fs=1000;
t=(0:1/fs:10);
fm=2;
fc=5;

%Input signal
x = cos(2*pi*fm*t);
subplot(5,1,1)
plot(t,x);
%axis([0 1 -1 1])
title('input signal')
xlabel('time')
ylabel('amplitude')


%modulated signal
s2=x.*cos(2*pi*fc*t);
subplot(5,1,2)
plot(t,s2);
%axis([0 1 -1 1])
title('modulated signal (DSB-SC)')
xlabel('time')
ylabel('amplitude')


% Modulated signal added to Noise Signal
N = awgn(s2,70); %%Noise Signal
subplot(5,1,3);
plot(t,N);
title('Noise signal');
 
%Demodulated Signal With noise
s4 = amdemod(N,fc,fs);
subplot(5,1,4)
plot(t,s4);
%axis([0 1 -1 1])
title('Demodulated signal (DSB-SC)')
xlabel('time')
ylabel('amplitude')

