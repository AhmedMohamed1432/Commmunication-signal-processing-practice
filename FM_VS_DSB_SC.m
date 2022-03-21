
clc;
clear;
fs=1000;
t=(0:1/fs:10)';
fm=12;
fc=20;
kf=pi;
SNR=60;                                 % Signal to noise power ratio
%--------------------INPUT(single tone)-----------------
%Input signal
modulationg_signal = cos(2*pi*fm*t);
subplot(6,1,1)
plot(t,modulationg_signal);
axis([0 1 -1 1])
title('input signal')
xlabel('time')
ylabel('amplitude')

%--------------------Modulation-----------------
%DSB-SC modulated signal
DSB_modulated_signal=modulationg_signal.*cos(2*pi*fc*t);


%FM-moulation
FM_modulated_signal =cos((2*pi*fc*t)+(kf/fm)*modulationg_signal);



% DSB-SC Modulated signal added to Noise Signal
DSB_with_noise = awgn(DSB_modulated_signal,SNR); %%Noise Signal
subplot(6,1,2);
plot(t,DSB_with_noise);
axis([0 1 -1 1])
title('DSB-SC moulated signal with noise');
xlabel('time')
ylabel('amplitude')

% FM Modulated signal added to Noise Signal
FM_with_noise = awgn(FM_modulated_signal,SNR); %%Noise Signal
subplot(6,1,3);
plot(t,FM_with_noise);
axis([0 1 -1 1])
title('FM moulated signal with noise');
xlabel('time')
ylabel('amplitude')
 
%--------------------Demodulation-----------------

%DSB-Demodulated Signal With noise
DSB_demodulated_signal =2*DSB_with_noise.*cos(2*pi*fc*t);
[a b]=butter(2,0.03);
DSB_demodulated_signal=filter(a,b,DSB_demodulated_signal);
subplot(6,1,4)
plot(t,DSB_demodulated_signal);
axis([0 1 -1 1])
title('Demodulated signal (DSB-SC)')
xlabel('time')
ylabel('amplitude')

%FM-Demodulated Signal With noise
FM_demodulated_signal =  fmdemod(FM_with_noise,fc,fs,kf);
subplot(6,1,5)
plot(t,FM_demodulated_signal);
axis([0 1 -1 1])
title('Demodulated signal (FM)')
xlabel('time')
ylabel('amplitude')

%--------------------FM-Demodulation with bandpass filter-----------------

FM_demodulated_signal_with_filter =  filter(a,b,FM_demodulated_signal);
subplot(6,1,6)
plot(t,FM_demodulated_signal_with_filter);
axis([0 1 -1 1])
title('Demodulated signal (FM) after using band pass filter')
xlabel('time')
ylabel('amplitude')
%step(s1,FM_demodulated_signal_with_filter);


