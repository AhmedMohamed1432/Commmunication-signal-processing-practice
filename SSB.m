clear;
clc;
[m_t, Fs] = audioread('main_audio.wav');  
frequency_carrier = 100*10^3;
frequency_modulation = Fs;
bandwidth = (frequency_carrier+2*frequency_modulation);
fs = 2*(bandwidth);
ampltiude_carrier = 1;
t = (0:length(m_t)-1)';
modulated_LSB=ssbmod(m_t,frequency_carrier,fs);
modulated_USB=ssbmod(m_t,frequency_carrier,fs,0,'upper');
demodulated_LSB = ssbdemod (modulated_LSB,frequency_carrier,fs);
demodulated_USB = ssbdemod (modulated_USB,frequency_carrier,fs);
demodulated_signal = 0.5 * (demodulated_USB + demodulated_LSB);
signal_noise = m_t - demodulated_signal;
mn = -1;
mx = 1;
demodulated_signal( demodulated_signal < mn ) = mn;
demodulated_signal( demodulated_signal > mx ) = mx;
filename= 'Omar Khairat el 2amar.wav'; 
audiowrite(filename,demodulated_signal ,Fs)
% 1
figure(1)
subplot(5,1,1);
plot(t,m_t)
axis([50000 200000 -0.3 0.3])
title('Message');
xlabel('Time');
ylabel('Amplitude');
%2
subplot(5,1,2);
plot(t,demodulated_signal)
axis([50000 200000 -0.3 0.3])
title('Demodulated Signal');
xlabel('Time');
ylabel('Amplitude');
%3
subplot(5,1,3);
plot(t,modulated_LSB)
axis([50000 200000 -0.3 0.3])
title('LSB Modulation');
xlabel('Time');
ylabel('Amplitude');
%4
subplot(5,1,4);
plot(t,modulated_USB)
axis([50000 200000 -0.3 0.3])
title('USB Modulation');
xlabel('Time');
ylabel('Amplitude');
%5 
subplot(5,1,5);
plot(t,signal_noise);
axis([50000 200000 -0.01 0.01])
title('Difference between original and demodulated signal');
xlabel('Time');
ylabel('Amplitude');