clear;
[signal1, Fs1] = audioread('w1.wav');  % reading first message
[signal2, Fs2] = audioread('w2.wav');  % reading second message
h = length(signal1) / Fs1;
t = linspace(0, h, h*Fs1 );
fc = 100000;                         %Carrier Frequency
fs= 250000;
% modulation
c1= cos(2*pi*fc*t);
c1=c1' ;
s1= signal1.* c1; % signal1 multiplied by cos ... I channel
c2= sin(2*pi*fc*t);
c2=c2' ;
s2= signal2.* c2; % signal2 multiplied by sin ... Q channel
s= s1+s2;   % QAM signal 

%demodulation
fn=2*fc/fs;
[a,b] = butter(c,fn,'low');
res1 = 2*s.*c1;  % QAM multiplication with cos signal
Lres1=filter(a,b,res1);  % applying LPF
res2= 2*s.*c2;    % QAM multiplication with sin signal
Lres2=filter(a,b,res2);  % applying LPF

res11= 2*s.*transpose(cos(2*pi*fc*t+40));
%plot(abs(fft(res1)));
%
subplot(2, 1, 1);
plot(res1);
%plot(abs(fft(res1)));
axis([0 200 -1 1]);
title('first message signal recovery before LPF ')
xlabel('time')
ylabel('amplitude')
subplot(2, 1, 2);
plot(res11);
axis([0 200 -1 1]);
title('first message signal recovery before LPF with change in reciver phase')
xlabel('time')
ylabel('amplitude')
%}
